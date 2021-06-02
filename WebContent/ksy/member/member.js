/**
 * 
 */
var url='./member.do?job='


$('#btn_register').on('click', function(){
		var frm = $('#member_frm')[0];
		var param = $(frm).serialize();
		$('#middle_main').load(url+'insert', param);
		alert("처리")
})
$('#btn_member').on('click', function(){
		alert("처리")
		$('#middle_main').load(url+'register');
		
})

function funcZip(){
	// 우편번호 검색
	var post = document.getElementById('post');
	var address = document.getElementById('address');
		new daum.Postcode({
			oncomplete : function(data){
				post.value = data.zonecode;
				address.value =data.address;
			}
		}).open();
		
}