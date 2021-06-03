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

 #myP_main>#myP_wrapper{
	margin: 0 auto;
	width:650px;
	height: 640px;
}


#myP_main>#myP_wrapper>#myP_top{
	background: #f5f5f5;
	height: 25%;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}
#myP_main>#myP_wrapper>#myP_middle{
	background: #f5f5f5;
	height: 49%
}
#myP_main>#myP_wrapper>#myP_bottom{
	background: #f5f5f5;
	height: 25%;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}

#myP_main>#myP_wrapper>#myP_top>div{
	flex:1;
	
}
#myP_main>#myP_wrapper>#myP_bottom>div{
	flex:1;
	
}
#myP_main>#myP_wrapper>#myP_top>div:nth-child(2), #myP_bottom>div:nth-child(2){
	background: #272422;
}
#myP_main>#myP_wrapper>#myP_top>#myP_logo>div{
	margin : 0 auto;
	width:90px;
	color: white;
	font-size: larger;
    font-weight: 900;
    line-height: 2.5;
}



#myP_main>#myP_wrapper>#myP_middle>#profile_top{
	height: 50px;
	border: 1px solid black;
	background: white;
}
#myP_main>#myP_wrapper>#myP_middle>#profile_top>#icon{
	float: right;
}
#myP_main>#myP_wrapper>#myP_middle>#profile_top>#icon>img{
	width: 25px;
    margin: 10px;
}
#myP_main>#myP_wrapper>#myP_middle>#profile_top>#icon>img:hover{
	cursor: pointer;
}

#myP_main>#myP_wrapper>#myP_middle>#profile_top>span{
	font-size: 15px;
    font-weight: bold;
    display: inline-block;
    height: 100%;
    line-height: 3;
    margin-left: 65px;
}

#myP_main>#myP_wrapper>#myP_middle>#profile{
	height: 250px;
	border: 1px solid black;
}
#myP_main>#myP_wrapper>#myP_middle>#profile>form{
	width: 370px;
    margin: 10px auto;
}
#myP_main>#myP_wrapper>#myP_middle>#profile>form>label>span{ 
	display: inline-block;
    width: 80px;
    margin-left: 20px;
    line-height: 2;
    font-weight: 600;
    color: #800a0aa6;
}

#myP_main>#myP_wrapper>#myP_middle>#profile>form>label>input{
	height: 25px;
    border: 0px;
    border-bottom: 1px solid black;
    outline: none;
    text-align: center;
    font-weight: 600;
}
input[name=phone], input[name=address2], input[name=account]{
    background: #fffffff5;
}
input[name=mid], input[name=irum], input[name=address], input[id=email]{
cursor: unset;
outline:none;
background: #f5f5f5
}
#myP_main>#myP_wrapper>#myP_middle>#profile>form>label>input[name=post]{
	width:100px;
	cursor: unset;
	background: #f5f5f5
}

#myP_main>#myP_wrapper>#myP_middle>#profile>form> #email{
	height: 25px;
    border: 0px solid black;
    background: #f5f5f5;
    width: 15px
}



form>input[type=button]{
    background: linear-gradient(100deg ,#2d2d2d, #183b9491);
    color: #ffffff;
    border: none;
    width: 55px;
    margin-left: 15px;
}
form>input[type=button]:active {
	background: linear-gradient(100deg ,#2d2d2d, #414e6f91);
}




</style>
</head>
<body>
<div id="myP_main">
	<div id="myP_wrapper">
		<div id="myP_top">
			<div></div>
			<div id="myP_logo">
				<div>회원 정보</div>
			</div>
			<div></div>
		</div>
		<div id="myP_middle">
		<div id="profile_top">
			<span>프로필</span>
			<div id="icon">
				<img alt="정보수정" src="./KSY/img/update.png" id="update_img">
				<img alt="로그아웃" src="./KSY/img/logout.png" id="logout_img">
			</div>
		</div>
		<div id="profile">
			<form>
				<label><span>아이디</span><input type="text" name="mid" value="mid" readonly></label><br>
				<label><span>성명</span><input type="text" name="irum" value="irum" readonly></label><br>
				<label><span>전화번호</span><input type="text" name="phone" value="010-0000-0000"></label><br>
				<label><span>주소</span><input type="text" name="post" id="post" value="07803" readonly></label><br>
				<label><span> </span><input type="text" name="address" id="address" value="서울 강서구 강서로 375" readonly></label>
				<input type='button' name='btnZipCode' id="btn_Zip" value='우편번호' onclick='funcZip()'/>
				<br>
				<label><span>상세주소</span><input type="text" name="address2" value="abcd" ></label><br>
				<label><span>이메일</span><input type="text" name="account" value="hong123"></label><input type="text" value="@" id="email" readonly>
				<select name='host'>
					<option value='IT여행자'>IT여행자</option>
					<option value='acorn'>ACORN</option>
					<option value='네이버'>네이버</option>
					<option value='네이트'>네이트</option>
					<option value='다음'>다음</option>
				</select><br/>			
			</form>
		</div>
		</div>
		<div id="myP_bottom">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
</div>
<script type="text/javascript" src="./KSY/member/member.js"></script>
</body>
</html>