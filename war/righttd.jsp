
 <%@ page import="javax.jdo.PersistenceManager" %>
        <%@ page import="com.google.aboutme.PMF" %>
           <%@ page import="java.util.ArrayList" %>
                       <%@ page import="com.google.aboutme.pagecontent" %>
               <%@ page import="com.google.appengine.api.datastore.Text" %>
            
               <%@ page import="java.util.List" %>
               
           
<table class="right">
			<tr >
				<td class="paypal" valign="top">
				<jsp:include page="weather.jsp"></jsp:include>
				
				</td>
			</tr>
<tr> <td>


</td></tr>
			<tr >
				<td class="apps" valign="bottom">
								<br> <br> <br>
				<center>TOP 10 Playlist</center>
				<br> 
				Switch<a href="javascript:;" onmousedown="langH()"> Hindi</a>|
				<a href="javascript:;" onmousedown="langE()">English </a>Playlist<br>
				</tr>
				<tr>
				<td id="ipod" align="justify">
				<img style="visibility:hidden" border=0 width=0 height=0 src="http://counters.gigya.com/wildfire/IMP/CXNID=2000002.0NXC/bT*xJmx*PTEyODczMzI*MjQ4ODgmcHQ9MTI4NzMzMjQyNzEwMSZwPTE4MDMxJmQ9Jmc9MSZvPTI3OWY1YmJiZGU*YzRlZGY5MzI2/MDI5NDczMGM5NjRm.gif" /><center>
				<p style="visibility:visible" ><object type="application/x-shockwave-flash" height="390px" width="235px" data="http://assets.mixpod.com/swf/mp3/mff-touch.swf">
				<param name="movie" value="http://assets.mixpod.com/swf/mp3/mff-touch.swf" /><param name="quality" value="high" />
				<param name="scale" value="noscale" /><param name="salign" value="TL" /><param name="wmode" value="transparent"/>
				<param name="flashvars" value="myid=69698455&path=2010/10/17&mycolor=000000&mycolor2=0267CA&mycolor3=FFFFFF&autoplay=false&rand=0&f=4&vol=100&pat=0&grad=false"/></object><br></p></center>
				</td>
				</tr>
				<tr><td>
				<br>
				<!--<param name="flashvars" value="myid=69712494&path=2010/10/17&mycolor=000000&mycolor2=0267CA&mycolor3=FFFFFF&autoplay=false&rand=0&f=4&vol=100&pat=0&grad=false"/></object></p></center>
-->
				<a href="javascript:;" onmousedown="downdiv()">Download Songs</a><br> 
				<div id="down" style="visibility:hidden">
				<b>Right click: Save As</b><br>
				<a href="http://dl.dropbox.com/u/3033544/EngSongs(Sid-is-here).zip">English Songs.zip</a><br>
				<a href="http://dl.dropbox.com/u/3033544/HindiSong(Sid-is-here).zip">Hindi Songs.zip</a>
				</div>
				</td>
			</tr>
		<tr>
		<td>
		Archives:
		<%
		PersistenceManager pm = PMF.get().getPersistenceManager();

		String query = "select from " + pagecontent.class.getName();
		    List<pagecontent> content = (List<pagecontent>) pm.newQuery(query).execute();
		    pagecontent result=new pagecontent();
		    
		 if(!(content.isEmpty()))
   			{
   				for(pagecontent a:content)
   				{  
   	   				String data1=a.getPage();
   					if(!data1.equals("Current"))
   						{
   		%>
   		
   		<a href='http://www.sid-is-here.com/Home_m.jsp?blog=<%= data1%>'><%= data1%></a>
   		<br>
   		<%
   		
   						}
   				}
   			}
		%>
		</td>
		</tr>
		</table>
		<%
pm.close();
%>
		 <!-- End of righttd -->