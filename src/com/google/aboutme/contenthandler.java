package com.google.aboutme;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import com.google.appengine.api.datastore.Text;
import javax.jdo.PersistenceManager;
import com.google.aboutme.pagecontent;
import com.google.aboutme.PMF;
import java.util.List;



@SuppressWarnings("serial")
public class contenthandler extends HttpServlet{


  public void doPost(HttpServletRequest request, 
		 HttpServletResponse response)
	        throws ServletException, IOException
	  {

		PersistenceManager pm = PMF.get().getPersistenceManager();

	  response.setContentType("text/xml");

	    Text DATA = new Text(request.getParameter("content"));
	    String page=request.getParameter("title");
		int res=0;

	    try{
	    if(page.equals("Current"))
	    {		
	    	PersistenceManager pm2 = PMF.get().getPersistenceManager();
System.out.println("in for current page");
	        String query = "select from " + pagecontent.class.getName() +" WHERE page == '"+page+"'";
List<pagecontent> curr = (List<pagecontent>) pm2.newQuery(query).execute();
			
			if(!(curr.isEmpty()))
			{for(pagecontent b: curr) {
	    	if(b.getPage().equals("Current"))
	    	{
	    		pm2.deletePersistent(b);
	    		
	    	}
	    	}
	    }
		pm2.close();	
	    }
	   
		pagecontent newcontent=new pagecontent(page,DATA);
		System.out.println(DATA.getValue());
		
		pm.makePersistent(newcontent);
		res=1;
		
		String contentQuery="select from "+ pagecontent.class.getName();
		List<pagecontent> allcontent = (List<pagecontent>) pm.newQuery(contentQuery).execute();

		if(!allcontent.isEmpty()){
			String wh="Home";
			for(pagecontent a:allcontent) 
			{
				if(a.getPage().equals(wh))
					System.out.println(a.getContent().getValue());

			}
		}
	    
	    if(res==1){
    		response.getWriter().write("<persisted>Success</persisted>");

	    } else {
    		System.out.println("error from servlet");
        	response.getWriter().write("<persisted>Failed</persisted>");

	    }

	    }catch(Exception e)
	    {
	    	System.out.println("Exception is "+e);
			res=0;
	    }
	  }
	}

