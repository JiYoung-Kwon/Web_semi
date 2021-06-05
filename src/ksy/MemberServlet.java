package ksy;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(urlPatterns = "/member.do")
public class MemberServlet extends HttpServlet {
	memberDao dao;
	RequestDispatcher rd;
	String job = "login";

	int r;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		resp.setContentType("text/html;charset=utf-8");

		String url = "./KSY/"; // url 작성
		MemberVo vo = null; // Vo 객체 생성
		dao = new memberDao(); // Dao 생성
		HttpSession session = req.getSession(); // session 생성

		if (req.getParameter("job") != null) {
			job = req.getParameter("job");
		}

		switch (job) {
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

			if (r > 0) {
				url += "login/login.jsp";
			} else {
				
				url += "member/register.jsp"; // 오류날 경우 알려주고 register에 머무른다. (오류 처리하기 ---- 아직 안함 ex)아이디 중복값 처리 )
				req.setAttribute("vo", vo);
			}
			break;

		case "register":
			url += "member/register.jsp";
			break;

		case "login_chk":
			String chk_id = req.getParameter("mid"); // 처음 로그인시 check하기 위해 받는값
			String chk_pwd = req.getParameter("pwd");

			vo = new MemberVo();

			vo.setMid(chk_id);
			vo.setPwd(chk_pwd);

			r = dao.login(vo);
			if (r > 0) {
				session.setAttribute("login_id", chk_id); // check 후 일치하면 session에 저장
				session.setAttribute("login_pwd", chk_pwd);
			}
			url = "./main.jsp";
			break;

		case "login":
			String id = (String) session.getAttribute("login_id"); // 로그인 상태인 아이디값 가져오기
			String pwd = (String) session.getAttribute("login_pwd");

			if (session.getAttribute("login_id") == null) {
				url += "login/login.jsp";
			} else {
				MemberVo vo2 = new MemberVo();
				vo2.setMid(id);
				vo2.setPwd(pwd);
				vo = dao.select(vo2);

				url += "login/myPage.jsp";
				req.setAttribute("vo", vo);
			}
			break;

		case "logout":
			session.removeAttribute("login_id");
			session.removeAttribute("login_pwd"); // 로그아웃 버튼 클릭시 session에 저장된 id, pwd 값을 삭제한다.
			url += "login/login.jsp";
			break;

		case "update":

			MemberVo vo2 = new MemberVo();

			vo2.setMid(req.getParameter("mid"));
			vo2.setPhone(req.getParameter("phone"));
			vo2.setPost(req.getParameter("post"));
			vo2.setAddress(req.getParameter("address"));
			vo2.setAddress2(req.getParameter("address2"));
			vo2.setEmail(req.getParameter("email"));
			vo2.setHost(req.getParameter("host"));

			vo = dao.update(vo2);

			url += "login/myPage.jsp";
			req.setAttribute("vo", vo);

			break;
		case "register_chkid":    // 아이디 중복값 처리하기

			
			
			MemberVo vo3 = new MemberVo();

			vo3.setMid(req.getParameter("id"));
			
		    r = dao.chk_id(vo3);
		   if (r>0) {
			   
		   }
		    
		    
			break;
			
		case "pwd_update":
			url += "member/register.jsp";
		break;
		}

		rd = req.getRequestDispatcher(url);
		rd.include(req, resp);

	}

}
