<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang='ko'>
<head>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>방명록</title>

<style>
lable{
	display:inline-block;
	width: 130px;
}
#password_wrapper{
	width:350px;
	margin: 25px auto;
}
#password_wrapper>div{
	border: 1px solid black;
	height: 35px;
	background: #f5f5f5;
	text-shadow: 3px 3px 8px #838298b0;
}
#password_wrapper>div>span{
    font-size: 16px;
    font-weight: bold;
    width: 110px;
    margin: 5px auto;
    display: block;
}
#btn_save{
    margin-top: 15px;
    margin-left: 10px;
    width: 290px;
	height: 25px;
	border-radius: 10px;
    outline: none;
    font-size: inherit;
    background: linear-gradient(100deg ,#2d2d2d, #183b9491);
    color: #ffffff;
    border: none;
}
form{
	border: 1px solid black;
    height: 200px;
    line-height: 2.5;
    padding-top: 15px;
    padding-left: 15px;
}
</style>
</head>
<body>


<div id='gb_div'>
	 <div id="password_wrapper">
	 	<div><span>회원 비밀번호</span></div>
		<form name='pwd_frm' id='pwd_frm'>
			<lable>현재 비밀번호</lable><input type='password' id='pwd'><br/>
			<lable>새 비밀번호</lable><input type='password' id='new_pwd'><br/>
			<lable>비밀번호 재입력</lable><input type='password' id='new_pwd2'><br/>
			<input type='button' value='변경하기' id='btn_save'>	
		</form>
	</div>	
</div>

<script>
 $('#btn_save').on('click',function(){
	 
	 var new_pwd = document.getElementById('new_pwd').value
	 var new_pwd2 = document.getElementById('new_pwd2').value
	 if(new_pwd==new_pwd2){
		 
	 var param = $('#pwd_frm').serialize(); 
	 alert(param )
	 var url='./member.do?job='	 
	 var target = window.opener.document.getElementById('middle_main');
	 
	 $(target).load(url+'pwd_update', param);
	 alert(target)
	 }else{
		 alert("비밀번호를 잘못입력하셨습니다.")		 
	 }
	 
 })

 
</script>

</body>
</html>