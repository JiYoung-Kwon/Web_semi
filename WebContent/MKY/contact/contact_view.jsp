<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css'	href='/Web_Semi/MKY/css/contact_view.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/contact.js'></script>
<title>문의</title>
</head>
<body>
<div id='wrapper'>
	<h2>문의</h2>
	<form id='frm_contact' name='frm_contact' method='POST' action='' >
		<hr class='vertical'/>
			
		<div id='top_input'>
			<div id='label'>
				<label>제목</label>
			</div>
			<div id='top_text'>
				<div id='title'>안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요
				안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요안녕하세요</div>
			</div>
		</div>
			<hr/>
		
		<div id='top_input'>
			<div id='label'>
				<label>작성자</label>
			</div>
			<div id='top_text'>
				<div id='irum'>김길동</div>
			</div>
		</div>
			<hr/>
			
		<div id='top_input'>
			<div id='label'>
				<label>작성일</label>
			</div>
			<div id='top_text'>
				<div id='date'>2021-06-01</div>
			</div>
		</div>
			<hr/>
	
	<div id='main_text'>
	</div>
	<hr/>
	
	<div id='btn_zone'>
		<input type='button' id='btnSearch' value='목록' />
		<input type='button' id='btnModify' value='수정' />
		<input type='button' id='btnDelete' value='삭제' />
	</div>
	
	</form>

</div>
<script>
	contact.init();
</script>
</body>
</html>