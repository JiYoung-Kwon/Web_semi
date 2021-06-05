package kjy.board;

import java.io.File;
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
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return vo;
	}
	
	public List<OneLineVo> oneline(Page page) {
		List<OneLineVo> list = null;
		try {
			int totList = sqlSession.selectOne("boardGame.onelineList", page);
			System.out.println("totList는 " + totList);
			page.setTotList(totList);
			page.compute();
			
			list = sqlSession.selectList("boardGame.oneline", page);
			sqlSession.close();
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		return list;
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
	
	public String delete(BoardGameVo vo) {
		String msg = "OK";
		
		try {	
			//boardGame 테이블 삭제
			int r = sqlSession.delete("boardGame.delete",vo.getbName());
			
			if(r>0) { // 정상이면 첨부파일 삭제		
				File f = new File(BoardFileUpload.saveDir + vo.getSysAtt());
				if(f.exists()) f.delete();				
			}		
			sqlSession.commit();
		}catch(Exception ex) {
			ex.printStackTrace();
			sqlSession.rollback();
		}
		
		return msg;
	}
	
	public String update(BoardGameVo vo) {
		String msg = "OK";
		
		try {
			BoardGameVo vo1 = sqlSession.selectOne("boardGame.detail",vo.gubun);
			//boardGame 테이블 수정
			int r = sqlSession.update("boardGame.update",vo);
			
			if(r>0) {
				File file = new File(BoardFileUpload.saveDir +  vo1.getSysAtt());
				if(file.exists()) file.delete();
				
				sqlSession.commit();
			}else {
				System.out.println("수정 안됨");
				sqlSession.rollback();
			}
			
			
		}catch(Exception ex) {
			ex.printStackTrace();
		}
		
		return msg;
	}
	
	public static void main(String[] args) {
		new BoardGameDao();
	}
}
