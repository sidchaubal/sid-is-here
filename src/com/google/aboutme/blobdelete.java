package com.google.aboutme;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;


import javax.jdo.PersistenceManager;
import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;

@SuppressWarnings("serial")
public class blobdelete extends HttpServlet {
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
   
	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException {
		 mailsender msendr=new mailsender();
		//String sizee=req.getParameter("sizeofchecked");
		String[] keys=req.getParameterValues("check");
		
		PersistenceManager pm = PMF.get().getPersistenceManager();

		//String keys=req.getParameter("keys");
		String user=req.getParameter("user");
		String op=req.getParameter("operation");
		
		if(op.equals("Deleteb"))
		{
//System.out.println("in for user:"+user);
String query = "select from " + blob.class.getName() +" WHERE user == '"+user+"'";
try {
List<blob> blobs = (List<blob>) pm.newQuery(query).execute();
List<BlobKey> keyss=new ArrayList<BlobKey>();
BlobKey tempkey;
//System.out.println("All good till here1 size:"+blobs.size());
if(!(blobs.isEmpty()))
{for(int j=0;j<blobs.size();j++)
{
keyss.add(blobs.get(j).getBlobkey());	
}
//System.out.println("All good till here2");
if(keys!=null) {
		for(int i=0;i<keys.length;i++)
		{
			tempkey=new BlobKey(keys[i]);
			blobstoreService.delete(tempkey);
			//System.out.println("deleted from bolobstore");
			pm.deletePersistent(blobs.get(keyss.indexOf(tempkey)));
			//System.out.println("deleted from datastore");
		}
}
}
pm.close();
resp.sendRedirect("/sharefiles.jsp");
}catch(Exception e)
{
	resp.getWriter().write("Exception "+e);
}
}
		
		else {
			String shardwit=req.getParameter("shar");
			List<String> sh=new ArrayList<String>();
			String query2 = "select from " + blob.class.getName() +" WHERE blobkey == '";
			String att="' || blobkey == '";
			String q="";
			
			if(keys!=null && shardwit!=null) {
				for(int j=0;j<keys.length;j++)
				{	System.out.println(keys[j]);
					if(j==0 && keys.length==1)
					q=q+keys[j]+"'";
					else if(j == keys.length)
					{	q=q+keys[j]+"'";	}
					else
					q=q+keys[j]+att;
					
				}
				System.out.println("Shared with: "+shardwit);
				query2=query2+q;

			System.out.println("Query is: "+query2);
			
			try {
				List<blob> blobss = (List<blob>) pm.newQuery(query2).execute();
				String thefile="Or access it here at: http://sid-is-here.appspot.com/serve?blob-key=";

				if(!(blobss.isEmpty()))
				{	//sh.add(shardwit);

					for(blob b: blobss) 
					{
						sh=b.getSharedwit();
						sh.add(shardwit);
						thefile=thefile+b.getBlobkey().getKeyString();
						pm.makePersistent(b);
					}
					  String newline = System.getProperty("line.separator");
					 System.out.println(thefile);
					  // String footr="This system uses Google Accounts for Authentication and File Sharing only. I don't have access to any of your 'PRIVATE' information you may have in your Google Account";

					String mess="Dear "+shardwit+newline+newline+user+" has shared a file with you on Sid's File Sharing System!!"+newline+" Please go to http://sid-is-here.appspot.com/sharefiles.jsp to access it. You need to sign in using your gmail account of  "+shardwit+" to access this file. Its that easy!"+newline+newline+thefile+newline+newline+"Admin"+newline+"http://sid-is-here.appspot.com";
					
					msendr.sendmail("admin@sid-is-here.appspotmail.com","Sid-is-here",mess,shardwit,null,user+" has shared a file with you!");
					resp.sendRedirect("/sharefiles.jsp?messg=Success");

				}
				else {
					
					resp.sendRedirect("/sharefiles.jsp?messg=No such blob found");
					
				}
		}catch(IllegalArgumentException iae) {
			
			resp.sendRedirect("/sharefiles.jsp?messg=Success!");

		}
			
			catch(Exception e)
		{
			
			resp.sendRedirect("/sharefiles.jsp?messg="+e.toString());
			
		}
			
			finally {
pm.close();
			}
			
		}
	
		}
}
}
