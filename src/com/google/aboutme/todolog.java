package com.google.aboutme;
import java.io.IOException;

import com.google.appengine.api.datastore.Text;
import com.google.aboutme.logs;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.http.*;
//import java.util.logging.Logger;
import javax.jdo.PersistenceManager;

import com.google.aboutme.PMF;



@SuppressWarnings("serial")
public class todolog extends HttpServlet {
    //private static final Logger log = Logger.getLogger(_RideServlet.class.getName());
   
    
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException {
	
	
	doPost(req,resp);
	
	
	}
	
	
	
	public void doPost(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException {
		req.setCharacterEncoding("UTF-8");
    	Text log=new Text(req.getParameter("log"));
    	String user=req.getParameter("user");
    	String responsestr="Success";
		PersistenceManager pm = PMF.get().getPersistenceManager();
		logs logi=new logs();
		System.out.println(log.getValue());

		logi.setLogy(log);
		logi.setUser(user);
		
		try{
		pm.makePersistent(logi);
		}
		catch(Exception e)
		{
			
			responsestr="Exception: "+e;
			
		}
		
		finally
		{
			
			pm.close();
			resp.getWriter().write(responsestr);
			
		}
    	
    	

}
}