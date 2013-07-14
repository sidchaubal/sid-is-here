<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<!--<jsp:include page="menu.html"></jsp:include> -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>CRS: Subscribe</title>
<script type="text/javascript">
function submit()
{
	var name1=document.getElementById("name");
	var email1=document.getElementById("email");
	var phone1=document.getElementById("phone");
	var weekly1=document.getElementById("weekly");
	var daily1=document.getElementById("daily");
	var gwid1=document.getElementById("gwid");
	
	if(name1.value!="" && name1.value!=null && gwid1.value!="" && gwid1.value!=null)
		{ if(email1.value!="" || phone1.value!="")
			{
			sendtoserver(name1,gwid1,email1,phone1,weekly1,daily1);
			}
		else
			{alert('You need either a valid email or valid phone to subscribe'); }
		}
	else
		alert('Name/GWid is mandatory for Subscription');
	
	}
	
function sendtoserver(name1, gwid1,email1,phone1,weekly1,daily1)
{
	if (typeof window.ActiveXObject != 'undefined' ) {
        xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
		xmlDoc.onreadystatechange = process ;
      }
      
	else {  
	xmlDoc = new XMLHttpRequest();  
	xmlDoc.onload = process ;
	      }
  
	var when="weekly";
	
	if(daily1.checked)
		when="daily";
	
	xmlDoc.open( "POST", "subscription", true );
	xmlDoc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');	  
	xmlDoc.send("name="+name1.value+"&gwid="+gwid1.value+"&email="+email1.value+"&phone="+phone1.value+"&when="+when);
	
	}
function process() {

	if ( xmlDoc.readyState != 4 ) return ;
	 var suc=xmlDoc.responseXML.getElementsByTagName("persisted")[0].childNodes[0].nodeValue;
	//alert(suc);
	 if(suc=="Success")		        
	{document.getElementById("response").innerHTML="<br>Subscription Added!";
	}		       
	 else		        	
	{document.getElementById("response").innerHTML="<br> ERROR: Please TRY again";
	}

}
</script>

</head>
<body>
<br><br>
<font color="blue" size="6" style="font-family: Times New Roman"> Subscribe to Crime Alerts </font>
<br> <br>
<table bgcolor="green" border="1">
<tr>
<td> <font size="5">Name:</font> <font color="red">*</font></td> <td>   <input type="text" width="20" id="name"><br>
</td>
</tr>
<tr>
<td>
<font size="5">GWid:</font><font color="red">*</font> </td> <td> G<input type="text" width="20" id="email" style="width: 143px; "> <br>
</td></tr>
<tr>
<td>
<font size="5">Email:</font> 
</td> <td><input type="text" width="20" id="gwid"><br>
</td></tr>
<tr>
<td>
<font size="5">Phone:</font></td> <td> <input type="text" width="20" id="phone"  /> <br>
</td></tr>
<tr>
<td>
<font size="5">Alerts:</font> </td> <td> <input type="checkbox" id="weekly" checked="checked" />Weekly <input type="checkbox" id="Daily"   />Daily <br>
</td></tr>

</table>
<input type="button" value='Subscribe' onclick="submit()" style="width: 84px; ">

<table>
<tr>
<td id="response">
</td>
</tr>
</table> 
</body>
</html>