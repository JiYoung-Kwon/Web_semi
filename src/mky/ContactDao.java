package mky;

import java.io.File;
import java.util.List;

import org.apache.ibatis.session.SqlSession;


public class ContactDao {
	SqlSession sqlSession;
	
	public ContactDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				//System.out.println("sqlSession 생성시 오류 발생");
			}else {
				//System.out.println("정상적으로 sqlSession이 생성됨.");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	
	
	public List<ContactVo> select(Page page){
		List<ContactVo> list = null;
		
		try { list = sqlSession.selectList("contact.totList", page);
			
			  page.setTotList(list.size());
			  page.compute();
			  
			  list = sqlSession.selectList("contact.search", page);
			  sqlSession.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	public String insert(ContactVo vo) {
		String msg = "입력완료";
		int r = 0;
		int chkCnt = 0;
		try {
			int serial = sqlSession.selectOne("contact.contact_getSerial");
			vo.setSerial(serial);
			r = sqlSession.insert("contact.contact_insert", vo);
			
			if(r>0) {
				chkCnt = 0; //첨부파일의 수만큼 실행된 쿼리의 수
				for(ContactAttVo v : vo.getAttList()) {
					v.setpSerial(serial);
					chkCnt += sqlSession.insert("contact.contactAtt_insert", v);
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
//			System.out.println("r=" + r);
//			System.out.println("chkCnt=" + chkCnt);
			ex.printStackTrace();
			sqlSession.rollback();
			
			for(ContactAttVo delVo : vo.getAttList()) {
				File f = new File(ContactFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		sqlSession.close();
		return msg;
	}

	
	
	public ContactVo view(int serial) {
	ContactVo vo = new ContactVo();
	
	try {
		sqlSession.update("contact.contact_hitUp", serial);
		sqlSession.commit();
		
		vo = sqlSession.selectOne("contact.contact_view", serial);
		List<ContactAttVo> attList = sqlSession.selectList("contact.contactAtt_view", serial);
		sqlSession.commit();
		vo.setAttList(attList);
		
	}catch(Exception ex) {
		ex.printStackTrace();
	}
	
	sqlSession.close();
	return vo;
	
	}
	
	public String update(ContactVo vo) {
		String msg = "수정되었습니다.";
		int r = 0;
		int chkCnt = 0;
		
		try {
			r = sqlSession.update("contact.contact_update", vo);
			sqlSession.commit();
			
			if(r<1) throw new Exception();
			if(vo.getAttList() != null) {
				for(ContactAttVo v : vo.getAttList()) {
					v.setpSerial(vo.getSerial());
					chkCnt += sqlSession.insert("contact.contactAtt_insert", v);
				}
				
				if(chkCnt == vo.getAttList().size()) {
					for(ContactAttVo delVo : vo.getDelList()) {
						sqlSession.delete("contact.contactAtt_delete2", delVo.getSysAtt());
						sqlSession.commit();
						File f = new File(ContactFileUpload.saveDir + delVo.getSysAtt());
						if(f.exists()) f.delete();
					}
					sqlSession.close();
				}else {
					throw new Exception();
				}
				
			} //첨부파일 유무로 수정
		}catch(Exception ex) {
			ex.printStackTrace();
			msg = ex.toString();
			sqlSession.rollback();
			for(ContactAttVo delVo : vo.getAttList()) {
				File f = new File(ContactFileUpload.saveDir + delVo.getSysAtt());
				if(f.exists()) f.delete();
			}
		}
		sqlSession.close();
		return msg;
	}
	
	public String delete(ContactVo vo) {
		String msg = "삭제가 완료되었습니다.";
		List<ContactAttVo> delList = null;
		
		try {
			delList = sqlSession.selectList("contact.contact_att_list" , vo.getSerial());
			System.out.println("delList size = " + delList.size());
			
			int r = sqlSession.delete("contact.contact_delete", vo);
			System.out.println("r = " + r);
			if(r>0) {
				r = sqlSession.delete("contact.contactAtt_delete", vo.getSerial());
				if(vo.getAttList() == null || r == vo.getAttList().size()) {
					sqlSession.commit();
					for(ContactAttVo v : delList) {
						File f = new File(ContactFileUpload.saveDir + v.getSysAtt());
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
	
