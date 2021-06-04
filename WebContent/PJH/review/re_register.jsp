<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/review.css'>
<head>
<title>Register_Page</title>
</head>
<body>
<div id='review'>

	<h1>리뷰 입력 페이지 입니다~</h1>
	<form name='frm_review' id='frm_review' method='post' action=''>
		
		<label>작성자</label>
			<input type='text' name='mid' value='juna' />
		<br/>
		
		<label>제목</label>
			<input type='text' name='subject' value='hi~' />
			
		<label>지점</label>
			<select name='gubun'>
				<option value='서울'>서울</option>
				<option value='대전'>대전</option>
				<option value='붓산'>붓산</option>
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
			<label>작성하시려면 암호를 입력해 주세요</label><br/>
			<input type='password' name='pwd' id='pwd' />
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