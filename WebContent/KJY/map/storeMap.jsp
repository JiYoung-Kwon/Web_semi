<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<script src = '/Web_Semi/KJY/map/store.js'></script>
	<style>
		#map{
			width:700px;
			height:400px;
			float:left;
			margin-right:10px;
		}
		
		button{
			display:block;
			border: 1px solid #ffffff87;
		    width: 75px;
		    height: 25px;
		    border-radius: 5px;
		    font-weight: bold;
		    background: #ff000000;
		    color: #fff6a6;
		    text-shadow: 3px 1px 11px white;
		    margin-bottom:15px;
		}
		
		#btn_zone{
			margin-top : 250px;
		}
		
		#storeMap {
		 width: 800px;
		margin: 0 auto;
		}
		
		h2{
		color: yellow;
    	text-shadow: 1px 1px 6px white;
		}
	</style>
	
	<script src = "http://maps.googleapis.com/maps/api/js?key=AIzaSyCEyrtmU5850xBpZbKU6m-R8tM6q0_601A&callback=initMap&region=kr"async defer></script>

<body>
	<div id="storeMap">
		<br/>
		<h2>매장 지도 보기</h2>
		<br/>
		<div id = "map"></div>
		
		<div id = 'btn_zone'>
		<button onclick = "initMap()">전체 보기</button>	
		<button onclick = "showGangNam()">강남 매장</button>
		<button onclick = "showHongDae()">홍대 매장</button>
		<button onclick = "showBusan()">부산 매장</button>
		</div>
	
	</div>
</body>
</html>