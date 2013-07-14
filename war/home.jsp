<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="com.google.aboutme.storeComments" %>
 <%@ page import="com.google.aboutme.pagecontent" %>
    <%@ page import="java.util.List" %>
<%@ page import="javax.jdo.PersistenceManager" %>
<%@ page import="com.google.aboutme.PMF" %>
    <%@  page import= "javax.servlet.ServletRequest" %>
   <%@ page import="com.google.appengine.api.datastore.Text" %>
   <%@ page import="java.util.Date" %>
           
<!DOCTYPE HTML>

<html>
	<link rel="stylesheet" href="menu_style.css" type="text/css" />
 
   
<script type="text/javascript" >
//var flag=0;
function downdiv() 
{ 
 if(document.getElementById("down").style.visibility=='hidden')
document.getElementById("down").style.visibility='visible';
else
document.getElementById("down").style.visibility='hidden';

}

function langH() 
{
 document.getElementById('ipod').innerHTML="<img style=\"visibility:hidden;width:0px;height:0px;\" border=0 width=0 height=0 src=\"http://counters.gigya.com/wildfire/IMP/CXNID=2000002.0NXC/bT*xJmx*PTEyODczMzI*MjQ4ODgmcHQ9MTI4NzMzMjQyNzEwMSZwPTE4MDMxJmQ9Jmc9MSZvPTI3OWY1YmJiZGU*YzRlZGY5MzI2/MDI5NDczMGM5NjRm.gif\" /><center><p style=\"visibility:visible;\"><object type=\"application/x-shockwave-flash\" data=\"http://assets.mixpod.com/swf/mp3/mff-touch.swf\" height=\"390px\" width=\"235px\"><param name=\"movie\" value=\"http://assets.mixpod.com/swf/mp3/mff-touch.swf\" /><param name=\"quality\" value=\"high\" /><param name=\"scale\" value=\"noscale\" /><param name=\"salign\" value=\"TL\" /><param name=\"wmode\" value=\"transparent\"/><param name=\"flashvars\" value=\"myid=69712494&path=2010/10/17&mycolor=000000&mycolor2=0267CA&mycolor3=FFFFFF&autoplay=false&rand=0&f=4&vol=100&pat=0&grad=false\"/> </object></p></center>";
}

function langE()
{ 
document.getElementById('ipod').innerHTML="<img style=\"visibility:hidden;width:0px;height:0px;\" border=0 width=0 height=0 src=\"http://counters.gigya.com/wildfire/IMP/CXNID=2000002.0NXC/bT*xJmx*PTEyODczMzI*MjQ4ODgmcHQ9MTI4NzMzMjQyNzEwMSZwPTE4MDMxJmQ9Jmc9MSZvPTI3OWY1YmJiZGU*YzRlZGY5MzI2/MDI5NDczMGM5NjRm.gif\" /><center> <p style=\"visibility:visible;\"><object type=\"application/x-shockwave-flash\" data=\"http://assets.mixpod.com/swf/mp3/mff-touch.swf\" height=\"390px\" width=\"235px\"><param name=\"movie\" value=\"http://assets.mixpod.com/swf/mp3/mff-touch.swf\" /><param name=\"quality\" value=\"high\" /><param name=\"scale\" value=\"noscale\" /><param name=\"salign\" value=\"TL\" /><param name=\"wmode\" value=\"transparent\"/>	<param name=\"flashvars\" value=\"myid=69698455&path=2010/10/17&mycolor=000000&mycolor2=0267CA&mycolor3=FFFFFF&autoplay=false&rand=0&f=4&vol=100&pat=0&grad=false\"/></object><br></p></center>";
}

function loadt(wht)
   {   //alert(wht); 
	   var var1=wht;
	   if((wht=='iphone.html')||(wht='http://linkedin.com/in/sidishere'))
	   document.getElementById('magic').innerHTML="<iframe src=\""+var1+"\" frameborder=\"0\" scrolling=\"AUTO\" width=100% height=150%  seamless=\"seamless\"></iframe>";
	   else if(wht='Home_m.jsp?blog=Current')
		   document.getElementById('magic').innerHTML="<jsp"+":include page=\"Home_m.jsp\"> <jsp"+":param value=\"Current\" name=\"blog\"/></jsp"+":include>";   
		   
	   else
		   document.getElementById('magic').innerHTML="<iframe src=\""+var1+"\" frameborder=\"0\" scrolling=\"AUTO\" width=100% height=100%  seamless=\"seamless\"></iframe>";
		  
	   }

