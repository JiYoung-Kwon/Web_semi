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
			<input type = 'button' value = '����' id="btnModify" />
			<input type = 'button' value = '����' id="btnDelete"/>
			<hr />
			<span class='expl'>${vo.expl }</span>
			<hr />
			���̵� <span class='diff'>${vo.diff }</span> 
			�ο� <span class='person'>${vo.minPerson }-${vo.maxPerson }��</span>
			���ӽð� <span class='time'>${vo.minTime }-${vo.maxTime } ��</span> 
			<br />
			<hr />
			<div class='oneLineReview'>
				<h2>
					������ <input type='button' value="�ۼ�" onclick="funcRegisterOL()" />
				</h2>

				<c:forEach var="ol" items = "${oList}">
					<span class="mid">${ol.mid }</span>
					<span class="star">${ol.star }</span>
					<span class="doc"> ${ol.doc }</span>
					<input type='button' value="����" id='btnDeleteOL' />
					<br />
				</c:forEach>
				<br />

				<div id = 'btn_zone'>
					<c:if test="${page.startPage > 1 }">
						<input type='button' value = '��÷' onclick='brd.moveOL(1)'/>
						<input type='button' value = '����' onclick='brd.moveOL(${page.startPage-1})'/>
					</c:if>
					
					<c:forEach var='p' begin='${page.startPage }' end='${page.endPage }'>
						<input type='button' value = '${p }' onclick = 'brd.moveOL(${p})'/>
					</c:forEach>
					
					<c:if test = "${page.endPage<page.totPage }">
						<input type='button' value = '����' onclick = 'brd.moveOL(${page.endPage+1 })'/>
						<input type='button' value = '�ǳ�' onclick = 'brd.moveOL(${page.totPage })'/>
					</c:if>			
				</div>	
			</div>


	</div>
</body>
</html>