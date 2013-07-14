<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.google.aboutme.logs" %>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.aboutme.PMF" %>
    <%@  page import= "javax.servlet.ServletRequest" %>
   <%@ page import="com.google.appengine.api.datastore.Text" %>
     <%@ page import="com.google.appengine.api.users.*" %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Todo Log Viewer</title>
</head>
<body>
<% UserService userService = UserServiceFactory.getUserService();
User user = userService.getCurrentUser();
request.setCharacterEncoding("UTF-8");
%>
<center><b>Welcome to ToDo Log viewer <%= user.getNickname() %></b></center>
<table >
<% PersistenceManager pm = PMF.get().getPersistenceManager();

String query = "select from " + logs.class.getName();
    List<logs> content = (List<logs>) pm.newQuery(query).execute();
    logs result=new logs();
    
    if(!content.isEmpty())
    {
    	for(logs a:content)
    	{ Text logy=a.getLogy();
    	  String usr=a.getUser();
    	
%>
    	<tr style="">
    	<td style="border: 0px 0px 2px 2px;border-color:black;  border-style: solid;">
    	<%=usr %>
    	</td>
    	
    	<td style="border-bottom:2px;border-bottom-color:black; border-style: solid;">
    	<%=logy.getValue() %>
    	</td>
    	
    	</tr>
    	    	
<%
    	  	
    	}
    }
    
    
    %>
</table>

</body>
</html>