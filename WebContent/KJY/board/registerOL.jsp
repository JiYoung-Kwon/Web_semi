<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>한줄평 작성</title>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<style>
	.starR{
	  background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
	  background-size: auto 100%;
	  width: 30px;
	  height: 30px;
	  display: inline-block;
	  text-indent: -9999px;
	  cursor: pointer;
	}
	.starR.on{background-position:0 0;}
	
	h2, p, .starRev{
		text-align : center;
	}
	
	textarea{
		width: 385px;
	}
	
	#btn_zone{
		text-align : right;
	}
</style>


</head>
<body>
	<form name = 'frm_ol' id = 'frm_ol' method ='post' action=''>
		<h2>한줄평 작성</h2>
		<input type = 'hidden' name= 'nowPage' id = 'nowPage'/>
		<input type = 'hidden' name = 'bName' />
		<input type = 'hidden' name = 'mid'/>
		<input type = 'hidden' name = 'star' id = 'star' value = '★☆☆☆☆'/>
		
		<p>해당 보드게임은 어떠셨나요?</p>
		
		<div class="starRev">
		  <span class="starR on">별1</span>
		  <span class="starR">별2</span>
		  <span class="starR">별3</span>
		  <span class="starR">별4</span>
		  <span class="starR">별5</span>
		</div>
		<br/>
		<textarea name = 'doc' cols ='50' rows='4' placeholder = "보드게임 이용 후기를 남겨주세요."></textarea>
		
		

		<br/>
		<div id = 'btn_zone'>
			<input type = 'button' value = '작성' id = 'btnInsertOL'/>
		</div>
	</form>
	
	<script src = '/Web_Semi/KJY/board/board.js'></script>
</body>
</html>