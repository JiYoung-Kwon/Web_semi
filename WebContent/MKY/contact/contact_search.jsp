<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='/Web_Semi/MKY/css/contact_search.css'>
<title>문의사항</title>
</head>
<body>
<div id='wrapper'>
	<h2>문의사항</h2>
		<div class='title'>
			<span class='no'>번호</span>
			<span class='pname'>매장명</span>
			<span class='wname'>제목</span>
			<span class='irum'>이름</span>
			<span class='nal'>날짜</span>
			<span class='hit'>조회수</span>
		</div>
		
		<div class='items'>
			<div class='item' onclick=''>
				<span class='no'>1</span>
				<span class='pname'>강남점</span>
				<span class='wname'>매장관리</span>
				<span class='irum'>김길동</span>
				<span class='nal'>2021-05-31</span>
				<span class='hit'>2</span>
			</div>
			<hr/>
			<div class='item' onclick=''>
				<span class='no'>2</span>
				<span class='pname'>부산점</span>
				<span class='wname'>배관문제</span>
				<span class='irum'>홍삼정</span>
				<span class='nal'>2021-05-31</span>
				<span class='hit'>5</span>
			</div>
			<hr/>
		</div>
		
	<form name='frm_contact' id='frm_contact' method='post' action=''>
		<div class='find_zone'>
			<label>
				<input type='radio' name='gubun' value='이름'>이름
			</label>
			<label>
				<input type='radio' name='gubun' value='제목'>제목
			</label>
			<label>
				<input type='radio' name='gubun' value='매장명'>매장명
			</label>
			
			<input type='text' name='findStr' value="" />
			<input type='button' value='검색' id='btnFind' /> <br/>
			<input type='button' value='글쓰기' id='btnInsert' />
		</div>
	</form>
	
		<div id='btn_zone'>
		<input type='button' id='start' value='<<'  onclick='product.move(1)'/>
		<input type='button' id='back' value='<' onclick='product.move(${p.startPage-1})'/>
		
		<input type='button' id='num' value='1' onclick='product.move(${i})' />
		<input type='button' id='num' value='2' onclick='product.move(${i})' />
		<input type='button' id='num' value='3' onclick='product.move(${i})' />
		
		<input type='button' id='next' value='>' onclick='product.move(${p.endPage+1 })'/>
		<input type='button' id='end' value='>>' onclick='product.move(${p.totPage })'/>
	</div>
</div>
</body>
</html>