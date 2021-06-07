<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width = device-width, initial-scale=1.0'>
<title>입력</title>
<script src = '/Web_Semi/KJY/board/board.js'></script>
<script src = '/Web_Semi/lib/jquery-3.6.0.min.js'></script>
<style>
	textarea{
		width: 450px;
    	height: 190px;
	}
	#attfile{
		display:none;
	}
	
	#board {
    width: 800px;
    margin: 0 auto;
	}
	.board_h2{
		color: yellow;
    	text-shadow: 3px 1px 11px white;
	}
	#frm_board{
	margin-bottom: 5px;
	margin: 25px auto;
	color: white;
	line-height: 2;	
	width: 750px;
    padding-left: 130px;
    padding-top: 50px;
    padding-bottom: 0px;
    height: 920px;
    border : 1px solid;
	}
	#frm_board>label{
    width: 100px;
    display: inline-block;
    font-weight:bold;
	font-size : 1.3em;
	}
	
	.top_input{
	border-radius: 3px;
    width: 170px;
    height: 25px;
	}
	.num_input{
	border-radius: 3px;
    width: 50px;
    height: 25px;
    text-align:right;
	}
	
	#btn_zone{
		width:500px;
		text-align:center;
	}
	
	#btn_zone> input{
	border: 1px solid #ffffff87;
    width: 75px;
    height: 25px;
    border-radius: 5px;
    font-weight: bold;
    background: #ff000000;
    color: #fff6a6;
    text-shadow: 3px 1px 11px white;
	}
	
	select{
	height: 25px;
	}
</style>
</head>
<body>
	<div id = 'board'>
		<h2 class="board_h2">Modify</h2>
		
		<!-- 일반 정보 폼 -->
		<form name='frm_board' id = 'frm_board' method='post' action=''>		
			<label>보드게임</label>
			<input type = 'hidden' name = 'gubun' value = '${vo.bName}'/>
			
			<input type ='text' name ='bName' placeholder = '한글명 입력' value = '${vo.bName }' class="top_input"/>
			<input type ='text' name ='eName' placeholder = '영문명 입력' value = '${vo.eName }' class="top_input"/>
			<br/>
			
			<label>내용</label>
			<br/>
			<textarea name = 'expl' placeholder='보드게임 상세 설명 입력' >${vo.expl }</textarea>
			<br/>
			
			<label>난이도</label>
			<input type='radio' name='diff' value = 'Easy' ${(vo.diff=='Easy')? 'checked' : '' }>Easy
			<input type='radio' name='diff' value = 'Normal' ${(vo.diff=='Normal')? 'checked' : '' }>Normal
			<input type='radio' name='diff' value = 'Hard' ${(vo.diff=='Hard')? 'checked' : '' }>Hard
			<br/>
			
			<label>인원</label>
			<input type = 'number' name = 'minPerson' value = '${vo.minPerson }' class="num_input"/>명 -
			<input type = 'number' name = 'maxPerson' value = '${vo.maxPerson }' class="num_input"/>명
			<br/>
			
			<label>게임시간</label>
			<input type = 'number' name = 'minTime' value = '${vo.minTime }' class="num_input"/>분 -
			<input type = 'number' name = 'maxTime' value = '${vo.maxTime }' class="num_input"/>분
			<br/>
			
			<label>보유 매장</label>
			<input type='checkbox' name='store' value = '강남' checked ='checked'>강남
			<input type='checkbox' name='store' value = '홍대'>홍대
			<input type='checkbox' name='store' value = '부산'>부산
			<br/>
			
			<label>장르</label>
			<select name = 'genre'>
				<option value = "전략" ${(vo.genre=='전략')? 'selected' : '' }>전략</option>
				<option value = "추리" ${(vo.genre=='추리')? 'selected' : '' }>추리</option>
				<option value = "배팅" ${(vo.genre=='배팅')? 'selected' : '' }>배팅</option>
				<option value = "복불복" ${(vo.genre=='복불복')? 'selected' : '' }>복불복</option>
				<option value = "순발력" ${(vo.genre=='순발력')? 'selected' : '' }>순발력</option>
			</select>
			<br/>
						
			<!-- 이미지는 한 개만 선택할 수 있음 -->
			<label>이미지</label>
			<div id = 'image_preview'>
				<div id = 'attzone'>
					<img src = '/Web_Semi/KJY/upload/${vo.sysAtt }' width = '180px' height = '210px' id = 'photo'/>
				</div>
			</div>			
			<br/>
			<input type='file' name='attfile' id = 'attfile'/>
			
			<div id = 'btn_zone'>
				<input type='button' value='수정' id = 'btnUpdate'/>
				<input type='button' value='취소' id = 'btnSelect'/>
			</div>
			<br/>			
						
			<input type = 'hidden' name = 'nowPage' value = '${param.nowPage }'/>
			<input type = 'hidden' name = 'findStr' value = '${param.findStr }'/>
		</form>	

			

	</div>
	
</body>
</html>