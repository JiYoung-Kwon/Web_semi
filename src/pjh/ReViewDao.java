package pjh;

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
			page.compute();
			list = sqlSession.selectList("review.search", page);
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	

}
