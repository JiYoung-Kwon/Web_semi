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
	var phone = document.getElementById('phone');
	var pwd = document.getElementById('pwd').value;
	var chk_pwd = document.getElementById('register_pwd').value;
	var div = document.getElementById('chk_mid') 
	
 // 회원가입 입력 확인
	if(document.getElementById('register_mid').value == ""){alert('아이디를 입력해주세요')}
	else if(document.getElementById('pwd').value == ""){alert('비밀번호를 입력해주세요')}
	else if(document.getElementById('register_pwd').value == ""){alert('비밀번호를 재입력해주세요')}
	else if(document.getElementById('irum').value == ""){alert('이름을 입력해주세요')}
	else if(document.getElementById('phone').value == ""){alert('전화번호를 입력해주세요')}
	else if(document.getElementById('address').value == ""){alert('주소를 입력해주세요')}
	else if(document.getElementById('address2').value == ""){alert('상세주소를 입력해주세요')}
	else if(document.getElementById('email').value == ""){alert('이메일 주소를 입력해주세요')}
	else{ if(regExp.test(phone.value)&& pwd==chk_pwd && div.innerHTML.trim()=='사용 가능한 아이디'){   // 비밀번호 불일치 / 핸드폰 양식 / 아이디 중복 체크 이상없을시 insert
		$('#middle_main').load(url+'insert', param);
		alert('가입되었습니다.')
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
		
		$.ajax({
		url: './ksy/login/login_check.jsp',  
		type:'post',
		data: param,
		success:function(resp){   // id 값을 넘겨서 count 하여 0 반환시 사용가능 / 1 반환시 중복 문구 표시
			alert(resp.trim())
			$('#middle_main').load(url+'login_chk', param);
		}
	  })
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

// 수정 아이콘 클릭시 데이터 수정하기
$('#update_img').on('click', function(){
		
		var frm = $('#mp_frm');
		var param = $(frm).serialize();
		var div = document.getElementById('chk_phone');
		
		if(confirm('정말 수정하시겠습니까?')){  // 수정 확인 문구 alert
			if(div.innerHTML.trim()=='정상입력'||div.innerHTML.trim()==''||div.innerHTML.trim()=='정상입력'){ // 폰넘버가 정상입력인지 확인
				$('#middle_main').load(url+'update', param);
				alert('수정되었습니다')
		 	}else{alert('전화번호 양식이 올바르지 않습니다.')
			 }}else{
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
	var chk_id = "";
	
	chk_id = id.split(" "); // 공백으로 나눴을경우 length가 1이면 공백이 없는 아이디
	console.log(chk_id.length)
	
	if(chk_id.length=='1'){ // 아이디값에 공백이 없을경우
		$.ajax({
		url: './ksy/login/id_check.jsp',  
		type:'post',
		data:{mid:id},
		success:function(resp){   // id 값을 넘겨서 count 하여 0 반환시 사용가능 / 1 반환시 중복 문구 표시
			div.innerHTML = resp
		}
	  })
	} else{ // 1이 아니면 아이디 값에 공백이 들어가있음.
	div.innerHTML = ' ';
	}
})



// 비밀번호 불일치 문구
function password(){
	
	var pwd = document.getElementById('pwd').value;
	var chk_pwd = document.getElementById('register_pwd').value;
	var div = document.getElementById('chk_pwd') 

	if(pwd!=chk_pwd){
		div.innerHTML = '비밀번호 불일치'		
	} else{ div.innerHTML = ' '; }
}


$('#phone').keyup(function(){
	var phone = document.getElementById('phone').value;
	var div = document.getElementById('chk_phone')
	
	
	var regExp = /^01(0|1|[6-9])(\d{3}|\d{4})\d{4}$/;
	
	if(regExp.test(phone)){
	 	div.innerHTML = '정상입력';
	}else{ div.innerHTML = '올바른 형식이 아닙니다';}
	 
	 if(isNaN(phone)){
			div.innerHTML = '숫자만 입력해주세요'
		}
})



//회원정보의 비밀번호 변경 이미지 누를시
$('#password_img').on('click', function(){
	$('#mp_pwd_wrapper').css({
			'display' : 'block'
		})
})

//회원정보의 비밀번호 변경 - 취소버튼
$('#pwd_cancle').on('click', function(){
		$('#mp_pwd_wrapper').css({
		  'display' : 'none'    
		})

	})
	
// 비밀번호 변경버튼 클릭시 
$('#btn_pwd').on('click', function(){
		var pwd = document.getElementById('now_pwd').value;
		var re_pwd = document.getElementById('re_pwd').value;
		var chk_re_pwd = document.getElementById('chk_re_pwd').value;
		var password = document.getElementById('session_pwd').value;	
		var frm = $('#re_pwd_frm')[0];	
		var param = $(frm).serialize();
		
		if(pwd==password){        // 현재 비밀번호 일치시 
			if(chk_re_pwd==re_pwd){   // 새 비밀번호 일치시
				$('#middle_main').load(url+'pwd_update', param);
				alert('비밀번호가 변경되었습니다.')
			}else{
				alert('변경된 비밀번호가 일치하지 않습니다.')
				}
		  }else{
			alert('현재 비밀번호가 일치하지 않습니다.')
		}
		
	})	




// 회원정보의 회원탈퇴 버튼 누를시
$('#tar').on('click', function(){
	$('#tar_wrapper').css({
			'display' : 'block'
		})
})
//회원정보의 회원탈퇴 - 취소이미지
$('#tar_cancle').on('click', function(){
		$('#tar_wrapper').css({
		'display' : 'none'    
		})
	})

// 회원 탈퇴 - 탈퇴버튼 클릭시
$('#btn_tar').on('click', function(){

		var frm = $('#tar_frm');
		var param = $(frm).serialize();
		var pwd = document.getElementById('tar_pwd').value;
		var password = document.getElementById('session_pwd').value;
	
		if(pwd == password){
		$('#middle_main').load(url+'delete', param);
		}else {
			alert('비밀번호가 일치하지 않습니다.')
		}
		

})