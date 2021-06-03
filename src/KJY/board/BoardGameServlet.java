package kjy.board;
import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/boardGame")
public class BoardGameServlet extends HttpServlet {
	BoardGameDao dao;
	RequestDispatcher disp;
	int isClicked = 0;
	String job= "search";
	String bName = "";

	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job="search";
		isClicked= 0;
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		BoardGameVo vo = new BoardGameVo();
		
		String url = "./KJY/board/";
		dao = new BoardGameDao();
		
		Page page = new Page();
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("isClicked") != null){
			isClicked = Integer.parseInt(req.getParameter("isClicked"));
		}
		
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));
		}
			
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		
		if(req.getParameter("bName") != null){
			bName = req.getParameter("bName");
			vo.setbName(bName);
		}
		
		if(req.getParameter("eName") != null) {
			vo.seteName(req.getParameter("eName"));
		}
		
		if(req.getParameter("expl") != null){
			vo.setExpl(req.getParameter("expl"));
		}
		if(req.getParameter("diff") != null) {
			vo.setDiff(req.getParameter("diff"));
		}
		
		if(req.getParameter("minPerson") != null){
			vo.setMinPerson(Integer.parseInt(req.getParameter("minPerson")));
		}
		if(req.getParameter("maxPerson") != null) {
			vo.setMaxPerson(Integer.parseInt(req.getParameter("maxPerson")));
		}
		
		if(req.getParameter("minTime") != null){
			vo.setMaxTime(Integer.parseInt(req.getParameter("minTime")));
		}
		if(req.getParameter("maxTime") != null){
			vo.setMaxTime(Integer.parseInt(req.getParameter("maxTime")));
		}
		if(req.getParameter("game-store") != null){
			vo.setStore(req.getParameter("game-store"));
			page.setStore(req.getParameter("game-store"));
		}
		if(req.getParameter("game-genre") != null){
			vo.setGenre(req.getParameter("game-genre"));
			page.setGenre(req.getParameter("game-genre"));
		}
		

		if(tempNowPage == null || tempNowPage.equals("")) {
			page.setNowPage(1);
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage));
		}
		
		switch(job) {
		case "search":
			url += "search.jsp";
			System.out.println(page.getStore());
			List<BoardGameVo> list = dao.select(page);
			
			System.out.println("리스트 검색은" + list.size());
			
			req.setAttribute("list", list);
			
			break;
			
		case "detail":
			url += "detail.jsp";
			vo = dao.detail(bName);
			int clickNum = isClicked;
			//System.out.println(clickNum);
			System.out.println(Integer.toString(clickNum));
			req.setAttribute("vo", vo);
			req.setAttribute("clickNum", Integer.toString(clickNum));
			break;
			
		case "register":
			url += "search.jsp";
			String msg = dao.insert(vo);
			System.out.println(msg);
			
			list = dao.select(page);
			System.out.println("list는 " + list.size());
			req.setAttribute("list", list);	
			break;
		}
		
		req.setAttribute("page", page);
		
		disp= req.getRequestDispatcher(url);
		disp.include(req, resp);
	}

}
