/**
 * 
 */

var contact = {};
contact.init = function(){
		
		
	  var btn_contact = document.getElementById('btn_contact');
	
	btn_contact.onclick = function(){
		
		var frm = $('#frm_contact')[0];
		frm.nowPage.value = 1;
		if(frm.findStr.value=='') frm.findStr.value = ' ';
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=search', param);
	}
	
	
	$('#contact #btnFind').on('click', function(){
		var frm = $('#frm_contact')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=search', param);
	})
	
	$('#contact #btnSearch').on('click', function(){
		var frm = $('#frm_contact')[0];
		
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1'
		
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=search', param);
	})
	
	
	/*
	$('#contact #btnInsert').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=register', param);
	})
	$('#contact #btnInsertR').on('click', function(){
		var frm = $('#frm_board')[0];
		
		//내용입력폼과 파일 업로드폼이 분리되지 않아서...
		if(frm.findStr.value=='') frm.findStr.value = ' ';
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1';
		
		var data = new FormData(frm);
		
		$.ajax({
			type    : 'POST',
			url     : './contactUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data    : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#middle_main').load('./contact.do?job=search');
			}
		});
		
	});
	
	$('#contact #btnModify').on('click', function(){
		var frm = $('#frm_board')[0];
		var param = $(frm).serialize();
		$('#border').load('./contact.do?job=modify', param);	
	})
	
	
}




contact.move= function(nowPage){
	var frm = $('#frm_contact')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#middle_main').load('./contact.do?job=search', param);
	*/
}



$(document).ready(function(){
	if($("#no_answer").css("display") == 'none'){
		$("#no_answer").hide();
	} else{
		$("#no_answer").show();
	}
});





