<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		height: 280px;
	}
	
	.detailPage img{
		margin-right: 30px;
	    margin-top: 5px;
	    margin-left: 30px;
	}

</style>
</head>
<body>
	<div id = 'board'>
		<h2>Search</h2>
		<form name = 'frm_board' id = 'frm_board' method = 'post' action =''>		
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
			<c:forEach var="vo" begin ='1' end ='10' varStatus ="x">
				<%-- ${x.index } --%>
		
				<div class = 'item' onclick = 'onDisplay(${x.index})'>
					<span class = 'img'>
						<img src = 'http://placehold.it/150x180'/>
					</span>
					<span class = 'kor'>스플렌더</span>
					<span class = 'eng'>Splendor</span>		
				</div>		
				
				<c:if test ="${x.index%4 eq 0}">		
					<hr/>		
					<div class = 'detailPage'>
						<span class = 'img'>
							<img src = 'http://placehold.it/180x210' align = 'left'/>
						</span>
						<span class = 'bName'>스플렌더 (Splendor)</span><hr/>
						<span class = 'exp'>보석칩으로 카드를 사서 모으는 극강의 두뇌꿀잼게임</span><hr/>
						난이도 <span class = 'diff'>Hard</span>
						인원 <span class = 'person'>2-4인</span>
						게임시간 <span class = 'time'>45분</span>
					</div>
					<hr/>
				</c:if>		
			</c:forEach>
			
			<div class = 'detailPage'>
				<hr/>
				<span class = 'img'>
					<img src = 'http://placehold.it/180x210' align = 'left'/>
				</span>
				<span class = 'bName'>스플렌더 (Splendor)</span><hr/>
				<span class = 'exp'>보석칩으로 카드를 사서 모으는 극강의 두뇌꿀잼게임</span><hr/>
				난이도 <span class = 'diff'>Hard</span>
				인원 <span class = 'person'>2-4인</span>
				게임시간 <span class = 'time'>45분</span>
			</div>
			
		</div>
	</div>
</body>
</html>