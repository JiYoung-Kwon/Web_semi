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
	    margin-bottom : 0px;
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
				<input type = 'search' name = 'findStr' placeholder="게임 이름을 입력하세요." value = '${param.findStr }'/>
				<input type = 'button' value = '검색' id = 'btnFind'/>
				<br/>
				
				<label>매장 선택</label>
				<input type = 'hidden' value = '${page.store}' id = 'h_store'/>
				<select id="game-store" name="game-store">				
					<option value="">전국매장</option>				
					<option value="강남">강남</option>				
					<option value="홍대">홍대</option>				
					<option value="부산">부산</option>	
				</select>
				
				<label>장르</label>
				<input type = 'hidden' value = '${page.genre}' id = 'h_genre'/>
				<select id="game-genre" name="game-genre">				
					<option value="">전체</option>				
					<option value = "전략">전략</option>
					<option value = "추리">추리</option>
					<option value = "배팅">배팅</option>
					<option value = "복불복">복불복</option>
					<option value = "순발력">순발력</option>
				</select>
			</div>
			<input type = 'text' name = 'oriAtt' value = '${oriAtt}'/>
			<input type = 'text' name = 'sysAtt' value = '${sysAtt}'/>
			<input type = 'text' name = 'nowPage' value = '${(empty param.nowPage) ? 1: param.nowPage }'/>
			<input type = 'text' name = 'serial' value = '${(empty param.serial) ? 1: param.serial }'/>
		</form>
		
		<hr>
		<div class = 'items'>
			<c:forEach var="vo" items= "${list }" varStatus ="x">
				<%-- ${x.index } --%>
				<div class = 'item' onclick = "onDisplay(${x.index},'${vo.bName }')">
					<span class = 'img'>
						<img src = '/Web_Semi/KJY/upload/${vo.sysAtt }' width = '150px' height = '180px'/>
					</span>
					<span class = 'bName'>${vo.bName }</span>
					<span class = 'eName'>${vo.eName }</span>	

				</div>		
				
				<!-- 4줄 기준으로, 세부 정보 div -->
				<c:set var ="size" value = "${fn:length(list)-1}"/>
				<c:if test ="${((x.index+1)%4 eq 0) or (x.index eq size)}">		
					<hr/>		
					<div class = 'detailPage'>
					</div>
	
					<hr/>
				</c:if>		
			</c:forEach>
		</div>
		
		<br/>
		<div id = 'btn_zone'>
			<c:if test="${page.startPage > 1 }">
				<input type='button' value = '맨첨' onclick='brd.move(1)'/>
				<input type='button' value = '이전' onclick='brd.move(${page.startPage-1})'/>
			</c:if>
			
			<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
				<input type='button' value = '${p }' onclick = 'brd.move(${p})'/>
			</c:forEach>
			
			<c:if test = "${page.endPage<page.totPage }">
				<input type='button' value = '다음' onclick = 'brd.move(${page.endPage+1 })'/>
				<input type='button' value = '맨끝' onclick = 'brd.move(${page.totPage })'/>
			</c:if>			
		</div>
	</div>
	<script>
		$(function(){
			var chk = document.getElementsByName('game-store');
			var chk2 = document.getElementsByName('game-genre');
	
			var gubun = document.getElementById('h_store');
			var gubun2 = document.getElementById('h_genre');
	
			for (var i in chk){
				if(chk[i].value == gubun.Value){
					$("#game-store").val(gubun.value).attr("selected", "selected");
				}
			}
	
			for (var i in chk2){
				if(chk2[i].value == gubun2.Value){
					$("#game-genre").val(gubun2.value).attr("selected", "selected");
				}
			}
		});
	</script>
</body>
</html>