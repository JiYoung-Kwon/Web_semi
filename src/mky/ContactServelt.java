package mky;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mky.ContactVo;
import mky.Page;

@WebServlet(urlPatterns = "/contact.do")
public class ContactServelt extends HttpServlet{
	ContactDao dao;
	RequestDispatcher rd;
	String job = "search";
	
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
		ContactVo vo = null;
		String url = "./MKY/contact/";
		dao = new ContactDao();
		
		
		if(req.getParameter("job") != null) { job = req.getParameter("job"); }

		/*
		 * int serial = 0; Page page = new Page(); String tempNowPage =
		 * req.getParameter("nowPage");
		 * 
		 * if(req.getParameter("findStr") != null) {
		 * page.setFindStr(req.getParameter("findStr")); }
		 * 
		 * if(tempNowPage == null || tempNowPage.equals("")) { page.setNowPage(1); }else
		 * { page.setNowPage(Integer.parseInt(tempNowPage)); }
		 * 
		 * if(!(req.getParameter("serial") == null ||
		 * req.getParameter("serial").equals("")) ){ serial =
		 * Integer.parseInt(req.getParameter("serial")); }
		 */
		
		switch(job) {
		case "register" :
			url += "contact_register.jsp";
			
			/* req.setAttribute("page", page); */
			break;
		case "search" :
			url += "contact_search.jsp";
			
			break;
	}

	rd = req.getRequestDispatcher(url);
	rd.include(req, resp); //jsp:include를 대신해서
	

		
		
		
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
	
	}
	
	
}