<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>Amos Hospital Finder</title>
<script src="http://www.geoplugin.net/javascript.gp" type="text/javascript"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>

<script type="text/javascript">

jQuery(document).ready(function($) {
	//alert("Your location is: " + geoplugin_countryName() + ", " + geoplugin_region() + ", " + geoplugin_city());
	var x = document.getElementById("addr1");
	x.value = geoplugin_city();
	var y = document.getElementById("radius1");
	y.value = '10';
	var z = document.getElementById("place_type1");
	z.value = 'hospital';
});

</script>
<style type="text/css">
/* Reset CSS */
html, body, div, span, applet, object, iframe, h1, h2, h3, h4, h5, h6, p,
	blockquote, pre, a, abbr, acronym, address, big, cite, code, del, dfn,
	em, font, img, ins, kbd, q, s, samp, small, strike, strong, sub, sup,
	tt, var, b, u, i, center, dl, dt, dd, ol, ul, li, fieldset, form, label,
	legend, table, caption, tbody, tfoot, thead, tr, th, td {
	margin: 0;
	padding: 0;
	border: 0;
	outline: 0;
	font-size: 100%;
	vertical-align: baseline;
	background: transparent;
}

body {
/* 	background: #DCDDDF */
/* 		url(http://cssdeck.com/uploads/media/items/7/7AF2Qzt.png); */
		
		background: #E32C2C
		url(http://worldartsme.com/images/caduceus-black-and-white-clipart-1.jpg);
		background-size: 50% 50%;
	color: #000;
	font: 14px Arial;
	margin: 0 auto;
	padding: 0;
	position: relative;
}

h1 {
	font-size: 28px;
}

h2 {
	font-size: 26px;
}

h3 {
	font-size: 18px;
}

h4 {
	font-size: 16px;
}

h5 {
	font-size: 14px;
}

h6 {
	font-size: 12px;
}

h1, h2, h3, h4, h5, h6 {
	color: #563D64;
}

small {
	font-size: 10px;
}

b, strong {
	font-weight: bold;
}

a {
	text-decoration: none;
}

a:hover {
	text-decoration: underline;
}

.left {
	float: left;
}

.right {
	float: right;
}

.alignleft {
	float: left;
	margin-right: 15px;
}

.alignright {
	float: right;
	margin-left: 15px;
}

.clearfix:after, form:after {
	content: ".";
	display: block;
	height: 0;
	clear: both;
	visibility: hidden;
}

.container {
	margin: 25px auto;
	position: relative;
	width: 900px;
}

#content {
	background: #f9f9f9;
	background: -moz-linear-gradient(top, rgba(248, 248, 248, 1) 0%,
		rgba(249, 249, 249, 1) 100%);
	background: -webkit-linear-gradient(top, rgba(248, 248, 248, 1) 0%,
		rgba(249, 249, 249, 1) 100%);
	background: -o-linear-gradient(top, rgba(248, 248, 248, 1) 0%,
		rgba(249, 249, 249, 1) 100%);
	background: -ms-linear-gradient(top, rgba(248, 248, 248, 1) 0%,
		rgba(249, 249, 249, 1) 100%);
	background: linear-gradient(top, rgba(248, 248, 248, 1) 0%,
		rgba(249, 249, 249, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#f8f8f8',
		endColorstr='#CFCFCF', GradientType=0);
	-webkit-box-shadow: 3px 3px 5px 6px #2B2B2B;
	-moz-box-shadow:    3px 3px 5px 6px #2B2B2B;
	-ms-box-shadow: 3px 3px 5px 6px #2B2B2B;
	-o-box-shadow: 3px 3px 5px 6px #2B2B2B;
	box-shadow:         3px 3px 5px 6px #2B2B2B;
	border: 1px solid #A5A6A7;
	margin: 0 auto;
	padding: 25px 0 0;
	position: relative;
	text-align: center;
	text-shadow: 0 1px 0 #fff;
	width: 400px;
}

#content h1 {
	color: #7E7E7E;
	font: bold 25px Helvetica, Arial, sans-serif;
	letter-spacing: -0.05em;
	line-height: 20px;
	margin: 10px 0 30px;
}

#content h1:before, #content h1:after {
	content: "";
	height: 1px;
	position: absolute;
	top: 10px;
	width: 27%;
}


#content form {
	margin: 0 20px;
	position: relative
}

