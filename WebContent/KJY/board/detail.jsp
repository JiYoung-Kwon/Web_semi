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
			���̵� <span class='diff'>${vo.diff }</span> 
			�ο� <span class='person'>${vo.minPerson }-${vo.maxPerson }��</span>
			���ӽð� <span class='time'>${vo.minTime }-${vo.maxTime } ��</span> 
			<br />
			<hr />
			<div class='oneLineReview'>
				<h2>
					������ <input type='button' value="�ۼ�" onclick="funcRegisterOL()" />
				</h2>

				<c:forEach var="ol" begin="1" end="5">
					<span class="mid">������</span>
					<span class="star">�ڡڡڡڡ�</span>
					<span class="doc"> ������ ���� ���� 2���� �÷����ϱ� �����ϴ�.</span>
					<input type='button' value="����" id='btnDeleteOL' />
					<br />
				</c:forEach>
				<br />

				<div id='btn_zone'>
					<input type='button' value='��÷' /> <input type='button' value='����' />
					<input type='button' value='1' /> <input type='button' value='2' />
					<input type='button' value='3' /> <input type='button' value='����' />
					<input type='button' value='�ǳ�' />
				</div>
			</div>


	</div>
</body>
</html>