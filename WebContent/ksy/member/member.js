/**
 * 
 */
// sevlet url 주소
var url='./member.do?job='

// 가입버튼 클릭시 DB에 insert
$('#btn_register').on('click', function(){
	
	var regExp = /^01(0|1|[6-9])(\d{3}|\d{4})\d{4}$/;
	var frm = $('#member_frm')[0];
	var param = $(frm).serialize();
	var phone = document.getElementById('register_phone');
	var pwd = document.getElementById('pwd').value;
	var chk_pwd = document.getElementById('register_pwd').value;
	
 // 회원가입 입력 확인

	if(document.getElementById('register_mid').value == ""){alert('아이디를 입력해주세요')}
	else if(document.getElementById('pwd').value == ""){alert('비밀번호를 입력해주세요')}
	else if(document.getElementById('register_pwd').value == ""){alert('비밀번호를 재입력해주세요')}
	else if(document.getElementById('irum').value == ""){alert('이름을 입력해주세요')}
	else if(document.getElementById('register_phone').value == ""){alert('전화번호를 입력해주세요')}
	else if(document.getElementById('address').value == ""){alert('주소를 입력해주세요')}
	else if(document.getElementById('address2').value == ""){alert('상세주소를 입력해주세요')}
	else if(document.getElementById('email').value == ""){alert('이메일 주소를 입력해주세요')}
	else{ if(regExp.test(phone.value)&& pwd==chk_pwd){
		$('#middle_main').load(url+'insert', param);
	 }else{
		 alert('회원가입 양식이 올바르지 않습니다.');}		
	}

})

// 취소버튼 클릭시 뒤로가기(로그인창)
$('#btn_cancle').on('click', function(){
		$('#middle_main').load(url+'login');
})

// 회원가입 버튼 클릭시 회원가입창 호출

$('#btn_member').on('click', function(){
$('#middle_main').load(url+'register');})





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

/*
// 비밀번호 변경창 생성
var password_img = document.getElementById('password_img');

password_img.onclick = function(){
	var popupX = (window.screen.width / 2) - (394 / 2);
	var popupY= (window.screen.height / 2) - (310 / 2);
	
	var win = window.open('./KSY/login/password.jsp','update','width=552px,height=310px, top='+popupX+', left='+popupY);
}

$('#update_img').on('click', function(){
var popupX = (window.screen.width / 2) - (394 / 2);
	var popupY= (window.screen.height / 2) - (310 / 2);
	
	var win = window.open('./KSY/login/password.jsp','update','width=552px,height=310px, top='+popupX+', left='+popupY);
}
*/



// 수정 아이콘 클릭시 데이터 수정하기
$('#update_img').on('click', function(){
		
		var frm = $('#mp_frm');
		var param = $(frm).serialize();
		if(confirm('정말 수정하시겠습니까?')){
			$('#middle_main').load(url+'update', param);
			alert('수정되었습니다')
		}else{
			$('#middle_main').load(url+'login')
		}
	
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


// 아이디 중복시 문구
$('#register_mid').keyup(function(){
	var id = $('#register_mid').val();
	var div = document.getElementById('chk_mid') 
	
	$.ajax({
		url: './KSY/login/login_check.jsp',
		type:'post',
		data:{mid:id},
		success:function(resp){
			div.innerHTML = resp
		}		
	})
})

// 비밀번호 불일치 문구
$('#register_pwd').keyup(function(){
	
	var pwd = document.getElementById('pwd').value;
	var chk_pwd = document.getElementById('register_pwd').value;
	var div = document.getElementById('chk_pwd') 

	if(pwd!=chk_pwd){
		div.innerHTML = '비밀번호 불일치'		
	} else{ div.innerHTML = ' '; }
})

// 전화번호 숫자가 아닐시 문구
$('#register_phone').keyup(function(){
	var phone = document.getElementById('register_phone');
	var div = document.getElementById('chk_phone')
	
	var regExp = /^01(0|1|[6-9])(\d{3}|\d{4})\d{4}$/;
	
	if(regExp.test(phone.value)){
	 	div.innerHTML = '정상입력';
	}else{ div.innerHTML = '올바른 형식이 아닙니다';}
	 
	 if(isNaN(phone.value)){
			div.innerHTML = '숫자만 입력해주세요'
		}
})



