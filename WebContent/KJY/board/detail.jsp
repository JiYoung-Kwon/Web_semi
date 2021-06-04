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
			<form name='frm_detail' id = 'frm_detail' method='post' action=''>
				<input type = 'hidden' value = '${vo.bName }' name = 'bName'/>
			</form>
		
			<span class='img'>
				<a href ='/Web_Semi/KJY/upload/${vo.sysAtt }' download = '${vo.oriAtt }'>
					<img src = '/Web_Semi/KJY/upload/${vo.sysAtt }' width = '250px' height = '300px'   align='left'/>
				</a>
			</span> 
			<span class='TotalName'>${vo.bName } (${vo.eName})</span>
			<input type = 'button' value = '수정' id="btnModify" />
			<input type = 'button' value = '삭제' id="btnDelete"/>
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