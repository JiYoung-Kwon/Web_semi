/**
 * 보드게임 소개 페이지 관리
 */

onDisplay = function(n){
	var num = parseInt((n-1)/4);
	if($('.detailPage').eq(num).css('display') == 'none'){
		$('.detailPage').eq(num).show();
	}else{
		$('.detailPage').eq(num).hide();
	}
}