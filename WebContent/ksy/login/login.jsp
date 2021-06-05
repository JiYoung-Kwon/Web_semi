<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
    <meta charset="UTF-8">
    <title>회원 정보</title>
    <style>
        * {padding: 0; margin: 0; box-sizing: border-box;}
        #header1 {width: 500px; height: 370px; margin: 0 auto; border: 2px solid #ffffff; border-radius: 20px; margin-top: 50px;}
        #header11 {width: 100%; margin: 0 auto; }
        #btn_member {width: 3%; position: absolute; margin-left: 117px; margin-top: 30px;}
        #btn_member:hover {cursor: pointer;}
        #login_frm{line-height: 2; position: relative; left: 130px; top: 15px;}
        #h3_Lo {display: block; width: 120px; height: 100px; text-align: center; font-size: 36px; line-height: 100px; background-color: #332F2D; color: white; margin: 0 auto;}
        .class_input {letter-spacing: 2px; border-radius: 15px; padding: 10px; width: 240px; height: 40px; margin-top: 10px; font-weight: 500; font-size: 15px; outline: none;}
        .class_input> placeholder {margin-left: 20px; }
        #input_btn {width: 240px; margin: 0 auto; margin-top: 16px;}
        #btn_login {width: 240px; border-radius: 15px; position: relative; top: 25px; height: 35px; font-size: 15px; font-weight: 600;}
        
    </style>
</head>
<body>
    <div id="header1">
    	
      <div id="header11">
            <h3 id="h3_Lo">LOGIN <img alt="회원가입" src="./KSY/img/register.png" id="btn_member"> </h3>
            
            <form action="" method="post" id="login_frm">
                <label><input type="text" name="mid" class="class_input" placeholder="아이디"></label><br>
                <label><input type="password" name="pwd" class="class_input" placeholder="비밀번호"></label>
            </form>
            <div id="input_btn">
                <input type="button" value="로그인" id="btn_login">
            </div>
        </div>
    </div>
<script type="text/javascript" src="./KSY/member/member.js"></script>
</body>
</html>