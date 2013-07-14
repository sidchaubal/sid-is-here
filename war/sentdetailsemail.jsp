<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
      <%@ page import="com.google.aboutme.sentemails" %>
      <%@ page import="javax.jdo.PersistenceManager" %>
        <%@ page import="com.google.aboutme.PMF" %>
           <%@ page import="java.util.List" %>
                      <%@ page import="java.util.Date" %>
           
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
String query = "select from " + sentemails.class.getName()+" WHERE id=="+request.getParameter("mid");
List<sentemails> ems = (List<sentemails>) pm.newQuery(query).execute();
String sendr="";
Date sedate=new Date();
String msg=" ";
String sub=" ";

for(sentemails m: ems)
{
		
			sendr=m.getSent_to();
			sedate=m.getSentdate();
			msg=m.getMessg();
			sub=m.getSubject();
			System.out.println("in for loop"+sendr+sedate+msg+sub);
		}
pm.close();
%>
To: <%= sendr%><br><br>
Subject: <%= sub %> <br><br>
Date: <%= sedate.toString() %><br>
<br>
<br>
Message:<br><br>
<%= msg %>
</body>
</html>