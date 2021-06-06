<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='/Web_Semi/MKY/css/contact_view.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/contact.js'></script>
<title>문의</title>
</head>
<body>
<div id='all_wrapper'>
<div id='left'></div>
<div id='contact'>
	<h2>문의</h2>
	<form id='frm_contact' name='frm_contact' method='POST' action='' >
		<hr class='vertical'/>
			
		<div id='top_input'>
			<div id='label'>
				<label>제목</label>
			</div>
			<div id='top_text'>
				<div id='subject' name='subject' >${vo.subject }</div>
			</div>
		</div>
			<hr/>
		
		<div id='top_input'>
			<div id='label'>
				<label>작성자</label>
			</div>
			<div id='top_text'>
				<div id='irum' name='irum' >${vo.irum }</div>
			</div>
		</div>
			<hr/>
			
		<div id='top_input'>
			<div id='label'>
				<label>작성일</label>
			</div>
			<div id='top_text'>
				<div id='mdate' name='mdate' >${vo.mdate }</div>
			</div>
		</div>
			<hr/>
	
	<div id='main_text' name='doc' >${vo.doc }</div>
	<hr/>
	
	<div id='image_preview'>
			<c:forEach var='f' items="${vo.attList}">
				<a href='./upload/${f.sysAtt }' download='${f.oriAtt }' >
					<img src="./upload/${f.sysAtt }" width='150px' height='180px'/>
				</a>
			</c:forEach>
		</div>
	
	<div id='no_answer'>
		<div id='top_input'>
			<div id='label'>
				<label>답변</label>
			</div>
			<div id='top_text'>
				<div id='answer'>${vo.answer }</div>
			</div>
		</div>
		<hr/>
	</div>
			
	<div id='btn_zone'>
		<input type='button' id='btnSearch' value='목록' />
		<input type='button' id='btnModify' value='수정' />
		<input type='button' id='btnDelete' value='삭제' />
	</div>
	
	<!-- 데이터 확인용 -->
		<input type='hidden' name='mid' value='a002'/>
		<input type='hidden' name='nowPage' value='${param.nowPage }' />
		<input type='hidden' name='findStr' value='${param.findStr }' />
		<input type='hidden' name='serial' value='${param.serial }' />
		<input type='hidden' name='pwd' />
	</form>
	
	<div id='pwdZone'>
		<div id='checkZone'>
			<label>삭제하시려면 암호를 입력해 주세요.</label><br/>
			<input type='password' id='pwd' /><br/>
			<input type='button' value='확인' id='btnDeleteR' />
			<input type='button' value='취소' id='btnCheckCancel' />
		</div>
	</div>

</div>
<div id='right'></div>
</div>
<script>
	contact.init();
</script>
</body>
</html>