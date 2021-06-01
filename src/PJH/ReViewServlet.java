package PJH;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/review.do")
public class ReViewServlet extends HttpServlet {
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
		
		if(req.getParameter("serial") != null) {
			serial = Integer.parseInt(req.getParameter("serial"));
		}


		req.setAttribute("page", page);
		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);
		
	}

}


