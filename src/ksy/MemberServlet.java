package ksy;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet {
	memberDao dao;
	RequestDispatcher rd;
	String job = "search";
	int r;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");
		
	
		MemberVo vo = null;
		
		String url = "./KSY/";
		dao = new memberDao();
		
		if(req.getParameter("job") != null) {
			job = req.getParameter("job");
		}
		
		
		/*
		 * if(req.getParameter("findStr") != null) {
		 * page.setFindStr(req.getParameter("findStr")); }
		 */
		System.out.println("여기까지 됨");
		switch(job) {
		case "insert":
			vo = new MemberVo();
			vo.setMid(req.getParameter("mid"));
			vo.setIrum(req.getParameter("irum"));
			vo.setPwd(req.getParameter("pwd"));
			vo.setPhone(req.getParameter("phone"));
			vo.setPost(req.getParameter("post"));
			vo.setAddress(req.getParameter("address"));
			vo.setAddress2(req.getParameter("address2"));
			vo.setEmail(req.getParameter("email"));
			vo.setHost(req.getParameter("host"));
			r = dao.insert(vo);
			
			if(r>0) {
				url += "login/login.jsp";
			}else {
				url += "member/register.jsp";	
			}
			
		break;
		case "register":
			url += "member/register.jsp";
		break;
		}
		
		System.out.println(job);
		System.out.println(url);
		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);
		
	}

}


