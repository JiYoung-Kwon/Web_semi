/**
 *  리뷰 페이지 기능 연결 자바스크립트
 */

var rev = {};

rev.init = function(){
	$('#review #btnFind').on('click', function(){
		var frm = $('#frm_review')[0];
		frm.nowPage.value = 1;
		var param = $(frm).serialize();
		$('#review').load('review.do?job=search', param);
	})
	
	$('#review #btnSearch').on('click', function(){
		var frm = $('#frm_review')[0];
		
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1'
				
		var param = $(frm).serialize();
		$('#middle_main').load('./review.do?job=search', param);
	})
	
	//입력
	$('#review #btnInsert').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('PJH/review/re_register.jsp', param);
	})
	
	$('#review #btnInsertR').on('click', function(){
		var frm = $('#frm_review')[0];
		
		//내용 입력폼과 파일 업로드 폼이 분리되지 않아서 넣음 분리해야 될듯.....
		if(frm.findStr.value == '') frm.findStr.value = ' ';
		if(frm.serial.value == '') frm.serial.value = 0;
		if(frm.nowPage.value == '') frm.nowPage.value = '1';
		
		var data = new FormData(frm);
		
		$.ajax({
			type		: 'POST',
			url			: './reviewUpload.do?flag=insert',
			enctype		: 'multipart/form-data',
			data		: data,
			contentType	: false,
			processData	: false,
			success		: function(resp){
				alert("성공~~~");
				$('#middle_main').load('./review.do');
			}
			
		})
		
	});
	
	$('#btnInsertRRRR').on('click', function(){
		$('#revPasswordZone').css({
			'display' : 'block'
		})
	})
	
	
	$('#review #btnModify').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./review.do?job=modify', param);
	})
	
	$('#review #btnRepl').on('click', function(){
		var frm = $('#frm_review')[0];
		var param = $(frm).serialize();
		$('#review').load('PJH/review/re_repl.jsp', param);
	})
	
	
	$('#review #btnUpdateR').on('click', function(){
		$('#revPasswordZone').css({
			'display' : 'block'
		})
	})
	
	$('#review #btnUpdate').on('click', function(){
		var frm = $('#frm_review')[0];
		var pwd = $('#revPasswordZone #pwd').val();
		frm.pwd.value = pwd;
	
		//내용입력폼과 파일 업로드폼이 분리되지 않아서 임시데이터
		if(frm.findStr.value=='') frm.findStr.value = ' ';
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1';
		
		var data = new FormData(frm);

		$.ajax({
			type    : 'POST',
			url     : './reviewUpload.do?flag=update',
			enctype : 'multipart/form-data',
			data    : data,
			contentType : false,
			processData : false,
			success : function(resp){

				$('#revPasswordZone').css({'display' : 'none'});
				$('#middle_main').load('./review.do?job=search');  
			}
		});
	})
	
	$('#btnDelete').on('click', function(){
		$('#revPasswordZone').css({
			'display' : 'block'
		})
	})
	
	$('#review #btnDeleteR').on('click', function(){
		var frm = $('#frm_review')[0];
		var pwd = $('#revPasswordZone #pwd').val();
		frm.pwd.value = pwd;

		var param = $(frm).serialize();
		$('#middle_main').load('./review.do?job=delete', param, function(){
			$('#revPasswordZone').css({
				'display' : 'none'
			})
		});
	})
	
	$('#btnCancel').on('click', function(){
		$('#revPasswordZone').css({
			'display' : 'none'
		})
	})


}
	
	rev.view = function(serial){
	var frm = $('#frm_review')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();
	$('#middle_main').load('./review.do?job=view' , param);
	}
	
	rev.move = function(nowPage){
	var frm = $('#frm_review')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#middle_main').load('./review.do', param);
	}

	rev.checkHost = function(gubun){
	var frm = $('#frm_review')[0];
	switch(gubun){
		case '서울'	:
			frm.gubun[0].selected = true;
			break;
		case '대전'	:
			frm.gubun[1].selected = true;
			break;
		case '붓산'	:
			frm.gubun[2].selected = true;
			break;		
	}
}
	
	rev.move = function(nowPage){
		var frm = $('#frm_review')[0];
		frm.nowPage.value = nowPage;
		var param = $(frm).serialize();
		
		$('#middle_main').load('./review.do', param);
	}
	
	function imageView(fileTag, imageZone){
		var ft = document.getElementById(fileTag);
		var izone = document.getElementById(imageZone);
		
		ft.onchange = function(ev){
			var ele = ev.srcElement;
			var files = ele.files;
			
			for(var index in files){
			console.table(files[index]);
			}
			
			for(var file of files){
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(ev2){
					var div = makeItem(izone);
					var img = new Image();
					img.src = ev2.target.result;
					
					div.appendChild(img);
					izone.appendChild(div);
				}
			}
		}
		
		izone.ondragenter = function(e){
			e.preventDefault();
			e.stopPropagation();
			return false;
		}
		
		izone.ondragover = function(e){
			e.preventDefault();
			e.stopPropagation();
			return false;
		}
		
		izone.ondrop = function(e){
			e.preventDefault();
			e.stopPropagation();
			
			var dt = e.dataTransfer;
			var files = dt.files;
			
			for(var file of files){
				var reader = new FileReader();
				reader.readAsDataURL(file);
				reader.onload = function(ev2){
					var div = makeItem(izone);
					var img = new Image();
					img.src = ev2.target.result;
					
					div.appendChild(img);
					izone.appendChild(div);
				}
			}
		}
	}
	
	function makeItem(izone){
	// div 태그 생성 : <div class='item'></div>
	var div = document.createElement('div');
	div.setAttribute('class', 'item');
	
	// 삭제버튼 : <input type='button' value='x' class='del_btn' name='btnDel+ N'/>
	var delBtn = document.createElement('input');
	delBtn.setAttribute('type', 'button');
	delBtn.setAttribute('value', 'X')
	delBtn.setAttribute('class', 'del_btn')
	delBtn.setAttribute('name', 'btnDel')
	
	div.appendChild(delBtn);
	
	delBtn.onclick = function(){
		var p = this.parentNode;
		izone.removeChild(p);
	}
	
	
	return div;
}
	
	
	
	
	
	
	
	