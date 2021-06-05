package pjh;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ReViewDao {
	SqlSession sqlSession;
	
	public ReViewDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("sqlSession 생성중 오류 발생");
			}else {
				System.out.println("sqlSession이 정상적으로 생성됨");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<ReViewVo> select(Page page){
		List<ReViewVo> list = null;
		
		try {
			int totList = sqlSession.selectOne("review.totList", page.getFindStr());
			page.setTotList(totList);
			page.compute();
			/*
			 * System.out.println(page.startNo); System.out.println(page.endNo);
			 */
			list = sqlSession.selectList("review.search", page);
			sqlSession.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public ReViewVo view(int serial) {
		ReViewVo vo = new ReViewVo();
			
		try {
			sqlSession.update("review.rev_hitUp", serial);
			sqlSession.commit();
			
			vo = sqlSession.selectOne("review.rev_view", serial);
			List<ReViewAttVo> attList = sqlSession.selectList("review.revAtt_view", serial);
			sqlSession.commit();
			vo.setAttList(attList);
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		sqlSession.close();		
		return vo;
	}
	
	public String insert(ReViewVo vo) {
		String msg = "입력완료";
		try {
			int serial = sqlSession.selectOne("review.rev_getSerial");
			vo.setSerial(serial);
			int r = sqlSession.insert("review.rev_insert", vo);
			
			if(r>0) {
				int chkCnt = 0;
				for(ReViewAttVo v : vo.getAttList()) {
					v.setpSerial(serial);
					chkCnt += sqlSession.insert("review.revAtt_insert", v);
				}
				if(chkCnt == vo.getAttList().size()) {
					sqlSession.commit();
				}else {
					throw new Exception();
				}
			}else {
				throw new Exception();
			}
			
			
		}catch(Exception ex) {
			msg = ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
			
			for(ReViewAttVo delVo : vo.getAttList()) {
				File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		
		sqlSession.close();
		return msg;

	}
	
	public String update(ReViewVo vo) {
		String msg = "수정되었습니다.";
		int r = 0;
		int chkCnt = 0;
		
		try {
			r = sqlSession.update("review.rev_update", vo);
			sqlSession.commit();

			if(r < 1) throw new Exception();
			chkCnt = 0;
			if(vo.getAttList() != null) {
				for(ReViewAttVo v : vo.getAttList()) {
					System.out.println("chkcnt " +chkCnt);
					v.setpSerial(vo.getSerial());
					chkCnt += sqlSession.insert("review.revAtt_insert", v);
					sqlSession.commit();
				}
				
				if(chkCnt == vo.getAttList().size()) {
					for(ReViewAttVo delVo : vo.getDelList()) {
						sqlSession.delete("review.revAtt_delete2", delVo.getSysAtt());
						sqlSession.commit();
						File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
						if(f.exists()) f.delete();
					}
					sqlSession.close();
				}else {
					throw new Exception();
				}
			} //첨부파일 유무로 수정
		}catch(Exception ex) {
			ex.printStackTrace();
			System.out.println("r=" + r);
			System.out.println("chkCnt=" + chkCnt);
			msg = ex.toString();
			ex.printStackTrace();
			sqlSession.rollback();
			for(ReViewAttVo delVo : vo.getAttList()) {
				File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		sqlSession.close();
		return msg;
	}
	
	public String delete(ReViewVo vo) {
		String msg = "삭제가 완료되었습니다.";
		List<ReViewAttVo> delList = null;
		
			try {
				delList = sqlSession.selectList("review.rev_att_list",vo.getSerial());
				System.out.println("delList size = " + delList.size());
				
				int r = sqlSession.delete("review.rev_delete", vo);
				System.out.println("r = " + r);
				if(r > 0) {
					r = sqlSession.delete("review.revAtt_delete", vo.getSerial());
					if(vo.getAttList() == null || r == vo.getAttList().size()) {
						sqlSession.commit();
						for(ReViewAttVo v : delList) {
							File f = new File(ReViewFileUpload.saveDir + v.getSysAtt());
							if(f.exists()) f.delete();
						}
					}else {
						throw new Exception();
					}
				}else {
					throw new Exception();
				}
			}catch(Exception ex) {
				sqlSession.rollback();
				ex.printStackTrace();
				msg = ex.toString();
			}
		return msg;
	}


}
