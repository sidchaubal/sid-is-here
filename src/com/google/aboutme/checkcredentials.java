package com.google.aboutme;


import java.io.IOException;
import javax.servlet.http.*;
import com.google.appengine.api.users.User;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class checkcredentials extends HttpServlet {
    
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
              throws IOException {
      
    	UserService userService = UserServiceFactory.getUserService();
        User user = userService.getCurrentUser();
        
     
        resp.setContentType("text/xml");
        if (user != null) {
          
        	System.out.println(user.getNickname());
          
          resp.getWriter().write(user.getEmail());
        } else {
        	 System.out.println("in check credentials else");
        	 resp.sendRedirect(userService.createLoginURL(req.getRequestURI()));
        	 
        }
    }
}
 