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
				<input type = 'text' name = 'nowPage' value = '${(empty param.nowPage) ? 1: param.nowPage }'/>
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

				<c:forEach var="ol" items = "${oList}">
					<span class="mid">${ol.mid }</span>
					<span class="star">${ol.star }</span>
					<span class="doc"> ${ol.doc }</span>
					<input type='button' value="삭제" id='btnDeleteOL' />
					<br />
				</c:forEach>
				<br />

				<div id = 'btn_zone'>
					<c:if test="${page.startPage > 1 }">
						<input type='button' value = '맨첨' onclick='brd.moveOL(1)'/>
						<input type='button' value = '이전' onclick='brd.moveOL(${page.startPage-1})'/>
					</c:if>
					
					<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
						<input type='button' value = '${p }' onclick = 'brd.moveOL(${p})'/>
					</c:forEach>
					
					<c:if test = "${page.endPage<page.totPage }">
						<input type='button' value = '다음' onclick = 'brd.moveOL(${page.endPage+1 })'/>
						<input type='button' value = '맨끝' onclick = 'brd.moveOL(${page.totPage })'/>
					</c:if>			
				</div>	
			</div>


	</div>
</body>
</html>