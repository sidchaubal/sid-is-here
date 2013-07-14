 <%@ page import="com.google.aboutme.storeComments" %>
 <%@ page import="com.google.aboutme.pagecontent" %>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.aboutme.PMF" %>
    <%@  page import= "javax.servlet.ServletRequest" %>
   <%@ page import="com.google.appengine.api.datastore.Text" %>
   <%
PersistenceManager pm = PMF.get().getPersistenceManager();
PersistenceManager pmc = PMF.get().getPersistenceManager();
String pages=request.getParameter("blog");
System.out.println("requested blog is "+pages);
if(pages==null)
pages="Current";
String query = "select from " + storeComments.class.getName();
    List<storeComments> greet = (List<storeComments>) pm.newQuery(query).execute();
    storeComments result=new storeComments();
    
String contentQuery="select from "+ pagecontent.class.getName();
List<pagecontent> allcontent = (List<pagecontent>) pmc.newQuery(contentQuery).execute();

if(allcontent.isEmpty())
{
  pagecontent home=new pagecontent();
  home.setPage("Current");
  Text upload=new Text("I am a BIG fan of Apple so this webspace is going to be mainly an \"APPLE BLOG\"<br></br>Please accept \"Share Location\" for this site as this site is capable of showing your current location and also the weather in your area.	<br></br>Also at the bottom of the Page you will find your favorite chat applications all lined up and ready to use! (MEEBO)<br><br><center><b><style=\"font-size:18px;\">APPLE NEWS</style></b></center><br><br><bold> iPad to be available on <i>VERIZON</i> network </bold><br><object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/x_RdlxsBMNg?fs=1&amp;hl=en_US\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/x_RdlxsBMNg?fs=1&amp;hl=en_US\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"640\" height=\"385\"></embed></object><br><br><bold>No News Yet for when the <i>WHITE</i> iPhone 4 is coming out</bold><br>Below is a video where you can see the *REAL* white iphone 4 in a UK store<br><object width=\"640\" height=\"385\"><param name=\"movie\" value=\"http://www.youtube.com/v/N7RkGNnfz-g?fs=1&amp;hl=en_US\"></param><param name=\"allowFullScreen\" value=\"true\"></param><param name=\"allowscriptaccess\" value=\"always\"></param><embed src=\"http://www.youtube.com/v/N7RkGNnfz-g?fs=1&amp;hl=en_US\" type=\"application/x-shockwave-flash\" allowscriptaccess=\"always\" allowfullscreen=\"true\" width=\"640\" height=\"385\"></embed></object>");
  home.setContent(upload);
pmc.makePersistent(home);
}
    
%>
<table id="tab1" height=100% align="center">
<tr>
	<td style="font-family: Arial; font-size: 14px; ">
	<b>Welcome to <i>MY</i> Website!</b>
	<article>

	<p>
<% 
List<pagecontent> newcontent = (List<pagecontent>) pmc.newQuery(contentQuery).execute();
Text con=new Text("default");
for(pagecontent b:newcontent)
{ System.out.println(b.getPage());
String com=pages;
 if(b.getPage().equals(com))
 { con=b.getContent();
   //System.out.println(con.getValue());
 }}
  %>
  <%=con.getValue() %> 
  <br> 
  </p>
  </article>
	</td>
</tr>
<% 
 
 pmc.close();
  if(greet.isEmpty()) {
  %>
  <tr>
	<td>
	
Comments:		
	</td>

</tr>
  <%
  } else {
  %>
  <tr>
  <td><br><br>
	Comments: </td>
  </tr>
  <%
 for(storeComments a:greet){
 if(a.getLive()==1)
 {
 %>
 <tr>
	<td style="border:  solid 1px; font-family: Harrington; font-size: 17; text-indent: 0pt;" valign="top">
	
	<b><%=a.getName() %></b> says:
	
	<%=a.getComment() %>
	<br>
	</td>

</tr>


 <% 
 }
 
 }
 
 }

pm.close();
	  %>
<tr>
<td>
<b>Add Comment:</b><br>
<jsp:include page="FillMe.jsp"/>
</td>
</tr>


</table>