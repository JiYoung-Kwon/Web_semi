<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>semi</title>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<script src="js/script.js"></script>
    <style>
        * {padding: 0; margin: 0; box-sizing: border-box;}
        #page {width: 100%; height: 2551px; background-color: #332F2D;}
        header {width: 1194px; height: 100px; margin: 0 auto; position: relative; left: 50px;}
        #header_footer {width: 100%; height: 100px; margin: 0 auto;}
        #logo {float: left; margin: 10px 0 0 10px;}
        #logo_img {width: 80px;}
        #logo_img:hover {cursor: pointer;}
        #main_menu {width: 600px;margin: 0 auto;}
        #page>#header>#top > .main_menu {flex:1; color: #ffffff; text-align: center; font-size: 20px; font-weight: 600; margin-top: 30px;}
        a {color: inherit; text-decoration: none;}
        #top {float: left; margin: 20px 10px 0 30px; display: flex;}
        .main-menu {width: 760px; height: 40px; margin-top: 10px; background-color: #332F2D; line-height: 40px; color: white; }
        .main-menu li {float: left; width: 150px; text-align: center; list-style-type: none;}
        .main-menu li:hover {background-color: white; color: #332F2D; cursor: pointer;}
        .sub {display: none; position: relative; background-color: #332F2D; color: white; width: 150px; height: 200px; z-index: 1} 
        .sub > li:hover {background-color: burlywood;}
        #i_img {width: 20%; float: left;}
        .i_img {width: 30px; margin: 25px 12px 0 0; cursor: pointer;}
        .clear {clear: both;}
        #section_img {width: 100%; height: 410px;}
        .h2 {font-family: "Consolas"; color: cornflowerblue; margin: 20px 0 20px 0;}
        .h2 {text-align: center;}
        #id_h2 {margin-top: 80px; position: relative; top: 40px; margin-bottom: 70px;}
        #f_img {margin-top: 30px;}
        p {color: darkseagreen;}
        #p {text-align: center; color: darkseagreen;}
        #img_p {width: 440px; margin-top: 30px; position: relative; left: 60px; border-radius: 10px;}
        .btn1 {background-color: cornflowerblue; color: white; border: 1px solid skyblue; padding: 8px; margin-top: 20px; border-radius: 10px; cursor:  pointer;}
        #section_p {float: right; margin-right: 50px; margin-top: 60px;}
        #section_a {position: relative; left: 80px;}
        #img_pa {float: right; width: 460px; position: relative; right: 160px; top: 80px; border-radius: 10px;}
        #section_bsection_b {width: 480px; float: left;}
        #section_c_img {float: left; margin-top: 140px;}
        #section_z {float: right; position: relative; right: 80px; top: 200px;}
        #section_d {width: 1194px; height: 700px; text-align: center;}
        #section_d_img1 {width: 460px; position: relative; right: 60px; top: 80px; border-radius: 10px;}
        #section_d_img2 {width: 460px; position: relative; left: 60px; top: 80px; border-radius: 10px;}
        #section_d_h2_p {position: relative; top: 90px;}
        #section_h2 {font-size: 16px; float: left; position: relative; left: 90px;}
        #section_d_p {position: relative; top: 20px; left: 120px; text-align: left;}
        footer {width: 1194px; height: 100px; margin: 0 auto;}
        #ftr_logo_img {width: 100px; float: left; position: relative; left: 40px;}
        #ftr_moon {float: left; position: relative; left: 90px; color: white;}
        #footer_mun {float: left; position: relative; left: 175px; color: white;}
        #index_hr {margin: 120px 0 30px 0; width: 100%; position: relative; color: gray;}
        #up {right: 220px; width: 50px; bottom: 140px; position: flex; cursor: pointer; position: fixed; float: right; z-index: 1233; display: none;}
        #section_img_p {width: 1194px; height: 410px; margin: 0 auto;}
        #ii_img {width: 20px; position: relative; bottom: 5px;}
        #img_i {width: 40px; position: relative; top: 5px;}

    </style>
</head>
<body>
    <div id="page">
       <div id="header_footer">
            <header>
                <div id="logo">
                    <img alt="로고" src="https://redbutton.co.kr/wp-content/uploads/2021/03/GNB_logo.png" id="logo_img" onclick="logo()">
                </div>
                <div id="top">
                    <ul class="main-menu">
                        <li>
                            <a href="#">매장소개</a>
                            <ul class="sub">
                                <li><a href="#">오시는 길</a></li>
                                <li><a href="#">서브메뉴 2</a></li>
                                <li><a href="#">서브메뉴 3</a></li>
                                <li><a href="#">서브메뉴 4</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">보드게임</a>
                            <ul class="sub">
                                <li><a href="#">서브메뉴 1</a></li>
                                <li><a href="#">서브메뉴 2</a></li>
                                <li><a href="#">서브메뉴 3</a></li>
                                <li><a href="#">서브메뉴 4</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">메뉴</a>
                            <ul class="sub">
                                <li><a href="#">서브메뉴 1</a></li>
                                <li><a href="#">서브메뉴 2</a></li>
                                <li><a href="#">서브메뉴 3</a></li>
                                <li><a href="#">서브메뉴 4</a></li>
                                <li><a href="#">서브메뉴 5</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">예약</a>
                            <ul class="sub">
                                <li><a href="#">서브메뉴 1</a></li>
                                <li><a href="#">서브메뉴 2</a></li>
                                <li><a href="#">서브메뉴 3</a></li>
                            </ul>
                        </li>
                        <li>
                            <a href="#">커뮤니티</a>
                            <ul class="sub">
                                <li><a href="#">공지사항</a></li>
                                <li><a href="#">이용 후기</a></li>
                                <li><a href="#">고객 의견</a></li>
                                <li><a href="#">자유게시판</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
                <div id="i_img">
                    <a href="https://www.youtube.com"><img src="img/png1.png" alt="" class="i_img"></a>
                    <a href="https://www.facebook.com/"><img src="img/png2.png" alt="" class="i_img"></a>
                    <a href="https://www.instagram.com/"><img src="img/png3.png" alt="" class="i_img"></a>
                    <a href="https://twitter.com/"><img src="img/png4.png" alt="" class="i_img" id="img_i"></a>
                    <img src="img/png5.png" alt="" class="i_img" id="ii_img" onclick="login()">
                </div>
            </header>
            <div class="clear"></div>
            <section id="middle_main">
            </section>
        <div class="clear"></div>
        <hr id="index_hr">
        <footer>
            <div id="footer_logo_img">
                <img src="https://redbutton.co.kr/wp-content/uploads/2021/03/%ED%91%B8%ED%84%B0_%EB%A1%9C%EA%B3%A0.png" alt="" id="ftr_logo_img">
            <div id="ftr_moon">
                <div>문의전화 1644-0000</div>
                <div>주소 : 서울특별시 중구 다동89 동아빌딩15층 보드게임카페 | 사업자번호 : 333-22-55555</div>
                <div>대표자 : 김대표 | e-mail : kimboard@naver.com</div>
            </div>
            <div id="footer_mun">
                <div>1644-0641</div>
                <div>오전 9시~12시/오후 1시~6시</div>
                <div>(주말, 공휴일 휴무)</div>
            </div>
            </div>
        </footer>
        </div>
    </div>
    
<script>$('#middle_main').load('./main.jsp')</script>

</body>
</html>