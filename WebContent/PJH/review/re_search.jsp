<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/review.css'>
<head>
<title>ReView_Page</title>
</head>
<body>
<div id='review'>
	<h1>리뷰 서치 페이지입니다</h1>
	
	<form name='frm_review' id='frm_review' method='post' action=''>
		<input type='button' id='btnInsert' value='작성'/>

		<div class='find_zone'>
			<input type='search' name='findStr' value='${param.findStr }'/>
			<input type='button' value='검색' id='btnFind'/>
		</div>
		
		<input type='text' name='nowPage' value='${param.nowPage }'/>
		<input type='text' name='serial' value='${param.serial }'/>
		
	</form>
	
	<hr/>
	
	<div class='title'>
		<span class='gubun'>지점</span>
		<span class='no'>순번</span>
		<span class='subject'>제목</span>
		<span class='date'>작성일</span>
		<span class='mid'>작성자</span>
		<span class='hit'>조회수</span>
	</div>

	<!-- 샘플 내용 DB에서 끌어다가 적을 공간
	<div class='items'>
	<c:forEach var='vo' items="${list}">
		<div class='item' onclick="brd.view('${vo.serial}')">
				<span class='no'>${vo.serial }</span>
				<span class='subject'>${vo.subject }(${vo.attCnt})</span>
				<span class='date'>${vo.mdate }</span>
				<span class='mid'>${vo.mid }</span>
				<span class='hit'>${vo.hit }</span>
		</div>
	</c:forEach>

	</div>
 
 	<div id='btn_zone'>
		<c:if test="${page.startPage>1 }">
			<input type='button' value='맨처음' onclick='brd.move(1)'/>
			<input type='button' value='이전' onclick='brd.move(${page.startPage-1})'/>
		</c:if>
		
		<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
			<input type='button' value='${p }' onclick='brd.move(${p })'/>
		</c:forEach>
		
		<c:if test="${page.endPage<page.totPage }">
			<input type='button' value='다음' onclick='brd.move(${page.endPage+1 })'/>
			<input type='button' value='맨끝' onclick='brd.move(${page.totPage })'/>
		</c:if>
	</div>

-->

	<div class='items'  onclick='rev.view()'>
		<div class='item'>
				<span class='gubun'>붓산</span>
				<span class='no'>1</span>
				<span class='subject'>제목1</span>
				<span class='date'>날짜1~</span>
				<span class='mid'>아이디1~</span>
				<span class='hit'>조회수~</span>
		</div>
		
		<div class='item'>
				<span class='gubun'>서울</span>
				<span class='no'>2</span>
				<span class='subject'>제목2</span>
				<span class='date'>날짜2~</span>
				<span class='mid'>아이디2~</span>
				<span class='hit'>조회수~</span>
		</div>
		
		<div class='item'>
				<span class='gubun'>대전</span>
				<span class='no'>3</span>
				<span class='subject'>제목4</span>
				<span class='date'>날짜4~</span>
				<span class='mid'>아이디4~</span>
				<span class='hit'>조회수~</span>
		</div>
	</div>

	<div id='btn_zone'>
			<input type='button' value='맨처음' onclick=/>
			<input type='button' value='이전' onclick=/>
		
			<input type='button' value='1' onclick=/>
			<input type='button' value='2' onclick=/>
			<input type='button' value='3' onclick=/>
		
			<input type='button' value='다음' onclick=/>
			<input type='button' value='맨끝' onclick=/>
	</div>

</div>
<script>rev.init();</script>
</body>
</html>
