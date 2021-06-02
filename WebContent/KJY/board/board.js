/**
 * 보드게임 소개 페이지 관리
 */

onDisplay = function(n,bName){
	var num = parseInt(n/4);
	console.log(bName);
	if($('.detailPage').eq(num).css('display') == 'none'){
		/*var serial = document.getElementById("serial");
		serial.value = n;*/
		$('.detailPage').load('./boardGame','job=detail&bName='+bName);	
				
		$('.detailPage').not(':eq('+num+')').hide();
		$('.detailPage').eq(num).show();
	}else{ //같은 div가 열려있으면
		//같은 item인지 구분해야함
		$('.detailPage').eq(num).hide();
	}
	
}

function funcRegisterOL(){
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (300 / 2);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	
	var win = window.open('/Web_Semi/KJY/board/registerOL.jsp','win','width=500px, height=350px, left='+ popupX + ', top='+ popupY);	
}

$('.starRev span').on('click',function(){
  	$(this).parent().children('span').removeClass('on');
  	$(this).addClass('on').prevAll('span').addClass('on');
  	return false;
});