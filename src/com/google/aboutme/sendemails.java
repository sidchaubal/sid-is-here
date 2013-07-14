package com.google.aboutme;

import java.io.IOException;
import com.google.aboutme.mailsender;

import javax.servlet.ServletException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class sendemails extends HttpServlet {

	
	 public void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws IOException, ServletException {
			 
		 mailsender mobj=new mailsender();
		 
		 String toemail=req.getParameter("to");
		 String subj=req.getParameter("sub");
		 String mess=req.getParameter("email");
		 
		 try {
			 
			String res= mobj.sendmail("me@sid-is-here.appspotmail.com","Siddharth Chaubal",mess,toemail,null,subj);

			if(res.equals("Success"))
			 resp.getWriter().write("Email Sent!");
			 else
				 resp.getWriter().write("Failed");
			 	
		 }
		 catch(Exception e) {
			 resp.getWriter().write("Exception: <br>"+e.toString());
		 }
		 
	 }
}
