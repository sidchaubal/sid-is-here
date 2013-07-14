
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
  
   var name=document.getElementById('name').value;
   var comm=document.getElementById('data').value;
  // var params="author="+name+"&data="+comm;
   //alert('in go'+name+' '+comm); 
   
xmlDoc.open( "GET", "/setit?n="+name+"&c="+comm, true );
xmlDoc.send(null);
}

function process() {
	//alert('in process');
	        if ( xmlDoc.readyState != 4 ) return ;
	        var suc=xmlDoc.responseXML.getElementsByTagName("persisted")[0].childNodes[0].nodeValue;
	        if(suc=="Success")
		        {document.getElementById('chngme').innerHTML="Comments are now stored... <br> Sid might select your comment to be put up on the Home page!";
				//alert('successful');
		        }
		        else
		        	{document.getElementById('chngme').innerHTML="Your comment cannot be anonymous <br> Please try again!";
				//alert('failed');
		        	}
}
</script>


<table>

<tr>
<td width=50%>

Your Email/Name:<input id="name" name="author" type="text" ></input><br></br>
<label style="display: inherit;">Message:</label><textarea id="data" style="margin-left: 5pt"  name="mess" rows="5" cols="25"></textarea><br>
<input style="margin-left: 5pt;" align="middle" onclick="go()" name="sub" type="submit"></input>
</td>
</tr>
<tr>
	<td id="chngme">
	</td>
</tr>

</table>