<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
</head>
<body>
<%
	//기본 include 페이지
	//String border = "./member/search.jsp";
	String border = "./review.do";
	//읽어올 페이지의 경로를 변수에 담아 두었다.
	
	request.setAttribute("border", border);
%>
<div id='middle'>
	<div id='border'></div>
</div>

</body>

	<script>
		$('#border').load('${border}', 'job=search');
		//border의 영역에 servlet으로 불러온 결과를 load한다.
	</script>
</html>