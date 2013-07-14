<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script type="text/javascript">
function sendmail() {

	
var to=document.getElementById('to');
var sub=document.getElementById('sub');
var ema=document.getElementById('email');

if(to.value==null || to.value=="")
	{ alert('Cannot send email to null');
	}
else if(sub.value==null || sub.value=="")
	{
	alert('Are you sure you want to send subject as: NO SUBJECT?');
	}
else if(ema.value==null || ema.value=="")
	{
	alert('Are you sure you want to send a blank message?');
	}
else{

	if (typeof window.ActiveXObject != 'undefined' ) {
        xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
        xmlDoc.onreadystatechange = process ;
      }
      else {
        xmlDoc = new XMLHttpRequest();
        xmlDoc.onload = process ;
      }

	xmlDoc.open( "POST", "sendemails", true );
	xmlDoc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');	   
	xmlDoc.send("to="+to.value+"&sub="+sub.value+"&email="+ema.value);

	
}
	//alert('about to send email'+to.value+" "+sub.value+" "+" "+email.value);
}

function process() {

    if ( xmlDoc.readyState != 4 ) return ;

	document.getElementById('result').innerHTML="<font color=\"red\" >"+xmlDoc.responseText+"</font>";
	setTimeout("location.href = '/sent.jsp';",2500);
	
}
</script>

</head>
<body>
<table><tr><td id="result"> </td></tr></table>
<!-- <form method="post" action="sendemails"> -->
<%if(request.getParameter("sendto")!=null) {
	%>
	To: <input type="text" id="to" value="<%= request.getParameter("sendto") %>"  /> <br> <br>
	Subject: <input type="text" id="sub" value="<%= request.getParameter("subjectt") %>"/> <br> <br>
	<br>	
Email:<br>
<textarea id="email" rows="20" cols="50" value="<%= request.getParameter("msg") %>"></textarea><br>
	
	<% 
}else {
%>
To: <input type="text" id="to"  /> <br> <br>
Subject: <input type="text" id="sub"/> <br> <br>
<br>	
Email:<br>
<textarea id="email" rows="20" cols="50"></textarea><br>


<%
} %>

<input type="button" name="Submit" value="Send" onclick="sendmail()" />
<!-- </form>  -->
</body>
</html>