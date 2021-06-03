/**
 * 
 */
// sevlet url 주소
var url='./member.do?job='

// 가입버튼 클릭시 DB에 insert
$('#btn_register').on('click', function(){
		var frm = $('#member_frm')[0];
		var param = $(frm).serialize();
		$('#middle_main').load(url+'insert', param);
})

// 취소버튼 클릭시 뒤로가기(로그인창)
$('#btn_cancle').on('click', function(){
		$('#middle_main').load(url+'cancle');
})

// 회원가입 버튼 클릭시 회원가입창 호출
$('#btn_member').on('click', function(){
		$('#middle_main').load(url+'register');
})


// 로그인 버튼 클릭시 로그인 확인
$('#btn_login').on('click', function(){
		var frm = $('#login_frm')[0];
		var param = $(frm).serialize();
		$('#middle_main').load(url+'login_chk', param);
})


// 우편 번호 api
function funcZip(){
	var post = document.getElementById('post');
	var address = document.getElementById('address');
		new daum.Postcode({
			oncomplete : function(data){
				post.value = data.zonecode;
				address.value =data.address;
			}
		}).open();
}


// 로그인 아이콘 클릭시 로그인 페이지로 이동
$('#loginpage').on('click', function(){
	alert("클릭");
	$('#middle_main').load(url+'login');
});

// 수정 아이콘 클릭시 데이터 수정하기
$('#update_img').on('click', function(){
		var frm = $('#mp_frm');
		var param = $(frm).serialize();
		
	$('#middle_main').load(url+'update', param);
});


// 로그아웃 아이콘 클릭시 로그아웃하기
$('#logout_img').on('click', function(){
	$('#middle_main').load(url+'logout');
});




// my_Page에서 host 가져올때(select 태그)
function host_chk(){
	var chk = document.getElementsByName('host')
	var gubun = document.getElementById('hidden_host');
	
	for (var i in chk){
		if(chk[i].value == gubun.Value){
		$("#host").val(gubun.value).attr("selected", "selected");
		}
	}
}

