<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BoardGame search</title>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src = '/Web_Semi/KJY/board/board.js'></script>
<style>
	#board {
		min-width: 1000px;
	}
	.item span{
		display :block;
	}
	
	.item {
		display : inline-block;
	}
	
	.detailPage{
		display : none;
		height: 300px;
		padding-bottom:65px;
		margin-bottom:45px;
	}
	
	.detailPage img{
		margin-right: 30px;
	    margin-top: 5px;
	    margin-left: 30px;
	    margin-bottom : 40px;
	}
	
	.oneLineReview{
		padding-top:30px;
	}

</style>
</head>
<body>
	<div id = 'board'>
		<h2>Search</h2>
		<form name = 'frm_board' id = 'frm_board' method = 'post' action =''>	
			<input type = 'button' value = '작성' id = 'btnRegister'/>
			
			<!-- 보드게임 검색 -->
			<div class = 'find_zone'>
				<label>게임 이름</label>
				<input type = 'search' name = 'findStr' placeholder="게임 이름을 입력하세요." value = ''/>
				<input type = 'button' value = '검색' id = 'btnFind'/>
				<br/>
				
				<label>매장 선택</label>
				<select id="game-store" name="game-store">				
					<option value="">전국매장</option>				
					<option value="1">강남</option>				
					<option value="2">홍대</option>				
					<option value="3">부산</option>	
				</select>
				
				<label>장르</label>
				<select id="game-genre" name="game-genre">				
					<option value="">전체</option>				
					<option value="1">추리</option>				
					<option value="2">전략</option>				
					<option value="3">퍼즐</option>	
				</select>
			</div>
		</form>
		
		<hr>
		<div class = 'items'>
			<c:forEach var="vo" items= "${list }" varStatus ="x">
				${x.index }
				<div class = 'item' onclick = "onDisplay(${x.index},'${vo.bName }')">
					<span class = 'img'>
						<img src = 'http://placehold.it/150x180'/>
					</span>
					<span class = 'bName'>${vo.bName }</span>
					<span class = 'eName'>${vo.eName }</span>	

				</div>		
				
				<!-- 4줄 기준으로, 세부 정보 div -->
				<c:set var ="size" value = "${fn:length(list)-1}"/>
				<c:if test ="${((x.index+1)%4 eq 0) or (x.index eq size)}">		
					<hr/>		
					<div class = 'detailPage'>
						안녕하세요!!!
					</div>
	
					<hr/>
				</c:if>		
			</c:forEach>
		</div>
		
		<br/>
		<div id = 'btn_zone'>
			<input type ='button' value ='맨첨'/>
			<input type ='button' value ='이전'/>
			<input type ='button' value ='1'/>
			<input type ='button' value ='2'/>
			<input type ='button' value ='3'/>
			<input type ='button' value ='다음'/>
			<input type ='button' value ='맨끝'/>
		</div>
	</div>
</body>
</html>