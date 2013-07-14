package com.google.aboutme;


import java.net.*;
import java.io.*;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.http.*;
//import java.util.logging.Logger;
//import javax.jdo.PersistenceManager;



@SuppressWarnings("serial")
public class getweather extends HttpServlet {
    //private static final Logger log = Logger.getLogger(_RideServlet.class.getName());
   
  
    
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
        String zip=req.getParameter("z");
    	URL yahoo = new URL("http://weather.yahooapis.com/forecastrss?z="+zip+"&u=f");
        URLConnection yc = yahoo.openConnection();
        BufferedReader in = new BufferedReader(
                                new InputStreamReader(
                                yc.getInputStream()));
        String inputLine="";
        String temp;
        while ((temp = in.readLine()) != null) 
        	{inputLine=inputLine+""+temp;}
            resp.setContentType("text/xml");
            //System.out.println(inputLine);
            
        	resp.getWriter().write(inputLine);
        in.close();
    }
}