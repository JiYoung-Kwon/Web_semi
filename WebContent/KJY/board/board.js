/**
 * 보드게임 소개 페이지 관리
 */
var clickNum = 0;
onDisplay = function(n,bName){
	
	checkClick = function(a){
		clickNum = a;
	}
	
	var num = parseInt(n/4);
	//console.log(bName);
	if($('.detailPage').eq(num).css('display') == 'none'){ 
		$('.detailPage').load('./boardGame','job=detail&bName='+bName+'&isClicked='+n);	
				
		$('.detailPage').not(':eq('+num+')').hide();
		$('.detailPage').eq(num).show();
	}else{ //같은 div가 열려있으면
		//같은 item인지 구분해야함
		if(n == clickNum){
			$('.detailPage').eq(num).hide();
		}
		else{ //다른 item 클릭
			var isClicked = n; //클릭된 item
			$('.detailPage').load('./boardGame','job=detail&bName='+bName+'&isClicked='+n);	
		}
		
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