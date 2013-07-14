<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

</head>
<div id="wx_module_999">
   <a href="http://www.weather.com/weather/local/20037">Washington Weather Forecast, DC (20037)</a>
</div>

<script type="text/javascript">

function gup( name )
{
  name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp( regexS );
  var results = regex.exec( window.location.href );
  if( results == null )
    return "";
  else
    return results[1];
}
   /* Locations can be edited manually by updating 'wx_locID' below.  Please also update */
   /* the location name and link in the above div (wx_module) to reflect any changes made. */
   var wx_locID = gup('zip');

   /* If you are editing locations manually and are adding multiple modules to one page, each */
   /* module must have a unique div id.  Please append a unique # to the div above, as well */
   /* as the one referenced just below.  If you use the builder to create individual modules  */
   /* you will not need to edit these parameters. */
   var wx_targetDiv = 'wx_module_999';

   /* Please do not change the configuration value [wx_config] manually - your module */
   /* will no longer function if you do.  If at any time you wish to modify this */
   /* configuration please use the graphical configuration tool found at */
   /* https://registration.weather.com/ursa/wow/step2 */
   var wx_config='SZ=160x600*WX=FHC*LNK=SSNL*UNT=F*BGI=seasonal1*MAP=null|null*DN=www.sid-is-here.com*TIER=0*PID=1246852009*MD5=d787b69d8a4769e2ffb0c9815b841dae';

   document.write('<scr'+'ipt src="'+document.location.protocol+'//wow.weather.com/weather/wow/module/'+wx_locID+'?config='+wx_config+'&proto='+document.location.protocol+'&target='+wx_targetDiv+'"></scr'+'ipt>');  
</script>

<body>

</body>
</html>