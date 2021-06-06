<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src='./lib/jquery-3.6.0.min.js'></script>
<title>Insert title here</title>
</head>
<body>
<%

	String review = "./review.do";
	
	request.setAttribute("./review.do", review);
%>
<div id="middle">
		<div id="middle_main">
		</div>
</div>

<script>
	$('#middle_main').load('${review}', 'job=search');
	//border의 영역에 servlet으로 불러온 결과를 load한다.
</script>
</body>
</html>