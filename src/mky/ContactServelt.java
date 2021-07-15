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
import javax.servlet.http.HttpSession;

import ksy.MemberVo;
import ksy.memberDao;


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
		HttpSession session = req.getSession();
		
		int serial = 0; 
		String store = "";
		
		Page page = new Page(); 
		
		String tempNowPage = req.getParameter("nowPage");
		
		if(req.getParameter("job") != null) { 
			job = req.getParameter("job"); 
		}

		if(!(req.getParameter("findStr") == null || req.getParameter("findStr").equals(" "))) {
			page.setFindStr(req.getParameter("findStr")); 
		}
		
	    if(tempNowPage == null || tempNowPage.equals("")) { 
			page.setNowPage(1); 
	    }else { 
			page.setNowPage(Integer.parseInt(tempNowPage)); 
		}
		  
		if(!(req.getParameter("serial") == null || req.getParameter("serial").equals("")) ){
		  serial = Integer.parseInt(req.getParameter("serial")); }
		 
		if(!(req.getParameter("store") == null || req.getParameter("store").equals("")) ){
			  page.setStore(store); }
	
		  
		switch(job) {
		case "register" :
			
			String id = (String) session.getAttribute("login_id");
			memberDao dao2 = new memberDao();
			MemberVo vo2 = new MemberVo();
			
			vo2.setMid(id);
			
			vo2 = dao2.select(vo2);
			
			url += "contact_register.jsp";
			
			 req.setAttribute("vo", vo2); 
			break;
		
		case "search" :
			url += "contact_search.jsp";
						
			List<ContactVo> list = dao.select(page);
			
			req.setAttribute("list", list);
			req.setAttribute("page", page);
//			System.out.println(list.size());
			break;
			
		case "view" :
			url += "contact_view.jsp";
			vo = dao.view(serial);
			req.setAttribute("vo", vo);
			break;
			
		case "modify" :
			url += "contact_modify.jsp";
			vo = dao.view(serial);
			req.setAttribute("vo", vo);
			break;
			
		case "delete" :
			url += "contact_search.jsp";
			vo = new ContactVo();
			vo.setSerial(serial);
			vo.setMid(req.getParameter("mid"));
			dao.delete(vo);
			
			list = dao.select(page);
			req.setAttribute("list", list);
			break;
			
	}
	
	req.setAttribute("page", page);
	rd = req.getRequestDispatcher(url);
	rd.include(req, resp); //jsp:include를 대신해서
	

		
		
		
	}
	
	@Override
	public void init(ServletConfig config) throws ServletException {
	
	}
	
	
}
