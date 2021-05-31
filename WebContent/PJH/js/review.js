/**
 *  리뷰 페이지 기능 연결 자바스크립트
 */

var rev = {};

rev.init = function(){
	$('#review #btnSearch').on('click', function(){
		var frm = $('#frm_review')[0];
		
		if(frm.serial.value =='') frm.serial.value = 0;
		if(frm.nowPage.value == '') frm.nowPage.value = '1';
				
		var param = $(frm).serialize();
		$('#review').load('re_search.jsp', param);
	})
	
	$('#review #btnFind').on('click', function(){
		var frm = $('#frm_review')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#review').load('re_search.jsp', param);
	})
	
	$('#review #btnInsert').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('re_register.jsp', param);
	})
	
	$('#review #btnModifyR').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('re_modify.jsp', param);
	})
	
	$('#review #btnRepl').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('re_repl.jsp', param);
	})
	
	$('#review #btnModify').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('re_modify.jsp', param);
	})
	
	$('#review #btnModify').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('re_modify.jsp', param);
	})
	
	
	rev.view = function(){
	var frm = $('#frm_review')[0];
	var param = $(frm).serialize();
	$('#review').load('view.jsp', param);
	}
	
	rev.move = function(nowPage){
	var frm = $('#frm_review')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#review').load('./review.do', param);
	}
}
	
	
	
	
	
	
	
	
	
	
	
	