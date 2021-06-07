/**
 * 
 */

var map;

var locations = [
	['강남 매장', 37.500773, 127.025836],
	
	['홍대 매장', 37.557136, 126.925109],
	
	['부산 매장', 35.159507, 129.158753],
];

function initMap() {
  var center = { lat:36.569345, lng :127.992274 };

  
  map = new google.maps.Map( document.getElementById('map'), {
      zoom: 7,
      center: center
    });

  var marker, i;

for(i=0; i<locations.length; i++){
	marker =  new google.maps.Marker({
    position: new google.maps.LatLng(locations[i][1], locations[i][2]),
    map: map,
    label: locations[i][0]
  });
}
 
}


function showGangNam(){
	map.panTo(new google.maps.LatLng(locations[0][1], locations[0][2]));
  	map.setZoom(16);
}

function showHongDae(){
	map.panTo(new google.maps.LatLng(locations[1][1], locations[1][2]));
  	map.setZoom(16);
}

function showBusan(){
	map.panTo(new google.maps.LatLng(locations[2][1], locations[2][2]));
  	map.setZoom(16);
}
