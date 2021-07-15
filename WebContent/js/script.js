$(".main-menu >li").mouseover(function(){
    $('.sub').stop().slideDown();
});
$(".main-menu >li").mouseleave(function(){
    $('.sub').stop().slideUp();
});
$( window ).scroll( function() {
	if ( $( this ).scrollTop() > 200 ) {
		$( '#up' ).fadeIn();
	} else {
		$( '#up' ).fadeOut();
	}
} );
$( '#up' ).click( function() {
	$( 'html, body' ).animate( { scrollTop : 0 }, 400 );
	return false;
} );


// 로그인 아이콘 클릭시 로그인 페이지로 이동
var loginpage = document.getElementById('ii_img');

loginpage.onclick = function(){
	$('#middle_main').load('./member.do?job=login');
}


// 메인 로고 아이콘 클릭시 메인 페이지로 이동
var mainpage = document.getElementById('logo_img');

mainpage.onclick = function(){
	$('#middle_main').load('./main.jsp');
}

// 메인 로고 아이콘 클릭시 메인 페이지로 이동
var mainpage = document.getElementById('btn_review_search');

mainpage.onclick = function(){
	
	$('#middle_main').load("./review.do?job=search");
}

// 로그인 아이콘 클릭시 로그인 페이지로 이동
function login(){
	$('#middle_main').load('./member.do?job=login');
}

// 메인 로고 아이콘 클릭시 메인 페이지로 이동
function logo(){
	$('#middle_main').load('./main.jsp');
}

function boardGame(){
	$('#middle_main').load("./boardGame", 'job=search');
}

function store(){
	$('#middle_main').load("./KJY/map/storeMap.jsp");
}

// 문의게시판 클릭시 문의게시판 페이지로 이동

var btn_contact = document.getElementById('btn_contact');

btn_contact.onclick = function(){

	$('#middle_main').load('./contact.do?job=search');

} 

