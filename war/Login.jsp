<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<link rel="stylesheet" href="blog.css">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body onLoad="document.forms.MyForm.username.focus()">

<form name="MyForm" action="/log" method="post">
<table class="loginn" align="center" cellpadding="2px;"  background="Logg.jpg">
<tr><td class="loginn" width="90px" >Username:</td> 

<td class="loginn" width="50px" colspan="2"> <div style="width: 100px"><input name="username"  type="text" style="width: 98px"></div>
</td>
</tr>
<tr>
<td class="loginn">Password:</td>
<td class="loginn" colspan="2" style="width: 121px"><div style="width: 100px"><input name="password" type="password" style="width: 96px"></div></td>
</tr>


<tr>
<td ></td>
<td>
      <div><input name="Log" type="Submit" value="Log in" /></div></td>
    <td align="left">  <input name="Newuser" type="Submit" value="New User" />
      
</td>
</tr>


</table>
</form>
</body>
</html>