<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src = '/Web_Semi/KJY/board/board.js'></script>

</head>
<body>
	<div id='detail'>
		<script>checkClick(${clickNum });</script>
			<span class='img'>
				<img src='http://placehold.it/250x300' align='left' />
			</span> 
			<span class='TotalName'>${vo.bName } (${vo.eName})</span>
			<hr />
			<span class='expl'>${vo.expl }</span>
			<hr />
			난이도 <span class='diff'>${vo.diff }</span> 
			인원 <span class='person'>${vo.minPerson }-${vo.maxPerson }인</span>
			게임시간 <span class='time'>${vo.minTime }-${vo.maxTime } 분</span> 
			<br />
			<hr />
			<div class='oneLineReview'>
				<h2>
					한줄평 <input type='button' value="작성" onclick="funcRegisterOL()" />
				</h2>

				<c:forEach var="ol" begin="1" end="5">
					<span class="mid">권지영</span>
					<span class="star">★★★★★</span>
					<span class="doc"> 게임이 아주 쉽고 2인이 플레이하기 좋습니다.</span>
					<input type='button' value="삭제" id='btnDeleteOL' />
					<br />
				</c:forEach>
				<br />

				<div id='btn_zone'>
					<input type='button' value='맨첨' /> <input type='button' value='이전' />
					<input type='button' value='1' /> <input type='button' value='2' />
					<input type='button' value='3' /> <input type='button' value='다음' />
					<input type='button' value='맨끝' />
				</div>
			</div>


	</div>
</body>
</html>