<html>
<head>

<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPJGZo__Ow0Vwt7Bel7VE-gNPBTkYeALM&libraries=places"
	type="text/javascript"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.4.9/angular.min.js"></script>
	
<script type="text/javascript">
	

		var lng1 = ${lng};
		var lat1 = ${lat};
		var cities = ${searchResults};

	//Angular App Module and Controller
	angular.module('mapsApp', [])
	.controller('MapCtrl', function ($scope) {

	    var mapOptions = {
	        zoom: 12,
	        center: new google.maps.LatLng(lat1, lng1)//,
	       // mapTypeId: google.maps.MapTypeId.TERRAIN
	    }

	    $scope.map = new google.maps.Map(document.getElementById('map'), mapOptions);

	    $scope.markers = [];
	    
	    var infoWindow = new google.maps.InfoWindow();
	    
	    var createMarker = function (info){
	        
	        var marker = new google.maps.Marker({
	            map: $scope.map,
	            position: new google.maps.LatLng(info.geometry.location.lat, info.geometry.location.lng),
	            title: info.name,
	            icon: info.icon
	        });
	        marker.content = '<div class="infoWindowContent">' + info.vicinity + '<br/>' + info.icon + '</div>';
	        
	        google.maps.event.addListener(marker, 'click', function(){
	            infoWindow.setContent('<h2>' + marker.title + '</h2>' + marker.content);
	            infoWindow.open($scope.map, marker);
	        });
	        
	        $scope.markers.push(marker);
	        
	    }  
	    
	    for (i = 0; i < cities.results.length; i++){
	        createMarker(cities.results[i]);
	    }

	    $scope.openInfoWindow = function(e, selectedMarker){
	        e.preventDefault();
	        google.maps.event.trigger(selectedMarker, 'click');
	    }

	});
	
</script>

<style type="text/css">

.main{
width:80%;
float: right;
height: 100%;
/* margin: 20px 205px 0; */

}
.top {
background: white;
width:100%;
height: 92px;
}

.left {
float:left;
width: 20%;
height: 100%;
background: grey;
/* margin: 20px 0px 0; */

	        box-shadow: 0px 0px 20px 0px black;
}

</style>

<title>Amos Hospital Finder</title>
</head>

<body>
	
	<div class="top">
		<p>This is where we show the Google Map API.</p>
		<p>We should add another button to go back home page here.</p>
		<INPUT TYPE="button" VALUE="Search Again!" onClick="history.go(-1);">
		<hr />
	</div>
	<div ng-app="mapsApp" ng-controller="MapCtrl" >
		
		
    	<div class="main" id="map"></div>
    	<div class="left">
    	<br>
    	<li id="class" ng-repeat="marker in markers | orderBy : 'title'">
        	<a href="#" ng-click="openInfoWindow($event, marker)">{{marker.title}}</a>
    	</li>
    	</div>
	</div>
</body>
</html>