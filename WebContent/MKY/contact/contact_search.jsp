<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>

<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='/Web_Semi/MKY/css/contact_search.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script type="text/javascript" src="/Web_Semi/MKY/js/contact.js"></script>
<title>문의사항</title>
</head>
<body>
<div id='all_wrapper'>
<div id='left'></div>
<div id='contact'>
	<h2>문의사항</h2>
		<div class='column_name'>
			<span class='no'>번호</span>
			<span class='store'>매장명</span>
			<span class='subject'>제목</span>
			<span class='irum'>이름</span>
			<span class='mdate'>날짜</span>
			<span class='hit'>조회수</span>
		</div>
		
		<div class='items'>
			<c:forEach var='vo' items="${list}">
				<div class='item' onclick='contact.view(${vo.serial})'>
					<span class='no'>${vo.serial }</span>
					<span class='store'>${vo.store }</span>
					<span class='subject'>${vo.subject }</span>
					<span class='irum'>${vo.irum }</span>
					<span class='mdate'>${vo.mdate }</span>
					<span class='hit'>${vo.hit }</span>
				</div>
				<hr/>
			</c:forEach>
				<hr/>
		</div>
		
	<form name='frm_contact' id='frm_contact' method='post' action=''>
		<div class='find_zone'>
			<label>
				<input type='radio' name='choice' value='이름'>이름
			</label>
			<label>
				<input type='radio' name='choice' value='제목'>제목
			</label>
			<label>
				<select name="store">
					<option value="all">전체</option>
					<option value="1">강남점</option>
					<option value="2">홍대점</option>
					<option value="3">부산점</option>
				</select>
			</label>
			
			<input type='text' name='findStr' value="${param.findStr }" />
			<input type='button' value='검색' id='btnFind' /> <br/>
			<input type='button' value='글쓰기' id='btnInsert' />
			
			<input type='hidden' name='nowPage' value='${(empty param.nowPage)? 1 : param.nowPage }'/>		
			<input type='hidden' name='serial'  value='${(empty param.serial)? 1 : param.serial }'/>
		</div>
	</form>
	
		<div id='btn_zone'>
			<c:if test="${page.startPage>1 }">	
				<input type='button' id='start' value='<<'  onclick='contact.move(1)'/>
				<input type='button' id='back' value='<' onclick='contact.move(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
				<input type='button' id='num' value='${p }' onclick='contact.move(${p})' />
			</c:forEach>
			
			<c:if test="${page.endPage<page.totPage }">
				<input type='button' id='next' value='>' onclick='contact.move(${page.endPage+1 })'/>
				<input type='button' id='end' value='>>' onclick='contact.move(${page.totPage })'/>
			</c:if>
		</div>
</div>
<div id='right'></div>
</div>
<script type="text/javascript">contact.init()</script>
</body>
</html>