#content form input[type="text"]{
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	-ms-border-radius: 3px;
	-o-border-radius: 3px;
	border-radius: 3px;
	-webkit-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
	-moz-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
	-ms-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
	-o-box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
	box-shadow: 0 1px 0 #fff, 0 -2px 5px rgba(0, 0, 0, 0.08) inset;
	-webkit-transition: all 0.5s ease;
	-moz-transition: all 0.5s ease;
	-ms-transition: all 0.5s ease;
	-o-transition: all 0.5s ease;
	transition: all 0.5s ease;
	/* 	background: #eae7e7 url(http://cssdeck.com/uploads/media/items/8/8bcLQqF.png) no-repeat; */
	border: 1px solid #c8c8c8;
	color: #777;
	font: 13px Helvetica, Arial, sans-serif;
	margin: 0 0 10px;
	padding: 15px 10px 15px 40px;
	width: 80%;
}

#content form input[type="submit"] {
	background: rgb(254, 231, 154);
	background: -moz-linear-gradient(top, rgba(254, 231, 154, 1) 0%,
		rgba(254, 193, 81, 1) 100%);
	background: -webkit-linear-gradient(top, rgba(254, 231, 154, 1) 0%,
		rgba(254, 193, 81, 1) 100%);
	background: -o-linear-gradient(top, rgba(254, 231, 154, 1) 0%,
		rgba(254, 193, 81, 1) 100%);
	background: -ms-linear-gradient(top, rgba(254, 231, 154, 1) 0%,
		rgba(254, 193, 81, 1) 100%);
	background: linear-gradient(top, rgba(254, 231, 154, 1) 0%,
		rgba(254, 193, 81, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fee79a',
		endColorstr='#fec151', GradientType=0);
	-webkit-border-radius: 30px;
	-moz-border-radius: 30px;
	-ms-border-radius: 30px;
	-o-border-radius: 30px;
	border-radius: 30px;
	-webkit-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
	-moz-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
	-ms-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
	-o-box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
	box-shadow: 0 1px 0 rgba(255, 255, 255, 0.8) inset;
	border: 1px solid #D69E31;
	color: #85592e;
	cursor: pointer;
	text-align: center;
	font: bold 15px Helvetica, Arial, sans-serif;
	height: 35px;
	margin: 20px 0 35px 15px;
	position: relative;
	text-shadow: 0 1px 0 rgba(255, 255, 255, 0.5);
	width: 120px;
}

#content form input[type="submit"]:hover {
	background: rgb(254, 193, 81);
	background: -moz-linear-gradient(top, rgba(254, 193, 81, 1) 0%,
		rgba(254, 231, 154, 1) 100%);
	background: -webkit-linear-gradient(top, rgba(254, 193, 81, 1) 0%,
		rgba(254, 231, 154, 1) 100%);
	background: -o-linear-gradient(top, rgba(254, 193, 81, 1) 0%,
		rgba(254, 231, 154, 1) 100%);
	background: -ms-linear-gradient(top, rgba(254, 193, 81, 1) 0%,
		rgba(254, 231, 154, 1) 100%);
	background: linear-gradient(top, rgba(254, 193, 81, 1) 0%,
		rgba(254, 231, 154, 1) 100%);
	filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#fec151',
		endColorstr='#fee79a', GradientType=0);
}

#content form div a {
	color: #004a80;
	float: right;
	font-size: 12px;
	margin: 30px 15px 0 0;
	text-decoration: underline;
}
</style>


</head>
<body>

	<div class="container">
		<section id="content">
			<h1>Hospital Finder!</h1>


			<form action="search_places" method="GET">
				Address: <input type="text" name="addr"> <br /> <br />
				Radius: <select id="radius" name="radius">
					<option value="5">5 Miles</option>
					<option value="10">10 Miles</option>
					<option value="15">15 Miles</option>
					<option value="20">20 Miles</option>
					<option value="25">25 Miles</option>
					<option value="30">30 Miles</option>
				</select> <br /> <br /> Place Type: <select id="place_type"
					name="place_type">
					<option value="hospital">Hospital</option>
					<option value="health">Health</option>
					<option value="insurance_agency">Insurance Agency</option>
					<option value="pharmacy">Pharmacy</option>
				</select> <br /> <br /> <input type="submit" value="Find For Me" />
			</form>
			
			
				<div id= "emergency_button">
					<form action="search_places" method="GET">
						<input type="hidden" id= "addr1" name="addr">
						In Case of Emergency Press Buton Below, Hospitals Will Be Listed Based On Your Location.
						<br /><input type="hidden" id="radius1" name="radius"></input>
						<input type="hidden" id="place_type1" name="place_type"></input>
						<input type="submit" value="EMERGENCY!" />
					</form>
	</div>
		</section>
		
	</div>
	

	

</body>
</html>