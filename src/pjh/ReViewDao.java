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
             
			if(r < 1) throw new Exception();
			chkCnt = 0;
			for(ReViewAttVo v : vo.getAttList()) {
				v.setpSerial(vo.getSerial());
				chkCnt += sqlSession.insert("review.revAtt_insert", v);
			}
			
			if(chkCnt == vo.getAttList().size()) {
				for(ReViewAttVo delVo : vo.getDelList()) {
					sqlSession.delete("review.revAtt_delete2", delVo.getSysAtt());
					File f = new File(ReViewFileUpload.saveDir + delVo.getSysAtt());
					if(f.exists()) f.delete();
				}
				sqlSession.close();
			}else {
				throw new Exception();
			}
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


}
