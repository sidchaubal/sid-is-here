<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.google.appengine.api.users.*" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Mail Account</title>
</head>
 <link type="text/css" rel="stylesheet" href="Email.css">
<script type="text/javascript">
function changeto (pag)
{
var var1=pag;
document.getElementById('cen').innerHTML="<iframe src=\""+var1+"\" frameborder=\"0\" scrolling=\"AUTO\" height=\"480px\" width=\"620px\"></iframe>";
	
	}
</script>
<body>
<br>
<font color="Blue" style="font-family:Verdana, sans-serif; padding-left:200px; font-size: 12pt "  >Welcome Sid. </font>
<%
UserService userService = UserServiceFactory.getUserService();
%>
<div class="mainbox">

<div class="leftbox">

<br>
<a href="javascript:changeto('compose.jsp')">Compose</a><br><br>
<a href="javascript:changeto('inbox.jsp')">Inbox </a><br><br>
<a href="javascript:changeto('sent.jsp')">Sent </a><br><br>
<a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">Log Out!</a><br><br>


<div class="centerbox">
<table><tr><td id='cen'>
<iframe src='inbox.jsp' height="480px" width="620px" scrolling="Auto" frameborder="0"></iframe>
</td></tr>
</table>
</div>

</div>





</div>



</body>
</html>