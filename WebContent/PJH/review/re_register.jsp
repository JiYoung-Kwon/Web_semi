<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/re_register.css'>
<head>
<title>Register_Page</title>
</head>
<body>
<div id='review'>

	<h2>리뷰 입력 페이지 입니다~</h2>
	<form name='frm_review' id='frm_review' method='post' action=''>
		
		<label>작성자</label>
			<input type='text' name='mid' value='${sessionScope.login_id }' readonly style='background-color:#332f2d; border: 2px solid #aaa;'/>
		<br/>
		
		<label>제목</label>
			<input type='text' name='subject' style='background-color:#332f2d; border: 2px solid #aaa;'/>
			
		<label>지점</label>
			<select name='gubun' id='gubun'>
				<option value='강남'>강남</option>
				<option value='홍대'>홍대</option>
				<option value='부산'>부산</option>
			</select>
		<br/>
		
		<textarea name='doc'></textarea>

		<br/>
		
		<label>파일첨부</label>
			<input type='file' name='attfile' id='attfile' multiple/>
		
		<div id='image_preview'>
			<div id='attzone'></div>
		</div>
		
		<div id='btn_zone'>
			<input type='button' value='작성' id='btnInsertRRRR'>
			<input type='button' value='취소' id='btnSearch'/>
		</div>
				
	<div id='revPasswordZone'>
		<div id='textZone'>
			<label>정말 작성하시겠습니까?</label><br/>
			<input type='hidden' name='pwd' id='pwd' value='${sessionScope.login_pwd }' style='background-color:#332f2d; border: 2px solid #aaa;'/>
			<input type='button' value='확인' id='btnInsertR' />
			<input type='button' value='취소' id='btnCancel' />
		</div>
	</div>
			
		<!-- 데이터 확인용 -->
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='serial' value='${param.serial }'/>
	</form>
	
</div>
<script>
rev.init();
imageView('attfile', 'attzone');
</script>
</body>
</html>