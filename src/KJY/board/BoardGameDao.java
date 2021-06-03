package kjy.board;

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
			System.out.println("totList는 " + totList);
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
	
	public BoardGameVo detail(String bName) {
		BoardGameVo vo = null;
		try {
			vo = sqlSession.selectOne("boardGame.detail",bName);
			sqlSession.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public String insert(BoardGameVo vo) {
		String msg = "OK";
		
		try {
			int r = sqlSession.insert("boardGame.insert",vo);
			if(r>0){
				System.out.println("정상");
				sqlSession.commit();
			}
			
		}catch(Exception ex) {
			sqlSession.rollback();
			msg = ex.toString();
			ex.printStackTrace();
		}
		return msg;
	}
	
	public static void main(String[] args) {
		new BoardGameDao();
	}
}
