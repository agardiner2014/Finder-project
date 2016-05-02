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
height: 87%;
/* margin: 20px 205px 0; */

}
.top {
background: white;
width:100%;
height: 13%;
}


h1{
text-align: center;
font-family: "proxima-nova-soft", "Proxima Nova Soft", Helvetica, Arial, sans-serif;
text-transform: uppercase;
}

a{
font-family: "proxima-nova-soft", "Proxima Nova Soft", Helvetica, Arial, sans-serif;
}

.left {
float:left;
width: 20%;
height: 87%;
background: #DAD3D2;
box-shadow: 0px 0px 20px black;
position: relative;
font-style: Tahoma;
overflow-y:auto
}

</style>

<title>Amos Hospital Finder</title>
</head>

<body>
	
	<div class="top">
		<h1>${places_type} RESULTS</h1>
			<form action="search_places" method="GET" style="float: right;">
				<input type="text" id= "addr1" name="addr">
				<input type="hidden" value=10 name="radius">
				<input type="hidden" value='hospital' name="place_type">
				<input type="submit" value="Searh Again!" />
			</form>
			<INPUT TYPE="button" VALUE="Home" onClick="location.href = '/aclerizier';">	
	</div>
	<hr />
	
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