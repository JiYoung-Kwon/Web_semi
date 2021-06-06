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
function login(){
	$('#middle_main').load('./member.do?job=login');
}

// 메인 로고 아이콘 클릭시 메인 페이지로 이동
function logo(){
	$('#middle_main').load('./main.jsp');
}