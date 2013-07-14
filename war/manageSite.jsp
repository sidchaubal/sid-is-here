
<%@ page import="com.google.aboutme.storeComments" %>
 <%@ page import="com.google.aboutme.pagecontent" %>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.aboutme.PMF" %>
    <%@  page import= "javax.servlet.ServletRequest" %>
   <%@ page import="com.google.appengine.api.datastore.Text" %>
     <%@ page import="com.google.appengine.api.users.*" %>
  
   
      <script type="text/javascript">
   

function go(){
if (typeof window.ActiveXObject != 'undefined' ) {
        xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
        xmlDoc.onreadystatechange = process ;
      }
      else {
        xmlDoc = new XMLHttpRequest();
        xmlDoc.onload = process ;
      }
  
   var comm=encodeURIComponent(document.getElementById('content').value);
   var tit=document.getElementById('page').value;
   if(tit!=null || tit!="" || comm!=null || comm!="")
{  // var params="author="+name+"&data="+comm;
   //alert('in go'+comm); 
   //alert('content lenght is'+comm.length);
xmlDoc.open( "POST", "handlecontent", true );
xmlDoc.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');	   
xmlDoc.send("content="+comm+"&title="+tit);

}
   else
{
alert('You cannot have Title or Content as Empty!');
	   }
}

function process() {
	//alert('in process');
	        if ( xmlDoc.readyState != 4 ) return ;
	        var suc=xmlDoc.responseXML.getElementsByTagName("persisted")[0].childNodes[0].nodeValue;
	        if(suc=="Success")
		        {document.getElementById('chngme').innerHTML="Updated!";
				//alert('successful');
		        }
		        else
		        	{document.getElementById('chngme').innerHTML="Please TRY again";
				//alert('failed');
		        	}
}
</script>
   
   
   
   
   
   
   
   <%
  UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        String title="default";
       String qu=request.getParameter("query");
       if(qu==null)
    	   qu="Current";
   PersistenceManager pm = PMF.get().getPersistenceManager();

String query = "select from " + pagecontent.class.getName();
    List<pagecontent> content = (List<pagecontent>) pm.newQuery(query).execute();
    pagecontent result=new pagecontent();
   Text con=new Text("There is no content");
   if(!content.isEmpty())
   {
   	for(pagecontent a:content)
   	{ System.out.println(a.getPage());
   	String com=qu;
      if(a.getPage().equals(com))
      {con=a.getContent();
      title=a.getPage();
      System.out.println(con.getValue());
      }
  	 }
   }
   String thisurl=userService.createLogoutURL(request.getRequestURI());
   int flag=0;
   %>
   
   

    <html>  <body>
     
  <table>
  <tr>
  <td id="user">
  <% if(user==null) {
  flag=1;
  }
  else { 
  %>
  Welcome <%= request.getUserPrincipal().getName() %>
  <% }
  %>
  <a  href="<%= thisurl %>" >LogOut</a>
  </td>
  </tr>
  <tr>
  <td id="approve">
  </td></tr>

  <tr>
  <td id="sign">
 <% if(flag==0) { %>
   Page: <select>
<option value="Home">Home</option>
<option value="About">About</option>
</select>
<br>
<textarea rows="30" cols="80" required="required" id="content" formname="submitcontent">
<%=con.getValue()%>
   </textarea> <br>
   <input type="text" value="<%= title%>" id="page"/> <br>
   <input style="margin-left: 5pt;" align="middle" onclick="go()" name="sub" type="submit"></input><br><br>
      <%} else { %>
      Fatal Error!! You need to sign in as Administrator
   <% } %>
   </td> </tr>
<tr>
<td id="chngme">
</td>
</tr>
</table>
   
   </body>
   <html>