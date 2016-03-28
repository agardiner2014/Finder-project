<html>
	<head>	
	
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDPJGZo__Ow0Vwt7Bel7VE-gNPBTkYeALM&libraries=places" type="text/javascript"></script>
<script type="text/javascript">
//function to create map
function createmap(){
			var lng1 = -80.2711588;
      		var lat1 = 26.1544576;
      		
      		var center_location = {lat:lat1, lng:lng1};
      		var map1 = new google.maps.Map(document.getElementById('map'), {center: center_location, zoom:15});
      		
      		function callback(results) {
               for (var i = 0; i < results.length; i++) {
                    createMarker(results[i]);
                  }
                
              }

			function createMarker(place) {
            	    var marker = new google.maps.Marker({
            	      map: map1,
            	      position: place.geometry.location
            	    });
            	    }
}


// function geocoding(address) {
// 	var geocoder = new google.maps.Geocoder();
// 	geocoder.geocode( { 'address': address}, function(results, status) {
//   		if (status == google.maps.GeocoderStatus.OK) {
// 			var lng1 = results[0].geometry.location.lng();
//       		var lat1 = results[0].geometry.location.lat();
//       		var geocodingresult = document.getElementById('geocodingresult');
      		
//       		var center_location = {lat:lat1, lng:lng1};
//       		var map1 = new google.maps.Map(document.getElementById('map'), {center: center_location, zoom:15});
      		
	
//       		var infowindow = new google.maps.InfoWindow();
//             var service = new google.maps.places.PlacesService(map1);
            
//             service.nearbySearch({
//               location: center_location,
//               radius: 2000,
//               type: ['hospital']
//             }, callback);
      		
      		
      		
//             function callback(results, status) {
//                 if (status === google.maps.places.PlacesServiceStatus.OK) {
//                   for (var i = 0; i < results.length; i++) {
//                     createMarker(results[i]);
//                   }
//                 }
//               }

            
//              function createMarker(place) {
//             	    var placeLoc = place.geometry.location;
//             	    var marker = new google.maps.Marker({
//             	      map: map1,
//             	      position: place.geometry.location
//             	    });

//             	    var request = { reference: place.reference };
//             	    service.getDetails(request, function(details, status) {
//             	      google.maps.event.addListener(marker, 'click', function() {
//             	        infowindow.setContent(details.name + "<br />" + details.formatted_address +"<br />" 
//             	        		+ details.website + "<br />" + details.formatted_phone_number);
//             	        infowindow.open(map1, this);
//             	      });
//             	    });
//             	  }
             
		
//        		//geocodingresult.innerHTML = "The geocoding result of address " + address + " is: latitude " + lat1 + ", longitude " + lng1;
//  		} 
//  		else {
//  			var geocodingresult = document.getElementById('geocodingresult');
//       		geocodingresult.innerHTML = "Error result when geocoding the address " + address;
//   		}
// 	});
// }

</script>

	<title>Amos Hospital Finder</title>
</head>
	<body onload="createmap()">
		<p>This is where we show the Google Map API.</p>
		<p>We should add another button to go back home page here.</p>
		<hr/>
		<p>This is the search results from Google API:</p>
		<p>${searchResults}</p>
		<hr/>

		<div id="map" style="height:600px; width:600px"></div>
	</body>
</html>