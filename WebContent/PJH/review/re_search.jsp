<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/re_search.css'>
<head>
<title>ReView_Page</title>
</head>
<body>
<%
	String login_id = (String)session.getAttribute("login_id");
	String login_pwd = (String)session.getAttribute("login_pwd");
%>
<div id='review'>
	<h2>리뷰 서치 페이지입니다</h2>
	
	<form name='frm_review' id='frm_review' method='post' action=''>
		
		<c:if test='${not empty sessionScope.login_id}'>
			<input type='button' id='btnInsert' value='작성'/>
		</c:if>
		
		<div class='find_zone'>
			<input type='search' name='findStr' value='${param.findStr }'/>
			<input type='button' value='검색' id='btnFind'/>
		</div>
		<br/>
		
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='serial' value='${param.serial }'/>
		
	</form>
	
	<div class='title'>
		<span class='no'>순번</span>
		<span class='gubun'>지점</span>
		<span class='subject'>제목</span>
		<span class='date'>작성일</span>
		<span class='mid'>작성자</span>
		<span class='hit'>조회수</span>
	</div>

	<div class='items'>
		<c:forEach var='vo' items="${list}">
			<div class='item' onclick="rev.view('${vo.serial}')">
				<span class='no'>${vo.rno }</span>
				<span class='gubun'>${vo.gubun }</span>
				<span class='subject'>${vo.subject }</span>
				<span class='date'>${vo.mdate }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='hit'>${vo.hit }</span>
			</div>
		</c:forEach>
	</div>

	<div id='btn_zone'>
		<c:if test="${page.startPage>1 }">
			<input type='button' value='맨처음' onclick='rev.move(1)'/>
			<input type='button' value='이전' onclick='rev.move(${page.startPage-1})'/>
		</c:if>
		
		<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
			<input type='button' value='${p }' onclick='rev.move(${p})'/>
		</c:forEach>
		
		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' onclick='rev.move(${page.endPage+1})'/>
			<input type='button' value='맨끝' onclick='rev.move(${page.totPage})'/>
		</c:if>
	</div>

</div>
<script>rev.init();</script>
</body>
</html>
