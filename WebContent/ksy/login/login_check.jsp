<%@page import="ksy.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="ksy.MemberVo" scope="request"/>
<jsp:setProperty property="*" name="vo"/>

<% 
 	String msg = "";
	memberDao dao = new memberDao();
	
	int r = dao.login(vo);
	if (r > 0) {
		session.setAttribute("login_id", vo.getMid()); // check 후 일치하면 session에 저장
		session.setAttribute("login_pwd", vo.getPwd());
		
		msg = "로그인 성공";
	}else {
		msg = "회원정보가 일치하지 않습니다."; 
	}
	
	out.print(msg);
%>