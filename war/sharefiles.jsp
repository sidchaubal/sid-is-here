<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.google.appengine.api.users.*" %>
        <%@ page import="com.google.appengine.api.blobstore.BlobKey" %>
        <%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
        <%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
        <%@ page import="javax.jdo.PersistenceManager" %>
        <%@ page import="com.google.aboutme.PMF" %>
           <%@ page import="java.util.ArrayList" %>
               <%@ page import="java.util.TimeZone" %>
               <%@ page import="com.google.aboutme.blob" %>
               <%@ page import="java.util.List" %>
                              <%@ page import="java.util.Map" %>
                              <%@ page import="java.util.HashMap" %>
               
<%@ page import="com.google.appengine.api.blobstore.BlobInfoFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobInfo" %>
           <%@ page import="java.util.Date" %>
               <%@  page import= "javax.servlet.ServletRequest" %>
           
<%UserService userService = UserServiceFactory.getUserService();
String user=request.getUserPrincipal().getName(); 
String messs=request.getParameter("messg");
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sid's Share/Upload Files</title>

</head>
<script type="text/javascript">
function dele() {

document.forms["blobdel"].submit();
	
}

function sha() {

	var chg="Share";
	document.getElementById('operation').value=chg;
	//alert('did till here');
	var shauser=document.getElementById('sharedwith');
	//alert(shauser.value);
	document.getElementById('shar').value=shauser.value;
	//alert('about to share selected files with '+document.getElementById('shar').value);
	
	document.forms["blobdel"].submit();
	
}

function share() {

	var chg="Share";
	document.getElementById('operation').value=chg;
	//alert('value changed to: '+document.getElementById('operation').value);

	document.getElementById('sharing').innerHTML="Share with (email address):<br> <input type=\"text\" name=\"sharewith\" id='sharedwith'/> <input type=\"button\" value=\"Share\" onclick=\"sha()\"/> <br>  <font color='Red' >NOTE: You can only share files with Google Account Holders. Please give a gmail email address above.</font> ";
	
	//document.forms["blobdel"].submit();
		
}
</script>
<% 	
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
BlobInfoFactory blobinfofactory= new BlobInfoFactory();

TimeZone.setDefault(TimeZone.getTimeZone("EST"));

	
Date now=new Date();
        //User user = userService.getCurrentUser();
    		ArrayList<BlobKey> blobkeys=new ArrayList<BlobKey>();
    		PersistenceManager pm = PMF.get().getPersistenceManager();

    		Map<BlobKey, String> blobkeyssh=new HashMap<BlobKey, String>();
    		ArrayList<BlobKey> blobkeysh=new ArrayList<BlobKey>();

	        String query = "select from " + blob.class.getName()+" WHERE user =='"+user+"'";
	        String querysh = "select from " + blob.class.getName()+" WHERE sharedwit.contains('"+user+"')";
	        int chutiya=0, chutiya2=0;

	        try{	        
		    List<blob> greet = (List<blob>) pm.newQuery(query).execute();
		    List<blob> shblobs = (List<blob>) pm.newQuery(querysh).execute();
		    


		if(greet.isEmpty()) {chutiya=1; }
    		else{
    			for(blob s:greet)
    			{
    				if(s.getBlobkey()!=null) 
    					blobkeys.add(s.getBlobkey());
    			}
    			
    		}
		

		if(shblobs.isEmpty()) {chutiya2=1; }
    		else{
    			for(blob sh:shblobs)
    			{
    				if(sh.getBlobkey()!=null) 
    					blobkeyssh.put(sh.getBlobkey(), sh.getUser());
    					blobkeysh.add(sh.getBlobkey());
    			}
    			
    		}

		
%>

<body>
<center><b> Welcome to Sid's File Sharing System</b></center> <br>
Logged in as: <%=  user %> <a href="<%= userService.createLogoutURL(request.getRequestURI()) %>">LogOut</a> <br><br> Files:
<br>
<%if(messs!=null) { %>
<font color="Red" ><%= messs %></font>
<%} %>
<br> OWNED: <br>
<% BlobInfo blobinfo;
if(((!(blobkeys.isEmpty()))) && (chutiya!=1) ) {
	%>
	<form id='blobdel' action="blobdelete?user=<%= user %>" method="post" enctype="application/x-www-form-urlencoded">
	
	<%
for(int i=0;i<blobkeys.size();i++) {
	        blobinfo=blobinfofactory.loadBlobInfo(blobkeys.get(i));
%>
<input type="checkbox" name="check" value="<%= blobkeys.get(i).getKeyString() %>"/>
<%= blobinfo.getCreation() %>:<a href="/serve?blob-key=<%= blobkeys.get(i).getKeyString()%>" > <%= blobinfo.getFilename() %></a><br>

<%

} 
%>
<input type="button" id="Submit" value="Delete Checked Files" onclick="dele()" >
<input type="button" id="Share" value="Share Checked File" onclick="share()">
<input type="hidden" value="Deleteb" name="operation" id='operation'/>
<input type="hidden" value="use" name="shar" id='shar'/>

<input type="hidden" value="<%= blobkeys.size()%>" name="sizeofchecked" />
<input type="hidden" value="<%= user%>" name="user" />
<table>
<tr><td id=sharing>
</td></tr>
</table>
</form>
<% 
}
else {
%>
You have no files*.
<%
}}
catch(Exception e) 
{
//System.out.println(e);
%>
Exception: You have no files.
<% 
}
%>


<br><br>
SHARED:
<br>
<% BlobInfo blobinfo2;
if(chutiya2!=1 ) {
	
for(int i=0;i<blobkeyssh.size();i++) {
	        blobinfo2=blobinfofactory.loadBlobInfo(blobkeysh.get(i));
%>
<%= blobkeyssh.get(blobkeysh.get(i)) %>:<a href="/serve?blob-key=<%= blobkeysh.get(i).getKeyString()%>" > <%= blobinfo2.getFilename() %></a><br>

<%

} 
}
else {
%>
You have no files.
<%
}
%>
<br><br><br>
<form name="filesForm" action="<%= blobstoreService.createUploadUrl("/upload?u="+user) %>" method="post" enctype="multipart/form-data">
Upload new File:**<input type="file" name="myFile"/> 
<input type="Submit" name="Submit" value="Upload Files"  >
</form>
<br><br>
<font color="red">
**Accepted file cannot exceed above 100 Mb (Unless you have an account with us.)</font>
</body>
</html>