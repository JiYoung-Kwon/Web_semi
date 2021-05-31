<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
*{box-sizing: border-box;
	padding: 0;
	margin: 0;
	}
#top{border: 1px solid black;
	 height: 140px;
	 background: #272422;
	 min-width: 754px;
	 }
#top>#wrapper_top, #top>#wrapper_bottom{
	width:100%;
	height: 15%;
	border: 1px solid black;
}
#top>#wrapper_middle{
	display : inline-flex;
	width:100%;
	height: 70%;
	border: 1px solid black;
}
#top>#wrapper_middle>#wm_left, #wm_right{
	flex:1;
	height: 100%;
	border: 1px solid black;
}
#top>#wrapper_middle>#wm_left>#logo{
		border: 1px solid black;
		width:90px;
		height: 100%;
		float: right;
}
#top>#wrapper_middle>#wm_left>#logo>#logo_img{
		width:100%;
		height: 100%;
}
#top>#wrapper_middle>#wm_mid{
	flex:4;
	height: 100%;
	border: 1px solid black;
}
#top>#wrapper_middle>#wm_mid>div{
	height: 39%;
}
#top>#wrapper_middle>#wm_mid>#top_nav{
	width: 100%;
	display:flex;
}
#top>#wrapper_middle>#wm_mid>#top_nav>span{
	flex:1;
	color: #ffffff;
	text-align: center;
	font-family: "ZingScriptRustSB", Sans-serif;
    font-size: 20px;
    font-weight: 600;
}
#top>#wrapper_middle>#wm_mid>#top_nav>span:hover{
	color: #c1c1c1;
	cursor: pointer;
}



#top>#wrapper_middle>#wm_mid>#top_nav:hover>#sub_menu{
	display: block;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu{
	min-width: 754px;
	display:none;
	position:absolute; 
	height: 200px;
	width:100%;
	left: 0;
	top:86px;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_top{
	height: 53px;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_bottom{
	display: flex;
	border: 1px solid black;
	height: 174px;
	background-color: #332F2D;
}	
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_bottom>div{
	flex:1;
	border: 1px solid black;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_bottom>#sub_menu_nav{
	flex:4;
	border: 1px solid black;
	display: inline-flex;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_bottom>#sub_menu_nav>div{
	flex:1;
	color:#ffffff;
	text-align: center;
}
#top>#wrapper_middle>#wm_mid>#top_nav>#sub_menu>#sub_bottom>#sub_menu_nav>div>div{
	margin:10px;
}



#middle{min-width: 754px;
}
#middle>#main_middle>#main_image{
			border: 1px solid black;
			height: 550px;
			width:100%;			background-image: url(./img/main.jpg);
		    background-repeat: round;
		    background-size: cover;}
#middle>#main_middle>#main_image>#main_img>#middle1{
	width:100%;
	height: 100%
}





#main_testA{border: 1px solid black;
			height: 200px;
			display: flex;
			}
#main_testA>div{
	flex:1;
	text-align: center;
	font-size: -webkit-xxx-large;
	border: 1px solid black;
}			
#main_testB{border: 1px solid black;
			height: 800px;}
#main_testB>div{
	text-align: center;
	font-size: -webkit-xxx-large;
	border: 1px solid black;
	height: 400px;
}			
#footer{min-width: 754px;
		border: 1px solid black;
	 	height: 150px;}
#footer>#footer_top, #footer_bottom{
	width: 100%;
	height: 15%;
	border: 1px solid black;
}	 	
#footer>#footer_middle{
	width: 100%;
	height: 70%;
	border: 1px solid black;
}
#footer>#footer_middle>div{
	text-align: center;
}
	 	
</style>
</head>
<body>
<div id="top">
	<div id="wrapper_top"></div>
	<div id="wrapper_middle">
		<div id="wm_left">
			<div id="logo"><img alt="로고" src="https://redbutton.co.kr/wp-content/uploads/2021/03/GNB_logo.png" id="logo_img"></div>
		</div>
		<div id="wm_mid">
			<div></div>
			<nav id='top_nav'>
				<span>매장소개</span>
				<span>보드게임</span>
				<span>메뉴</span>
				<span>예약</span>
				<span>커뮤니티</span>
				<div id="sub_menu">
					<div id="sub_top"></div>
					<div id="sub_bottom">
						<div></div>
						<div id="sub_menu_nav">
							<div>
								<div>오시는 길</div>
								<div>서브메뉴 2</div>
								<div>서브메뉴 3</div>
								<div>서브메뉴 4</div>
							</div>
							<div>
								<div>서브메뉴 1</div>
								<div>서브메뉴 2</div>
								<div>서브메뉴 3</div>
								<div>서브메뉴 4</div>
							</div>
							<div>
								<div>서브메뉴 1</div>
								<div>서브메뉴 2</div>
								<div>서브메뉴 3</div>
								<div>서브메뉴 4</div>
								<div>서브메뉴 5</div>
							</div>
							<div>
								<div>서브메뉴 1</div>
								<div>서브메뉴 2</div>
								<div>서브메뉴 3</div>
							</div>
							<div>
								<div>공지사항</div>
								<div>이용 후기</div>
								<div>고객 의견</div>
								<div>자유게시판</div>
							</div>
						</div>
						<div></div>
					</div>
				</div>
			</nav>
			<div></div>
		</div>
		<div id="wm_right"></div>
	</div>
	<div id="wrapper_bottom"></div>
</div>

<div id="middle">
	<div id="main_middle"> <!-- 미들창 불러오기. -->
		<div id="main_image"><!-- <div id="main_img"><img alt="메인사진" src="./image/middle1.jpg" id="middle1"></div> --></div>
		<div id="main_testA">
			<div id="testA_1">메뉴1</div>
			<div id="testA_2">메뉴2</div>
		</div>
		<div id="main_testB">
			<div id="testB_1">메뉴3</div>
			<div id="testB_2">메뉴4</div>
		</div>
	</div>
</div>
<div id="footer">
	<div id="footer_top"></div>
	<div id="footer_middle">
		<div>문의전화 1644-0000</div>
		<div>주소 : 서울특별시 중구 다동88 동아빌딩15층 보드게임카페 | 사업자번호 : 333-22-55555</div>
		<div>대표자 : 김대표 | e-mail : kimboard@naver.com</div>
	</div>
	<div id="footer_bottom"></div>
</div>

</body>
</html>