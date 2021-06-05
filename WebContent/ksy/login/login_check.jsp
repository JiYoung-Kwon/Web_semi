<%@page import="ksy.memberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="vo" class="ksy.MemberVo" scope="request"/>
<jsp:setProperty property="*" name="vo"/>

<%   // bean 태그를 쓰지 않을경우 request로 전부 받아와야한다.
 	String msg = "";

	memberDao dao = new memberDao();
	int r = dao.chk_id(vo);
	
	if(r>0){
		msg = "중복된 아이디입니다.";		
	}else{
		msg = "사용 가능한 아이디";		
	}
	out.print(msg); //옵션
%>