</script>	
   
  <head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <link type="text/css" rel="stylesheet" href="blog.css">
<title>Sid is HERE!</title>
<!--<jsp:include page="Header.html"/> -->
 	
  </head>

 <!-- background:url('Image/gwlogo.gif') no-repeat center transparent; -->
  <body  style="background-color:white;">
 
  <script type="text/javascript">
if (typeof Meebo == 'undefined') {
	Meebo=function(){(Meebo._=Meebo._||[]).push(arguments)};
	(function(_){var d=document,b=d.body,c;if(!b){c=arguments.callee;
	return setTimeout(function(){c(_)},100)}var a='appendChild',c='createElement',
	m=b.insertBefore(d[c]('div'),b.firstChild),n=m[a](d[c]('m')),i=d[c]('iframe');
	m.style.display='none';m.id='meebo';i.frameBorder="0";n[a](i).id="meebo-iframe";
	function s(){return['<body onload=\'var d=document;d.getElementsByTagName("head")[0].',
	a,'(d.',c,'("script")).src="http',_.https?'s':'','://',_.stage?'stage-':'',
	'cim.meebo.com','/cim?iv=2&network=',_.network,_.lang?'&lang='+_.lang:'',
	_.d?'&domain='+_.d:'','"\'></bo','dy>'].join('')}try{
	d=i.contentWindow.document.open();d.write(s());d.close()}catch(e){
	_.d=d.domain;i.src='javascript:d=document.open();d.write("'+s().replace(/"/g,'\\"')+'");d.close();'}})
    ({ network: 'sidishere_ze75so', stage: false });    
    Meebo("makeEverythingSharable"); 
}
</script>
		
<table id="maint" width="1000px" height=100% align="center">
<tr>
<td align="center" class="menu">
<ul >
				  <li><img src="images/sid-is-here.png" alt="Sid-is-here" align="middle" height=80% width=90% style="padding-top: 5px"/> </li>
				  <li><a href="javascript:;" onmousedown="loadt('Home_m.jsp?blog=Current')">Home</a></li>
								  <li><a href="javascript:;" onmousedown="loadt('http://linkedin.com/in/sidishere')">About</a></li>
				
					
					
					<li><a id="Contact"
						href="javascript:;" onmousedown="loadt('FillMe.jsp')">Contact Sid</a></li>
					<li><a id="Share"
						href="http://www.sid-is-here.com/sharefiles.jsp">Share/Upload Files</a></li>
					
						<li ><a id="Share"
						href="http://mail.sid-is-here.com">E-Mail</a></li>
					
							<li><a id="Senate"
						href="javascript:;" onmousedown="loadt('GW Senate.jsp')">GW Student Senate</a></li>
						
						<li ><a id="Senate"
						href="javascript:;" onmousedown="loadt('iphone.html')">iPhone apps </a></li>
				</ul>
</td>
</tr>
</table>
<div align="center">
					<jsp:include page="lefttd.jsp"></jsp:include>

</div>
				
<table  width="800px" align="center" style="border-right:solid 1px black">
	
	
	 <tr align="center">
	 	   
		
		 <td id="magic"  align="center" valign="top" style="border-top: solid 1px black" > 
		
		<!-- <iframe src="Home_m.jsp?blog=Current" frameborder="0" scrolling="AUTO" width=100% height=250%  seamless="seamless""></iframe>
		  -->
		  <jsp:include page="Home_m.jsp">
		  <jsp:param value="Current" name="blog"/>
		  </jsp:include>
		 </td> 
		 
		 <td width=6.4% valign="top" align="center" style="border-left: solid 1px black; border-top: solid 1px black"> 
		 
		<jsp:include page="righttd.jsp"></jsp:include> 
		 		 
		 
		 </td>
	</tr>
	
</table>

<script type="text/javascript">
  Meebo("domReady");
</script>

</body>
<%Date da=new Date(); %>
<footer style="position: inherit; text-align: center" >This Website is developed by Siddharth Chaubal. Latest Update <%=da %></footer>
</html>

<!--  <textarea id="content"
			title="this is a test" readonly="readonly" rows="10" cols="25"
			style="background: transparent; border-style: hidden; font-family: Georgia; font-size: 15pt; width: 401px; height: 192px">
        </textarea>
        -->
