package pjh;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/review.do")
public class ReviewServlet extends HttpServlet {
	ReViewDao dao;
	RequestDispatcher rd;
	String job = "search";
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		job = "search";
		doPost(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		ReViewVo vo = null;

		String url = "./PJH/review/";
		
		dao = new ReViewDao();
		
		int serial = 0;
		Page page = new Page();
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		
		if(req.getParameter("findStr") != null) {
			page.setFindStr(req.getParameter("findStr"));
		}
		
		if(tempNowPage == null || tempNowPage.equals("")) {
			page.setNowPage(1);
		}else {
			page.setNowPage(Integer.parseInt(tempNowPage));
		}
		
		if(!(req.getParameter("serial") == null || req.getParameter("serial").equals("")) ){
			serial = Integer.parseInt(req.getParameter("serial"));
		}
		
		switch(job) {
		case "search"	:
			url += "re_search.jsp";
			
			List<ReViewVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			break;
			
		case "view"		:
			url += "view.jsp";
			vo = dao.view(serial);
			
			req.setAttribute("vo", vo);
			break;
		}
		
		req.setAttribute("page", page);
		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);
		
	}
	
	@Override
	public void init() throws ServletException {
	
	}
	
	
}
