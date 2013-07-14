package com.google.aboutme;


//import java.net.*;
import java.io.IOException;

//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.http.*;
//import java.util.logging.Logger;
import javax.jdo.PersistenceManager;

import com.google.aboutme.PMF;



@SuppressWarnings("serial")
public class postservr extends HttpServlet {
    //private static final Logger log = Logger.getLogger(_RideServlet.class.getName());
   
  
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
    	int res=0;
    	String n=req.getParameter("n");
    	String com=req.getParameter("c");
    	System.out.println("name is "+n+"comment is "+com);
		PersistenceManager pm = PMF.get().getPersistenceManager();

    	storeComments stcm=new storeComments(n,com);
    	try{
            pm.makePersistent(stcm);
            res=1;
    	}catch(Exception e)
    	{
    		System.out.println("Exception is "+e);
    		
    	}
    	
    	finally{
    		
    		pm.close();
    		resp.setContentType("text/xml");
    	    if(res==1)   
    		resp.getWriter().write("<persisted>Success</persisted>");
    	    else
        	resp.getWriter().write("<persisted>Failed</persisted>");

    	}
   
    
    }
}
    