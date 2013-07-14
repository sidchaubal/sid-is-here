package com.google.aboutme;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.logging.Logger;

import com.google.appengine.api.blobstore.BlobInfo;
import com.google.appengine.api.blobstore.BlobInfoFactory;

import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import javax.jdo.PersistenceManager;
import com.google.aboutme.PMF;
import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class blobcleanup extends HttpServlet {
	  private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	    private BlobInfoFactory blobinfofac=new BlobInfoFactory();
	    private static final Logger log = Logger.getLogger(upload.class.getName());

	 @SuppressWarnings("unchecked")
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws IOException, ServletException {
		 
		 String newuser=req.getParameter("newuser");
		 log.info("in blobcleanup for user:"+newuser); 
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		  Date now=new Date();
		

			//Calendar c1 = Calendar.getInstance(); //new GregorianCalendar();
			//Calendar c2 = Calendar.getInstance(); //new GregorianCalendar();
			//int day = c1.get(Calendar.DATE);
			//int month = c1.get(Calendar.MONTH) + 1;
			//int year = c1.get(Calendar.YEAR);
			
	        String query = "select from " + blob.class.getName() +" WHERE user == '"+newuser+"'";
			//String query_delete= "delete from "+blob.class.getName() +" WHERE blobkey == '";
	      try {
	        List<blob> blobs = (List<blob>) pm.newQuery(query).execute();
			
			if(!(blobs.isEmpty()))
			{for(blob b: blobs) {
				if(b.getBlobkey()!=null)
				{BlobInfo currentblob=blobinfofac.loadBlobInfo(b.getBlobkey());
				int diffi=diff(now,currentblob.getCreation());
				log.info("difference for "+currentblob.getFilename()+" is "+diffi);
				if(diffi>10)
				{	log.info(currentblob.getFilename()+" deleted");
		        	blobstoreService.delete(b.getBlobkey());
		        	pm.deletePersistent(b);
				}
				}
			}}
			else
			{
				log.info("List is empty for "+newuser);
				
			}
	      }catch(Exception e)
	      {
	    	  log.info(e.toString());
	      }
	 pm.close();
	 }
	 
	 
	 public void doPost(HttpServletRequest req, HttpServletResponse resp)
		throws IOException, ServletException {
		 
	 doGet(req,resp);
	 }
	 
	 public static int diff(Date date1, Date date2) {
		    Calendar c1 = Calendar.getInstance();
		    Calendar c2 = Calendar.getInstance();

		    c1.setTime(date1);
		    c2.setTime(date2);
		    int diffDay = 0;

		    if (c1.before(c2)) {
		      diffDay = countDiffDay(c1, c2);
		    } else {
		      diffDay = countDiffDay(c2, c1);
		    }

		    return diffDay;
		  }

		  public static void DateDiff(Date date1, Date date2) {
		    int diffDay = diff(date1, date2);
		    System.out.println("Different Day : " + diffDay);
		  }

		  public static int countDiffDay(Calendar c1, Calendar c2) {
		    int returnInt = 0;
		    while (!c1.after(c2)) {
		      c1.add(Calendar.DAY_OF_MONTH, 1);
		      returnInt++;
		    }

		    if (returnInt > 0) {
		      returnInt = returnInt - 1;
		    }

		    return (returnInt);
		  }
		  
		  public static Date makeDate(String dateString) throws Exception {
			    SimpleDateFormat formatter = new SimpleDateFormat("MM/dd/yyyy");
			    return formatter.parse(dateString);
			  }

}
