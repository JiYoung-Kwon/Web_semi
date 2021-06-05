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
			
			System.out.println("조회됨");
			
			int serial = sqlSession.selectOne("contact.contact_getSerial");
			
			vo.setSerial(serial);
			
			System.out.println("인설트됨");
			r = sqlSession.insert("contact.contact_insert", vo);
			
			System.out.println("인설트 완료");
			
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

	
	
	//	public ContactVo view(int serial) {
//		ContactVo vo = new ContactVo();
//		
//		try {
//			
//			
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}
//		
//		
//		
//	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
//	public List<ContactVo> select(Page page){
//		List<ContactVo> list = null;
//		
//		try {
//			int totList = sqlSession.selectOne("contact.totList", page.getFindStr());
//			page.setTotList(totList);
//			page.compute();
//			
//			list = sqlSession.selectList("contact.search", page);
//			sqlSession.close();
//		}catch(Exception ex) {
//			ex.printStackTrace();
//		}
//		return list;
//	}

	// board, boardAtt 저장
		// 오류 : 첨부 파일 삭제
}
