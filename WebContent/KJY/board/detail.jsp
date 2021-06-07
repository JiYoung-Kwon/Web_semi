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

<style>
	#detail{
		height: 350px;
	}
	.hr_top{
		margin-bottom : 20px;
		border: 1px dashed #6E6E6E50;
	}
	
	.hr_bottom{
		margin-top: 20px;
		border: 1px dashed #6E6E6E50;
	}
	
	#bName{
		font-size : 1.5em;
		color : white;
	}
	
	#eName{
		font-size : 1em;
		color : gray;
	}
	
	.normal{
		border:1px solid #6E6E6E50;
		margin-top: 5px;
    	margin-bottom: 5px;
	}
	
	.expl, .diff, .person, .time, .mid, .doc{
		color : white;
	}
	
	.star{
		color : yellow;
	}
	
	h2, label{
		font-weight : bold;
		color : gray;
	}
	
	h2{
		margin-bottom : 10px;
	}
	.oneLineReview{
		padding-top : 20px;
	}
	
	#btn_zone{
		width : 750px;
		text-align : center;
	}
	
	#btn_zone>input {
		border: 1px solid #ffffff;
	    width: 20px;
	    border-radius: 3px;
	    height: 20px;
	    background: #ffffff00;
	    color: #ffffff;
	}
	
	#btnModify, #btnDelete{
	border: 1px solid #ffffff87;
    width: 75px;
    height: 25px;
    border-radius: 5px;
    font-weight: bold;
    background: #ff000000;
    color: #fff6a6;
    text-shadow: 3px 1px 11px white;
	}
	
	#btnRegisterOL, #btnDeleteOL{
	border: 1px solid #ffffff87;
    width: 75px;
    height: 25px;
    border-radius: 5px;
    font-weight: bold;
    background: #ff000000;
    color: #00FFFF;
    text-shadow: 3px 1px 11px white;
	}
	
	div#oneLine {
    min-height: 168.5px;
}
</style>


</head>
<body>
	<div id='detail'>
	<hr class ='hr_top'/>
		<script>checkClick(${clickNum });</script>
			<form name='frm_detail' id = 'frm_detail' method='post' action=''>
				<input type = 'hidden' value = '${vo.bName }' name = 'bName'/>
				<c:set var = 'sessionId' value = '<%=(String)session.getAttribute("login_id") %>'/>
				<input type = 'hidden' name = 'nowPage' value = '${(empty param.nowPage) ? 1: param.nowPage }'/>
			</form>
		
			<span class='img'>
				<a href ='/Web_Semi/KJY/upload/${vo.sysAtt }' download = '${vo.oriAtt }'>
					<img src = '/Web_Semi/KJY/upload/${vo.sysAtt }' width = '250px' height = '300px'   align='left'/>
				</a>
			</span> 
			<span class='TotalName'><a id = 'bName'>${vo.bName }</a> <a id = 'eName'>(${vo.eName})</a></span>
			<input type = 'button' value = '����' id="btnModify" />
			<input type = 'button' value = '����' id="btnDelete"/>
			<hr class = 'normal'/>
			<span class='expl'>${vo.expl }</span>
			<hr class = 'normal'/>
			<label>���̵�</label> <span class='diff'>${vo.diff }</span> 
			<label>�ο�</label> <span class='person'>${vo.minPerson }-${vo.maxPerson }��</span>
			<label>���ӽð�</label> <span class='time'>${vo.minTime }-${vo.maxTime } ��</span> 
			
			<hr class = 'normal'/>
			<div class='oneLineReview'>
				<div id = 'oneLine'>
				<h2>
					������ <input type='button' id = 'btnRegisterOL' value="�ۼ�" onclick="funcRegisterOL('${vo.bName}','<%=(String)session.getAttribute("login_id") %>', ${(empty param.nowPage) ? 1: param.nowPage })" />
				</h2>

				<c:forEach var="ol" items = "${oList}">
					<span class="mid">${ol.mid }</span>
					<span class="star">${ol.star }</span>
					<span class="doc"> ${ol.doc }</span>
					<c:if test = "${ol.mid eq sessionId}">
						<input type='button' value="����" class = 'btnDeleteOL' onclick="funcDeleteOL('${ol.bName}', '${ol.mid }')" />
					</c:if>
					<br />
				</c:forEach>
				<br />
				</div>
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
	<hr class = 'hr_bottom'>
	<script>
	var sessionId = "<%=(String)session.getAttribute("login_id") %>"
	
	if(sessionId == 'null'){
		$("#btnRegisterOL").css('display',"none");
	}
	
	
	if(sessionId != "master"){
		$("#btnModify").css('display',"none");
		$("#btnDelete").css('display',"none");
	}
	
	
	</script>
</body>
</html>