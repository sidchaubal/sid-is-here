<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.google.aboutme.mailstore" %>
      <%@ page import="javax.jdo.PersistenceManager" %>
        <%@ page import="com.google.aboutme.PMF" %>
           <%@ page import="java.util.List" %>
                   <%@ page import="java.util.TimeZone" %>
        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
</head>
<body>
<%
TimeZone.setDefault(TimeZone.getTimeZone("EST"));

//mailstore ems=new mailstore();
PersistenceManager pm = PMF.get().getPersistenceManager();

String query = "select from " + mailstore.class.getName()+" ORDER BY sentdate DESC";
List<mailstore> ems = (List<mailstore>) pm.newQuery(query).execute();

if(!(ems.isEmpty())) {
for(mailstore m: ems)
{
%>
 <font color="red" ><%= m.getSentdate() %></font> <b> <%= m.getSender() %> </b> <a href="/mesdetail.jsp?mid=<%= m.getId() %>" ><%= m.getSubject() %></a> 
<br>
<br>

<%	
}}
else {
	%>
	You have No New Messages.
	<%
}
pm.close();
%>
</body>
</html>