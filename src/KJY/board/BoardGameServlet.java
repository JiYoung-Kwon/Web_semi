package KJY.board;

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
	String job= "search";
	String bName = "";
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job="search";
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html; charset=utf-8");
		
		String url = "./KJY/board/";
		dao = new BoardGameDao();
		
		Page page = new Page();
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		
		if(req.getParameter("bName") != null){
			bName = req.getParameter("bName");
		}
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));
		}
		
		
		if(tempNowPage == null || tempNowPage.equals("")) {
			page.setNowPage(1);
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage));
		}
		
		switch(job) {
		case "search":
			url += "search.jsp";
			List<BoardGameVo> list = dao.select(page);
			req.setAttribute("list", list);
			
			break;
			
		case "detail":
			url += "detail.jsp";
			BoardGameVo vo = dao.detail(bName);
			req.setAttribute("vo", vo);
			break;
		}
		
		req.setAttribute("page", page);
		
		disp= req.getRequestDispatcher(url);
		disp.include(req, resp);
	}

}
