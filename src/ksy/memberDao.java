package ksy;

import java.util.List;

import org.apache.ibatis.session.SqlSession;


public class memberDao {
	SqlSession sqlSession;
	
	public memberDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			//MybaFactory 클래스의 getFactory() 메서드를 통하여 SqlSessionFactory객체를 가져오고 이 객체의 openSession()를 호출하여 받은 리턴값을 저장한다.
			
			if(sqlSession == null) {	//sqlSession에 데이터가 있다면 정상 저장됨을 출력
				System.out.println("sqlSession 생성시 오류 발생");
			}else {
				System.out.println("정상적으로 sqlSession이 생성됨");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
public int insert(MemberVo vo) {
		int r=0;
		try {
			r = sqlSession.insert("member.insert", vo); 
			if(r>0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();				
			}
		}catch(Exception ex) {
			ex.printStackTrace();
			
		}
		sqlSession.close();
		return r;
		
	}


	
	
	
	
}
