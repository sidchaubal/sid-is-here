    <%@ page import="com.google.aboutme.storeComments" %>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.aboutme.PMF" %>
    <%@  page import= "javax.servlet.ServletRequest" %>
   
<script type="text/javascript">
//alert('in script');
function dot(cnt) {
    //alert('in function');
	alert(cnt);
	   
    var idd="chk";
    var name="";
    var comm="";
    if (typeof window.ActiveXObject != 'undefined' ) {
        xmlDoc = new ActiveXObject("Microsoft.XMLHTTP");
        xmlDoc.onreadystatechange = process ;
      }
      else {
        xmlDoc = new XMLHttpRequest();
        xmlDoc.onload = process ;
      }
    
   for(i=0;i<cnt;i++)
   {  
		var t=document.getElementById(idd+i).checked;
	   alert('for chkbox '+i+' '+t);

       if(t)
	   {name=name+" "+document.getElementById(idd+i).name;
	   alert("name is "+name);
	   }
	   //name=name+" "+document.getElementById(idd+i).name;
	   
	   }
   alert(name);
   xmlDoc.open( "GET", "/setcomment?n="+name, true );
   xmlDoc.send( null );
	 
	      
}

function process() {
	alert('in process');
	        if ( xmlDoc.readyState != 4 ) return ;
	        var suc=xmlDoc.responseXML.getElementsByTagName("persisted")[0].childNodes[0].nodeValue;
	        if(suc=="Success")
	        { document.getElementById('chngme').innerHTML="Comments are now LIVE!";
	        alert('success!');}
	        else
	        	{document.getElementById('chngme').innerHTML="Am sorry some technical Error caused this <br> Please try again!"
	    	        alert('failed');}
    
}
</script>

<%
PersistenceManager pm = PMF.get().getPersistenceManager();
String query = "select from " + storeComments.class.getName();
    List<storeComments> greet = (List<storeComments>) pm.newQuery(query).execute();
   // storeComments result=new storeComments();
    
%>

<b>Welcome Sid!</b>

<% 
  if(greet.isEmpty()) {
  %>
  Sorry no new comments 
  <%
  } else {
	  int cntr=0;
	%>  
	 
<table>
  <% for(storeComments a:greet){
	  if(a.getLive()==0){
	  %>
  <tr>
    <td>
    <input  id="chk<%=cntr %>" type="checkbox" name="<%=a.getName() %>" value="<%=a.getName() %>"  />
    <%=a.getName() %>: <%=a.getComment() %>
    </td>
    
  </tr>
  <%  cntr++;
  } }%>
  <tr>
  	<td>
  	<input type="submit" onclick="dot(<%=cntr %>)" value="Post these comments!"/>
  	</td>
  </tr>
  
  <tr>
  <td id="chngme">
  </td>
  </tr>
</table>
   
<%
}
pm.close();
%>