<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css' href='/Web_Semi/MKY/css/contact_modify.css'>
<script src='./lib/jquery-3.6.0.min.js'></script>
<script src='./js/contact.js'></script>
<title>문의 수정</title>
</head>
<body>
<div id='all_wrapper'>
<div id='left'></div>
	<div id='contact'>
		<h1>UPDATE</h1>
		<form name='frm_contact' id='frm_contact' method='post' action=''>
			<div id='insert'>
					<hr class='vertical'>
					<div id='label'>
								<label>매장명</label>
					</div>

					<div id='input'>
								<select name='store' id='store'>
											<option >매장명을 선택해주세요</option>
											<option value="강남">강남점</option>
											<option value="홍대">홍대점</option>
											<option value="부산">부산점</option>
								</select>
					</div>
					<br /><hr />

					<div id='label'>
								<label>이름</label>
					</div>

					<div id='input'>
								<input type='text' name='irum' value='${vo.irum }' readonly />
					</div>
					<br /><hr />

					<div id='label'>
								<label>연락처</label>
					</div>

					<div id='input'>
								<input type='text' class='phone' name='phone' value='${vo.phone }' />
					</div>
					<br /><hr />

					<div id='label'>
								<label>이메일</label>
					</div>

					<div id='input'>
								<input type='email' class='email' name='email' value='${vo.email }' />
					</div>
					<br /><hr />

					<div id='label'>
								<label>제목</label>
					</div>

					<div id='input'>
								<input type='text' class='subject' name='subject' value='${vo.subject }'/>
					</div>
					<br /><hr />
			</div>

			<div id='block'>
					<div id='space'>
								<div></div>
								<label>내용</label>
								<div></div>
					</div>
					<div id='textarea_div'>
								<textarea name='doc' >${vo.doc }</textarea>
					</div>
			</div>
			<br /><hr />

			<div id='label'>
						<label>첨부파일</label>
			</div>
			<input type='file' name='attfile' id='attfile' multiple /> <br />
			<hr />

			<div id='image_preview'>
						<div id='attzone'></div>
			</div>

			<div id='btn_zone'>
						<input type='button' value='작성' id='btnUpdate'> 
						<input type='button' value='취소' id='btnCancel'>
			</div>

			<!-- 데이터 확인용 -->
			<input type='hidden' name='mid' value='세션값'/>
			<input type='hidden' name='nowPage' value='${param.nowPage }' />
			<input type='hidden' name='findStr' value='${param.findStr }' />
			<input type='hidden' name='serial' value='${param.serial }' />
		</form>
	</div>
<div id='right'></div>
</div>
<script>
	contact.init();
	imageView('attfile', 'attzone');
</script>
</body>
</html>