package com.google.aboutme;

import java.io.IOException;
import com.google.aboutme.mailsender;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.HashSet;

import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.*;

import com.google.appengine.api.blobstore.BlobKey;


import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import javax.jdo.PersistenceManager;
import com.google.aboutme.PMF;


@SuppressWarnings("serial")
public class upload extends HttpServlet {
    private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
   private BlobInfoFactory blobinfofac=new BlobInfoFactory();
    private static final Logger log = Logger.getLogger(upload.class.getName());

	@SuppressWarnings("unchecked")
	public void doPost(HttpServletRequest req, HttpServletResponse res)
	throws ServletException, IOException {
		  Map<String, BlobKey> blobs = blobstoreService.getUploadedBlobs(req);
		  String newline = System.getProperty("line.separator");
		  mailsender m=new mailsender();
		  String mailexception="no mail exception";

		  try{  
		  BlobKey blobKey = blobs.get("myFile");
	        String user=req.getParameter("u");
	        
	        //For Email purposes (New User)
			  String emailto=user;
			  String emailfrom="admin@sid-is-here.appspotmail.com";
			  String emailsub="Welcome to Sid's File Sharing System";
			  String welcomemsg="Welcome to Sid's File Sharing System! I am very excited to have you. Here are some quick facts about this system:"+newline+newline+"You can:"+newline+"1: Upload unlimited files in your account! But each file has to be under 100 Mb" +
			  		""+newline+"2: Share your uploaded files with anyone! Just copy the url of your file and post/email/IM your friend!"+newline+"" +
			  				"3: Share between users of Google Accounts with a click of a button! And no need for them to register! Just tell them to log-in to Sid-is-here using their Google Account and they will see your shared file there! "+newline+"" +
			  						"4: Want your file not to be deleted in 10 days? Just ping me on 'Contact Sid' and your file will live there forever! :) ";
			  String footr="This system uses Google Accounts for Authentication and File Sharing only. I don't have access to any of your 'PRIVATE' information you may have in your Google Account";
			  String emailmsg="Dear "+user+newline+newline+welcomemsg+newline+newline+"Sincerely,"+newline+"Siddharth Chaubal"+newline+"http://sid-is-here.appspot.com"+newline+"320-300-0043"+newline+newline+footr;
			  
	       // log.info("We have got files n parameters");
//System.out.println("We have got files n parameters");
	        BlobInfo binfo=blobinfofac.loadBlobInfo(blobKey);
    		long siz=binfo.getSize();
	        log.info("We have got pm");
	//        System.out.println("We have got pm size of blob is"+siz);
	        PersistenceManager pm = PMF.get().getPersistenceManager();

	        String query = "select user from " + blob.class.getName();
			List<String> users_temp = (List<String>) pm.newQuery(query).execute();
			Set<String> users=new HashSet<String>();
			
			log.info("we have executed query");
	  //      System.out.println("We have executed query");

			
			for(int i=0;i<users_temp.size();i++) {
				users.add(users_temp.get(i));
			}
			
			log.info("added to set");
	    //    System.out.println("added to set");

		    if(!(users.contains(user)))
		    {	//log.severe("Setting task queue for "+user);
		  //  System.out.println("Setting task queue for "+user);
		    	//Queue queue = QueueFactory.getQueue("blobdelete");
		       // queue.add(url("/blobcleanup").param("newuser", user));
		        //sending email to new user
		        try{
		        	m.sendmail(emailfrom,"Sid-is-here",emailmsg,emailto,null,emailsub);
		        }
		        catch(Exception e){
		        	mailexception=e.toString();
		        }
		    }
		    
	        if (blobKey == null) {
	        	System.out.println("No files");
	            res.sendRedirect("/");
	        } 
	        else if((siz>100000000)&&(!user.equals("chaubal.sid@gmail.com"))) {
	        	System.out.println("for "+user+" file exceeds 10MB");
	        	blobstoreService.delete(blobKey);
	        	res.getWriter().write(user+" File Exceeds 100 Mb <br> <a href=\"/sharefiles.jsp\">Go Back</a> ");
		    //    System.out.println("Files exceeds 100 MB");

	        }
	        else {
	        	 blob newb=new blob();
	 		    newb.setUser(user);
	 		    newb.setBlobkey(blobKey);
			    pm.makePersistent(newb);
	 		    
	        	res.sendRedirect("/sharefiles.jsp");
	        }
	        pm.close();
	        }catch(Exception e) {
	        	System.out.println(mailexception+newline+e);
	        	res.getWriter().write(mailexception+"<br>"+e.toString());
	        	
	        }
	}

}
