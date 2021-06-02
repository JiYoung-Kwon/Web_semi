<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

 #login_main>#login_wrapper{
	margin: 0 auto;
	width:650px;
	height: 640px;
}


#login_main>#login_wrapper>#login_top{
	background: #f5f5f5;
	height: 25%;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}
#login_main>#login_wrapper>#login_middle{
	background: #f5f5f5;
	height: 49%
}
#login_main>#login_wrapper>#login_bottom{
	background: #f5f5f5;
	height: 25%;
	display: inline-flex;
	width: 100%;
	flex-direction: column;
}

#login_main>#login_wrapper>#login_top>div{
	flex:1;
	
}
#login_main>#login_wrapper>#login_bottom>div{
	flex:1;
	
}
#login_main>#login_wrapper>#login_top>div:nth-child(2), #login_bottom>div:nth-child(2){
	background: #272422;
}
#login_main>#login_wrapper>#login_top>#login_logo>div{
	margin : 0 auto;
	width:50px;
	color: white;
	font-size: larger;
    font-weight: 900;
    line-height: 2.5;
}



#login_main>#login_wrapper>#login_middle>form{
	width : 80%;
	margin: 0 auto;
	line-height: 4.5;
}
#login_main>#login_wrapper>#login_middle>form>*{
	width: 100%;
    height: 45px;
    border-radius: 10px;
    outline: none;
    padding: 10px;
    font-size: inherit;
}
form>input[type=button]{
    background: linear-gradient(100deg ,#2d2d2d, #183b9491);
    color: #ffffff;
    border: none;
    
}
form>input[type=button]:active {
	background: linear-gradient(100deg ,#2d2d2d, #414e6f91);
}




</style>
</head>
<body>
<div id="login_main">
	<div id="login_wrapper">
		<div id="login_top">
			<div></div>
			<div id="login_logo">
				<div>LOGIN</div>
			</div>
			<div></div>
		</div>
		<div id="login_middle">
			<form>
				<input type="text" name="mid" placeholder="아이디"><br/>
				<input type="password" name="pwd" placeholder="비밀번호"><br/>
				<input type="button" id="btn_login" value="로그인"><br/>
				<input type="button" id="btn_member" value="회원가입">
			</form>
		</div>
		<div id="login_bottom">
			<div></div>
			<div></div>
			<div></div>
		</div>
	</div>
</div>
</body>
</html>