/**
 * 
 */

var contact = {};
contact.init = function(){
	$('#wrapper #btnInsert').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=register', param);
	})
	
	$('#wrapper #btnSearch').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=search', param);
	})
	
}
contact.move= function(n){}