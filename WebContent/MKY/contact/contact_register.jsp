<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<link rel='stylesheet' type='text/css'
			href='/Web_Semi/MKY/css/contact_register.css'>
<title>문의게시판</title>
</head>
<body>
	<div id='wrapper'>
		<h1>문의 게시판</h1>
		<form name='frm_contact' id='frm_contact' method='post' action=''>
			<div id='insert'>
						<hr class='vertical'>
						<div id='label'>
									<label>매장명</label>
						</div>

						<div id='input'>
									<select name='store_name' id='store_name'>
												<option value="">매장명을 선택해주세요</option>
												<option value="강남">강남점</option>
												<option value="홍대">홍대점</option>
												<option value="부산">부산점</option>
									</select>
						</div>
						<br />
						<hr />

						<div id='label'>
									<label>이름</label>
						</div>

						<div id='input'>
									<input type='text' name='mname' value='' />
						</div>
						<br />
						<hr />

						<div id='label'>
									<label>연락처</label>
						</div>

						<div id='input'>
									<input type='text' class='phone' name='phone' value='' />
						</div>
						<br />
						<hr />

						<div id='label'>
									<label>이메일</label>
						</div>

						<div id='input'>
									<input type='email' class='email' name='email' value='' />
						</div>
						<br />
						<hr />

						<div id='label'>
									<label>제목</label>
						</div>

						<div id='input'>
									<input type='text' class='title' name='title' />
						</div>
						<br />
						<hr />
			</div>

			<div id='block'>
						<div id='space'>
									<div></div>
									<label>내용</label>
									<div></div>
						</div>
						<div id='textarea_div'>
									<textarea name='doc'></textarea>
						</div>
			</div>
			<br />
			<hr />

			<div id='label'>
						<label>첨부파일</label>
			</div>
			<input type='file' name='attfile' id='attfile' multiple /> <br />
			<hr />

			<div id='image_preview'>
						<div id='attzone'></div>
			</div>

			<div id='btn_zone'>
						<input type='button' value='작성' id='btnInsertR'> <input
									type='button' value='취소' id='btnSearch'>
			</div>


			<input type='hidden' name='nowPage' value='${param.nowPage }' />
			<input type='hidden' name='findStr' value='${param.findStr }' />
			<input type='hidden' name='serial' value='${param.serial }' />
		</form>
	</div>
</body>
</html>