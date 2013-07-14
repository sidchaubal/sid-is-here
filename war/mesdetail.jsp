<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.google.aboutme.mailstore" %>
      <%@ page import="javax.jdo.PersistenceManager" %>
        <%@ page import="com.google.aboutme.PMF" %>
           <%@ page import="java.util.List" %>
                      <%@ page import="java.util.Date" %>
           <%@ page import="com.google.appengine.api.datastore.Text" %>
           
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

</head>

<body>
<%
	String messg="temp message ";
PersistenceManager pm = PMF.get().getPersistenceManager();
System.out.println("mid is: "+request.getParameter("mid"));
String query = "select from " + mailstore.class.getName()+" WHERE id=="+request.getParameter("mid");
List<mailstore> ems = (List<mailstore>) pm.newQuery(query).execute();
String sendr="";
Date sedate=new Date();
String msg=" ";
String sub=" ";
String sendremail=" ";
for(mailstore m: ems)
{
		
			sendr=m.getSender();
			sedate=m.getSentdate();
			msg=m.getMessg().getValue();
			sub=m.getSubject();
			sendremail=m.getSenderemail();
			System.out.println("in for loop"+sendr+sedate+msg+sub);
		}
pm.close();
%>
From: <%= sendr%> (<%=  sendremail%>)<br><br>
Subject: <%= sub %> <br><br>
Date: <%= sedate.toString() %><br>
<br>

<input type="Submit" value="Reply" onclick="window.location='/compose.jsp?sendto=<%= sendremail%>&subjectt=Re:<%= sub %>'" />
<br>
Message:  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

<br><br>
<%= msg %>
<br>

</body>
</html>