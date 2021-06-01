package KJY.board;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardGameDao {
	SqlSession sqlSession;
	
	public BoardGameDao() {
		try {
			sqlSession = MybaFactory.getFactory().openSession();
			
			if(sqlSession == null) {
				System.out.println("sqlSession 생성 시 오류 발생");
			}else {
				System.out.println("정상적으로 sqlSession이 생성됨");
			}
		}catch(Exception ex) {
			ex.printStackTrace();
		}
	}
	
	public List<BoardGameVo> select(Page page){
		List<BoardGameVo> list = null;
		try {
			int totList = sqlSession.selectOne("boardGame.totList", page);
			page.setTotList(totList);
			page.compute();
			System.out.println(totList);
			list = sqlSession.selectList("boardGame.search", page);
			sqlSession.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return list;
	}
	
	
	public static void main(String[] args) {
		new BoardGameDao();
	}
}
