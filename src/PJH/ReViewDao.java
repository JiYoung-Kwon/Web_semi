package PJH;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class ReViewDao {
	SqlSession sqlSession;
	
	public ReViewDao() {
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
	
	public List<ReViewVo> select(Page page){
		List<ReViewVo> list = null;
		
		try{
			int totList = sqlSession.selectOne("board.totList", page.getFindStr());
			page.setTotList(totList);
			page.compute();
			list = sqlSession.selectList("board.search", page);
			sqlSession.close();
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
}
