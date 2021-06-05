<%@page import="java.util.ArrayList"%>
<%@page import="ksy.MemberVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src='//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js'></script>
<meta charset="UTF-8">
<title>회원 정보</title>
<style>
        * {padding: 0; margin: 0; box-sizing: border-box;}
        #member {width: 500px; height: 500px; background-color: #332F2D; margin: 0 auto; position: relative; border-radius: 20px; color: #ffffff; border:2px solid #ffffff; margin-top: 50px;}
        #main_aa {width: 100%; height: 60px; text-align: center; line-height: 60px; background-color: #332F2D; color: #ffffff; border-radius: 20px 20px 0 0;}
        #box {width: 100%; height: 45px; line-height: 20px; position: relative; top: 1px; background-color: #332F2D; color: white;}
        #profile {position: relative; left: 40px; top: 10px; float: left;}
        #img_icon {float: right; position: relative; right: 14px; top: 12px;}
        #mp_frm{line-height: 2.5 ; margin-left: 105px; display: block; width: 340px; margin-top: 20px; height: 310px;}
        #mp_frm>label span {width: 70px; display: inline-block;}
        .input_class {border: solid 0.1px black; width: 150px; border-radius: 10px; outline: none; padding: 8px;}
        #class-a {width: 100px;}
        #input_i {position: relative; left: 75px;}
        #btn_b {width: 60px; position: relative; left: 80px; background-color: #544242; color: ; border: 1px solid #ffffff; cursor: pointer;}
        #host {border-radius: 20px; outline: none; padding: 5px;}
        #tar { font-weight: 900; background-color: #584c4c; color: white; border: solid 1px gray; padding: 0 4px; position: relative; left: 180px; top: 13px; width: 140px; height: 25px;}
        #box> img {width: 6%; float: right; margin: 7px;}
        #box> img:hover {cursor: pointer;}
        #mp_frm> #btn_Zip{background: #584c4c; color: #ffffff; font-weight: 600; width: 62px; margin-left: 15px;}
        input[name=mid], input[name=irum], input[name=address], input[name=post] {background-color: #cacaca;}
        input[name=address], input[name=address2]{width:260px; }
</style>
</head>
<body>
    <div id="member">
        <div id="main_aa">
            <h2>회원정보</h2>
        </div>
        <hr>
        <div id="box">
        <label id="profile">프로필</label>
			<img alt="로그아웃" src="./KSY/img/new_logout.png" id="logout_img"> 
			<img alt="정보수정" src="./KSY/img/new_update.png" id="update_img">
     		<img alt="비밀번호 변경" src="./KSY/img/new_password.png" id="password_img">
        </div>
        <hr>
        <form action="" method="post" id="mp_frm">
            <label><span>아이디</span> <input type="text" class="input_class" name="mid" value='${vo.mid }' readonly></label><br>
            <label><span>성명</span> <input type="text" class="input_class" name="irum" value='${vo.irum }' readonly></label><br>
            <label><span>전화번호</span> <input type="text" class="input_class" name="phone" value='${vo.phone }'></label><br>
            <label><span>주소</span> <input type="text" class="input_class" name="post" id="post" value='${vo.post }' readonly></label><input type="button" value="우편번호" id="btn_Zip" onclick="funcZip()"><br>
            <label><span> </span> <input type="text" class="input_class" name="address" id="address" value='${vo.address }' readonly></label><br>
            <label><span>상세주소</span> <input type="text" class="input_class" name="address2" value='${vo.address2 }'></label><br>
            <label><span>이메일</span> <input type="text" class="input_class" name="email" value='${vo.email }'> @ 
            <input type=hidden value='${vo.host }' id='hidden_host'>
            <select name="host" id="host">
					<option value='IT여행자'>IT여행자</option>
					<option value='acorn'>ACORN</option>
					<option value='네이버'>네이버</option>
					<option value='네이트'>네이트</option>
					<option value='다음'>다음</option>
             </select>
            </label>
        </form>
        <hr>
        <input type="button" value="회원탈퇴" id="tar">
    </div>
<script type="text/javascript" src="./KSY/member/member.js"></script>
<script>host_chk();</script>
</body>
</html>