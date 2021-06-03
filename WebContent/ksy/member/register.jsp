<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


 #member_main>#member_wrapper{
	margin: 0 auto;
	width:650px;
	height: 640px;
}


#member_main>#member_wrapper>#member_top{
	background: #f5f5f5;
	height: 160px;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}
#member_main>#member_wrapper>#member_middle{
	background: #f5f5f5;
	height: 620px;
}
#member_main>#member_wrapper>#member_bottom{
	background: #f5f5f5;
	height: 160px;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}

#member_main>#member_wrapper>#member_top>div{
	flex:1;
	
}
#member_main>#member_wrapper>#member_bottom>div{
	flex:1;
	
}
#member_main>#member_wrapper>#member_top>div:nth-child(2), #member_bottom>div:nth-child(2){
	background: #272422;
}
#member_main>#member_wrapper>#member_top>#member_logo>div{
	margin : 0 auto;
	width:77px;
	color: white;
	font-size: larger;
    font-weight: 900;
    line-height: 2.5;
}



#member_main>#member_wrapper{
	margin: 0 auto;
	width:650px;
	height: 800px;
    margin-bottom: 145px;	
}
#member_main>#member_wrapper>#member_frm{
	width: 476px;
    margin: 0 auto;
}
input[type=text] ,input[type=password], select{
	height: 30px;
	width: 180px;
	border-radius: 10px;
	outline: none;
	
}
select{width: 90px;
		text-align-last: center;
		height: 30px;
}
option{text-align-last: center;}
#member_frm>label>span{
	width: 120px;
	display: inline-block;
	margin: 20px;
	text-shadow: 4px 5px 4px #0909097a;
	margin-left: 100px;
}
#member_frm>#button_zone{
	text-align: center;
}
#btn_register{
	background: linear-gradient(100deg ,#40425d, #66686f91)
}
#btn_cancle{background: linear-gradient(100deg ,#4e3c3ce0, #7b5a5a85);}
#member_frm>#button_zone>input{
    width: 160px;
    height: 40px;
    margin-left: 15px;
    margin-top: 30px;
   	border-radius: 8px;
    color: #ffffff;
    border: none;
    font-size: 15px;
    font-weight: bold;
}
input[type=text], input[type=password]{
padding: 10px;
}

#btn_Zip{
    background: #000000b8;;
    color: #ffffff;
    border-radius: 3px;
    width: 60px;
    height: 25px;
    margin-left: 10px;
}




</style>
</head>
<body>
<div id="member_main">
	<div id="member_wrapper">
		<div id="member_top">
			<div></div>
			<div id="member_logo">
				<div>회원가입</div>
			</div>
			<div></div>
		</div>
		<div id="member_middle">
			<div id="member_wrapper">
				<form id="member_frm">
					<label><span>아이디</span><input type='text' name='mid' required minlength='4' maxlength='12'/></label>
					<br/>
					<label><span>비밀번호</span><input type='password' name='pwd' required minlength='4' maxlength='12'/></label><br/>
					<label><span>비밀번호 확인</span><input type='password' name='chk_pwd' required minlength='4' maxlength='12'/></label><br/>
					<label><span>이름</span><input type='text' name='irum' required minlength='2' maxlength='10'/></label><br/>
					<label><span>전화번호</span><input type='text' name='phone' required/></label><br/>
					<label><span>주소</span><input type='text' name='post' id='post' readOnly>
					<input type='button' name='btnZipCode' id="btn_Zip" value='우편번호' onclick='funcZip()'/></label>
					<br/>
					<label><span>&nbsp</span><input type='text' name='address' id='address' readOnly/></label>
					<br/>
					<label><span>상세주소</span><input type='text' name='address2'/></label>
					<br/>
					<label><span>이메일</span><input type='text' name='email'/><output>@</output>
						<select name='host'>
							<option value='IT여행자'>IT여행자</option>
							<option value='acorn'>ACORN</option>
							<option value='네이버'>네이버</option>
							<option value='네이트'>네이트</option>
							<option value='다음'>다음</option>
						</select><br/>
					</label>
					<div id="button_zone">
						<input type='button' id="btn_register" value="가입"/>
						<input type='button' id="btn_cancle" value="취소"/>
					</div>
				</form>
			</div>
		</div>
		<div id="member_bottom">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="./KSY/member/member.js"></script>
</body>
</html>