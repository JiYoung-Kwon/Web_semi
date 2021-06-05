<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<html lang='ko'>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<script src='/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='/Web_Semi/PJH/js/review.js'></script>
<link rel='stylesheet' type='text/css' href='/Web_Semi/PJH/css/view.css'>
<head>
<title>ReView_View</title>
</head>
<body>
<div id='review'>

	<h2>상세보기 페이지 입니다~</h2>
	<form name='frm_review' id='frm_review' method='post' action=''>
		
		<label>작성자</label>
			<input type='text' name='mid'  style='background-color:#332f2d; border: 2px solid #aaa;' value='${vo.mid }' />
		<br/>
		
		<label>제목</label>
			<input type='text' name='subject'  style='background-color:#332f2d; border: 2px solid #aaa;' value='${vo.subject }' />
			
		<label>지점</label>
			<select name='gubun' id='gubun'>
				<option value='서울'>서울</option>
				<option value='대전'>대전</option>
				<option value='붓산'>붓산</option>
			</select>
		<br/>
		
		<textarea name='doc'>${vo.doc }</textarea>
		<br/>
		
		<div id='image_preview'>
			<c:forEach var='f' items="${vo.attList}">
				<a href='./PJH/upload/${f.sysAtt }' download='${f.oriAtt }'>
					<img src='./PJH/upload/${f.sysAtt }' width='150px' height='180px'/>
				</a>
			</c:forEach>
		</div>
		
		<div id='btn_zone'>
			<input type='button' value='수정' id='btnModify'/>
			<input type='button' value='삭제' id='btnDelete'/>
			<input type='button' value='취소' id='btnSearch'/>
		</div>
		
		<!-- 데이터 확인용 -->
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='serial' value='${param.serial }'/>
		
		<input type='hidden' name='pwd' />
	</form>
	
	<div id='revPasswordZone'>
		<div id='textZone'>
			<label>삭제하시려면 암호를 입력해 주세요</label><br/>
			<input type='password' id='pwd' style='background-color:#332f2d; border: 2px solid #aaa;' />
			<input type='button' value='확인' id='btnDeleteR' />
			<input type='button' value='취소' id='btnCancel' />
		</div>
	</div>
	
</div>
<script>
rev.init();
rev.checkHost('${vo.gubun}');
</script>

</body>
</html>