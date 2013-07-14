<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="http://code.google.com/apis/gears/gears_init.js" >
</script>
<script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script> 
    <script type="text/javascript"> 
  
    var initialLocation;
    var siberia = new google.maps.LatLng(60, 105);
    var newyork = new google.maps.LatLng(40.69847032728747, -73.9514422416687);
    var browserSupportFlag =  new Boolean();
    var map;
    var infowindow = new google.maps.InfoWindow();
    var map;
    var address;
   var zip;
 
    
   function getAddress(input)
   {    
   		var geocoder;
       	geocoder = new google.maps.Geocoder();
   	    geocoder.geocode({'latLng': input}, function(results, status) 
   	    		{
   	      			if (status == google.maps.GeocoderStatus.OK) 
   	      				{
   	        				if (results[0]) 
   	        				{
   	        					var add=results[0].formatted_address;
		 						if(add==null)
       	 							add="Default Location:    Ahmedabad, India";
		 						var cit=results[0].address_components[4].long_name;
		 						if(results[0].address_components[6].long_name == "India")
				   		        	document.getElementById('chanme').innerHTML="Weather in your area: <br> <a href=\"http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:00000.1.42647&bannertypeclick=wu_macwhite\"><img src=\"http://weathersticker.wunderground.com/cgi-bin/banner/ban/wxBanner?bannertype=wu_macwhite&ForcedCity="+cit+"&ForcedState=\" alt=\"Click for Ahmedabad, India Forecast\" height=\"90\" width=\"160\" /></a>"
		 						else
		 							alert("this is not india")
	        					document.getElementById('addr').innerHTML="Location using IP: <br>"+add; 	
	         					//document.getElementById('chanme').innerHTML="Weather in your area: <br> <iframe allowtransparency=\"true\" marginwidth=\"0\" marginheight=\"0\" hspace=\"0\" vspace=\"0\" frameborder=\"0\" scrolling=\"no\" src=\"http://weather.yahoo.com/badge/?ip=yes&u=f&t=trans&l=vertical\" height=\"255px\" width=\"186px\"></iframe><noscript>";
			   		        	//document.getElementById('chanme').innerHTML="Weather in your area: <br> <a href=\"http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:00000.1.42647&bannertypeclick=wu_macwhite\"><img src=\"http://weathersticker.wunderground.com/cgi-bin/banner/ban/wxBanner?bannertype=wu_macwhite&ForcedCity=Ahmedabad&ForcedState=\" alt=\"Click for Ahmedabad, India Forecast\" height=\"90\" width=\"160\" /></a>"
   	        				}
   	      				} 
   	      			else 
   	      			{
   	        			alert("Geocoder failed due to: " + status);
   	      			}
   	    		});
   	  }
      function initialize() 
      {
      // Try W3C Geolocation method (Preferred)
      if(navigator.geolocation) 
      {
        browserSupportFlag = true;
        navigator.geolocation.getCurrentPosition(function(position) 
        {
        	initialLocation = new google.maps.LatLng(position.coords.latitude,position.coords.longitude);
          	contentString = "Location found using W3C standard";
          	getAddress(initialLocation);
        }, function() 
        {
          handleNoGeolocation(browserSupportFlag);
        });
      } else if (google.gears) 
      {
        // Try Google Gears Geolocation
        browserSupportFlag = true;
        var geo = google.gears.factory.create('beta.geolocation');
        geo.getCurrentPosition(function(position) {
          initialLocation = new google.maps.LatLng(position.latitude,position.longitude);
          contentString = "Location found using Google Gears";
          getAddress(initialLocation);
        }, function() 
        {
          handleNoGeolocation(browserSupportFlag);
        });
      	} 
      else 
      	{
        // Browser doesn't support Geolocation
        browserSupportFlag = false;
        handleNoGeolocation(browserSupportFlag);
        alert("no browser support");
      }
    }
     
    function handleNoGeolocation(errorFlag) {
      if (errorFlag == true) {
        initialLocation = newyork;
        contentString = "Error: The Geolocation service failed.";
      } else {
        initialLocation = siberia;
        contentString = "Error: Your browser doesn't support geolocation. Are you in Siberia?";
      }
     alert(content);
    }

 var xmlDoc = null ;
    
    function load() 
    {
      if (typeof window.ActiveXObject != 'undefined' ) 
      {
        xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
        xmlDoc.onreadystatechange = process ;
      }
      else 
      {
        xmlDoc = new XMLHttpRequest();
        xmlDoc.onload = process ;
      }
      
      if(zip==null)
          zip=20037;
      
      xmlDoc.open( "GET", "/getw?z="+zip, true );
      xmlDoc.send( null );
      //alert('waiting');
    }

    function process() 
    {
        if ( xmlDoc.readyState != 4 ) return ;
		var imag=xmlDoc.responseXML.getElementsByTagName("url")[0].childNodes[0].nodeValue;
		var reg=xmlDoc.responseXML.getElementsByTagName("title")[0].childNodes[0].nodeValue;
		var childNode = xmlDoc.responseXML.getElementsByTagName("description")[1].childNodes[0];
		document.getElementById('chanme').innerHTML="<b>Weather in your area:</b><br>"+childNode.nodeValue; 
    }
    

   initialize();
 
    </script> 


<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>

<body>

<table>
<tr>
	<td id="addr"></td>
</tr>
<tr>
	<td id="chanme" style="font-size: 12px; font-family:Cambria; ">
	<!--  <span style="display: block !important; width: 180px; text-align: center; font-family: sans-serif; font-size: 12px;"><a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:94101.1.99999&bannertypeclick=wu_travel_map2" title="San Francisco, California Weather Forecast" target="_blank"><img src="http://weathersticker.wunderground.com/weathersticker/cgi-bin/banner/ban/wxBanner?bannertype=wu_travel_map2_metric&airportcode=&ForcedCity=&ForcedState=&zip=22030&language=EN" alt="Find more about Weather in San Francisco, CA" width="160" /></a><br><a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:94101.1.99999&bannertypeclick=wu_travel_map2" title="Get latest Weather Forecast updates" style="font-family: sans-serif; font-size: 12px" target="_blank">Click for weather forecast</a></span>-->
	<script type="text/javascript" src="http://voap.weather.com/weather/oap/USVA0262?template=GENXV&par=3000000007&unit=0&key=twciweatherwidget"></script>
	</td>	
</tr>

</table>
</body>
</html>