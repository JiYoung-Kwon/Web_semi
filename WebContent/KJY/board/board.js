/**
 * 보드게임 소개 페이지 관리
 */

//보드게임 클릭 시, 상세 조회 기능
var brd={};
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

//한줄평 작성 창
function funcRegisterOL(){
	var popupX = (document.body.offsetWidth / 2) - (200 / 2);
	//만들 팝업창 좌우 크기의 1/2 만큼 보정값으로 빼주었음

	var popupY= (window.screen.height / 2) - (300 / 2);
	//만들 팝업창 상하 크기의 1/2 만큼 보정값으로 빼주었음

	
	var win = window.open('/Web_Semi/KJY/board/registerOL.jsp','win','width=500px, height=350px, left='+ popupX + ', top='+ popupY);	
}


//별점 클릭 기능
$('.starRev span').on('click',function(){
  	$(this).parent().children('span').removeClass('on');
  	$(this).addClass('on').prevAll('span').addClass('on');
  	return false;
});

//취소 버튼
$('#board #btnSelect').on('click', function(){
	$('#middle_main').load('./boardGame?job=search');
})


//보드게임 작성 창
$('#board #btnRegister').on('click', function(){
	$('#board').load('/Web_Semi/KJY/board/register.jsp');
})

//보드게임 입력
$('#board #btnInsertR').on('click', function(){		
		var frm = $('#frm_board')[0];
		
		//내용 입력폼과 파일 업로드 폼이 분리되지 않아서 임시로 해결하기 위해
		if(frm.findStr.value == '') frm.findStr.value = ' '; //임시조치
		if(frm.serial.value == '') frm.serial.value = 0; //임시조치
		if(frm.nowPage.value == '') frm.nowPage.value = '1';

		var data = new FormData(frm)
		
		$.ajax({
			type : 'POST',
			url  : './boardUpload?flag=insert',
			enctype : 'multipart/form-data',
			data : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#middle_main').load('./boardGame');
			},
			error : function(xhr, status, resp){
				alert(status + ", " + resp);
			}
		});
		
		
})

//보드게임 검색
$('#board #btnFind').on('click', function(){		
	var frm = $('#frm_board')[0];
	frm.nowPage.value = 1;
	var param = $(frm).serialize();
	//alert(param);
	$('#middle_main').load('./boardGame', param);
})

//보드게임 수정 창 띄우기
$('#board #btnModify').on('click', function(){
	var frm = $('#frm_detail')[0];
	var param = $(frm).serialize();
	$('#middle_main').load('./boardGame?job=modify', param);
})

//보드게임 수정
$('#board #btnUpdate').on('click', function(){ //저장		
	var frm = $('#frm_board')[0];
	
	if(frm.findStr.value == '') frm.findStr.value = ' '; //임시 조치
	if(frm.serial.value == '') frm.serial.value = 0; //임시조치
	if(frm.nowPage.value == '') frm.nowPage.value = '1';
	
	var data = new FormData(frm);
		
	$.ajax({
		type : 'POST',
		url  : './boardUpload?flag=update',
		enctype : 'multipart/form-data',
		data : data,
		contentType : false,
		processData : false,
		success : function(resp){
			$('#middle_main').load('./boardGame');	
		}
	})		
})

//보드게임 삭제
$('#board #btnDelete').on('click', function(){
	var frm = $('#frm_detail')[0];
	var param = $(frm).serialize();
	//alert(param);
	$('#middle_main').load('./boardGame?job=delete', param);
})

//페이지 이동
brd.move = function(nowPage){
	var frm = $('#frm_board')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#middle_main').load('./boardGame',param);
}

//한줄평 페이지 이동
brd.moveOL = function(nowPage){
	var frm = $('#frm_detail')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();

	$('.detailPage').load('./boardGame?job=detail',param);
}

//한줄평 삭제 기능
function funcDeleteOL(bName, mid){
	$('.detailPage').load('./boardGame?job=detail&isDel=ok&bName='+bName+"&mid="+mid);
}

//수정 시, 파일 클릭되게
$('#photo').on('click',function(){
		$('#attfile').click();
})

//파일 선택 시, 이미지 변경
var pic = $('#attfile')[0];
	if(pic!=null){
		pic.onchange = function(ev){
			var files = ev.srcElement.files;		
			var reader = new FileReader();
	
			reader.readAsDataURL(files[0]);
			reader.onload = function(ev2){
				var img = new Image();
				img.src = ev2.target.result;
				
				$('#photo')[0].src = img.src;
			}
		}
}

