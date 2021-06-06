/**
 * 
 */

var contact = {};
contact.init = function(){
	
	// 조회	
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
	
	// 입력
	$('#contact #btnInsert').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=register', param);
	})
	
	$('#contact #btnInsertR').on('click', function(){
		var frm = $('#frm_contact')[0];
		
		//내용입력폼과 파일 업로드폼이 분리되지 않아서...
		if(frm.findStr.value=='') frm.findStr.value = ' ';
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1';
		if(frm.mid.value=='') frm.mid.value = ' ';
		
		//alert(frm.mid.value)
		
		var data = new FormData(frm);
		
		$.ajax({
			type    : 'POST',
			url     : './contactUpload.do?flag=insert',
			enctype : 'multipart/form-data',
			data    : data,
			contentType : false,
			processData : false,
			success : function(resp){
				alert("정상적으로 입력되었습니다.");
				$('#middle_main').load('./contact.do?job=search');
			}
		});
		
	});
	
	// 수정
	$('#contact #btnUpdate').on('click', function(){
		var frm = $('#frm_contact')[0];
		
		//내용입력폼과 파일 업로드폼이 분리되지 않아서...
		if(frm.findStr.value=='') frm.findStr.value = ' ';
		if(frm.serial.value=='') frm.serial.value = 0;
		if(frm.nowPage.value=='') frm.nowPage.value = '1';
		if(frm.mid.value=='') frm.mid.value = ' ';
		
		var data = new FormData(frm);
		
		$.ajax({
			type    : 'POST',
			url     : './contactUpload.do?flag=update',
			enctype : 'multipart/form-data',
			data    : data,
			contentType : false,
			processData : false,
			success : function(resp){
				$('#middle_main').load('./contact.do?job=search');
			}
		});
	})
	
	$('#contact #btnModify').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=modify', param);	
	})
	
	// 삭제
	$('#contact #btnDelete').on('click', function(){
		if($("#pwdZone").css("display") == "none"){
			$('#pwdZone').css("display", "block");
		}else{
			$('#pwdZone').css("display", "none");
		}
	})
	
	$('#contact #btnDeleteR').on('click', function(){
		var frm = $('#frm_contact')[0];
		var pwd = $('#pwdZone #pwd').val();
		frm.pwd.value = pwd;
		
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=delete', param, function(){
			if($("#pwdZone").css("display") == "block"){
			$('#pwdZone').css("display", "none");
			}else{
			$('#pwdZone').css("display", "block");
			}
		});
	})
	
	// 취소
	$('#contact #btnCancel').on('click', function(){
		var frm = $('#frm_contact')[0];
		var param = $(frm).serialize();
		$('#middle_main').load('./contact.do?job=view', param);
	})
	
	$('#contact #btnCheckCancel').on('click', function(){
		if($("#pwdZone").css("display") == "block"){
			$('#pwdZone').css("display", "none");
		}else{
			$('#pwdZone').css("display", "block");
		}
	})
	
	
}
	
	contact.view = function(serial){
	var frm = $('#frm_contact')[0];
	frm.serial.value = serial;
	var param = $(frm).serialize();
	$('#middle_main').load('./contact.do?job=view', param);
	}
	
	contact.move= function(nowPage){
	var frm = $('#frm_contact')[0];
	frm.nowPage.value = nowPage;
	var param = $(frm).serialize();
	
	$('#middle_main').load('./contact.do?job=search', param);
	}
	
	/* 파일 미리보기 --------------------- */
	function imageView(fileTag, imageZone){
		var ft = document.getElementById(fileTag);
		var izone = document.getElementById(imageZone);
		
		ft.onchange = function(ev){
			var ele = ev.srcElement; //이벤트 발생 태그
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
				if($("#image_preview").css("display") == "none"){
				$('#image_preview').css("display", "block");
				}else{
				$('#image_preview').css("display", "none");
				}
		} // end of tf.onchange
		
		// drag & drop 기능
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
	


	




$(document).ready(function(){
	if($("#no_answer").css("display") == 'none'){
		$("#no_answer").hide();
	} else{
		$("#no_answer").show();
	}
});





