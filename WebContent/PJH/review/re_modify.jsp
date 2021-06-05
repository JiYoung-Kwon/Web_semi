<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/re_modify.css'>
<head>
<title>Modify_Page</title>
</head>
<body>
<div id='review'>

	<h1>리뷰 수정 페이지 입니다~</h1>
	<form name='frm_review' id='frm_review' method='post' action=''>
		
		<label>작성자</label>
			<input type='text' name='mid' value='${vo.mid }' readonly />
		<br/>
		
		<label>제목</label>
			<input type='text' name='subject' value='${vo.subject }' />
			
		<label>지점</label>
			<select name='gubun'>
				<option value='서울'>서울</option>
				<option value='대전'>대전</option>
				<option value='붓산'>붓산</option>
			</select>
		<br/>
		
		<textarea name='doc'>${vo.doc }</textarea>
		<br/>
		
		<div id='att_list' >
		<c:forEach var='f' items="${vo.attList}">
			<div  class='file_zone'>
				<img src="./PJH/upload/${f.sysAtt }"  width='150px' height='180px'/>
				<label  class='del_file_chk'>
					<input type='checkbox' name='delFile' value='${f.sysAtt }'>삭제</label> 
			</div>
		</c:forEach>
		</div>
		
		<label>파일첨부</label>
			<input type='file' name='attfile' id='attfile' multiple/>
		
		<div id='image_preview'>
			<div id='attzone'></div>
		</div>
		
		<div id='btn_zone'>
			<input type='button' value='수정' id='btnUpdateR'/>
			<input type='button' value='취소' id='btnSearch'/>
			<input type='hidden' name='nowPage' value='${param.nowPage }'/>
			<input type='hidden' name='findStr' value='${param.findStr }'/>
			<input type='hidden' name='serial' value='${param.serial }'/>
		</div>
			
	<div id='revPasswordZone'>
		<div id='textZone'>
			<label>수정하시려면 암호를 입력해 주세요</label><br/>
			<input type='password' id='pwd' name='pwd' />
			<input type='button' value='확인' id='btnUpdate' />
			<input type='button' value='취소' id='btnCancel' />
		</div>
	</div>
			
	</form>
	
	
</div>
<script>
rev.init();
rev.checkHost('${vo.gubun}');
imageView('attfile', 'attzone');
</script>
</body>
</html>