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
			<input type='text' name='mid' readonly style='background-color:#332f2d; border: 2px solid #aaa;' value='${vo.mid }' />
		<br/>
		
		<label>제목</label>
			<input type='text' name='subject' readonly style='background-color:#332f2d; border: 2px solid #aaa;' value='${vo.subject }' />
			
		<label>지점</label>
			<select name='gubun' id='gubun'>
				<option value='강남'>강남</option>
				<option value='홍대'>홍대</option>
				<option value='부산'>부산</option>
			</select>
		<br/>
		
		<textarea name='doc' readonly>${vo.doc }</textarea>
		<br/>
		
		<div id='image_preview'>
			<c:forEach var='f' items="${vo.attList}">
				<a href='./PJH/upload/${f.sysAtt }' download='${f.oriAtt }'>
					<img src='./PJH/upload/${f.sysAtt }' width='150px' height='180px'/>
				</a>
			</c:forEach>
		</div>
		
		<div id='btn_zone'>
			<c:if test='${sessionScope.login_id eq vo.mid}'>
				<input type='button' value='수정' id='btnModify'/>
				<input type='button' value='삭제' id='btnDelete'/>
			</c:if>
			<input type='button' value='뒤로가기' id='btnSearch'/>
		</div>
		
		<!-- 데이터 확인용 -->
		<input type='hidden' name='nowPage' value='${param.nowPage }'/>
		<input type='hidden' name='findStr' value='${param.findStr }'/>
		<input type='hidden' name='serial' value='${param.serial }'/>
		
		<input type='hidden' name='pwd' />
	</form>
	
	<div id='revPasswordZone'>
		<div id='textZone'>
			<label>정말 삭제 하시겠습니까?</label><br/>
			<input type='hidden' id='pwd' value='${sessionScope.login_pwd }' style='background-color:#332f2d; border: 2px solid #aaa;' />
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