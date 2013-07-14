package com.google.aboutme;


//import java.net.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
//import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.http.*;
//import java.util.logging.Logger;
import javax.jdo.PersistenceManager;

import com.google.aboutme.PMF;



@SuppressWarnings("serial")
public class comment_handler extends HttpServlet {
    //private static final Logger log = Logger.getLogger(_RideServlet.class.getName());
   
    public void doGet(HttpServletRequest req, HttpServletResponse resp)
	throws IOException, ServletException {
        int i=0;
        int res=0;
    	String name=req.getParameter("n");
    	name=name.substring(1);
    	System.out.println(name);
    	String names[]=getnames(name);
    	if(names!=null)
    	{
    		PersistenceManager pm = PMF.get().getPersistenceManager();
    		try{
    		for(i=0;i<names.length;i++)
    		{ System.out.println("for "+names[i]);
    			String query = "select from " + storeComments.class.getName() +" WHERE name=='"+names[i]+"'";
    		    List<storeComments> greet = (List<storeComments>) pm.newQuery(query).execute();
    		if(greet.isEmpty()) {}
    		else{
    			for(storeComments s:greet)
    			{
    				if(s.getLive()==0) 
    					s.setLive(1);
    				    pm.makePersistent(s);
    				    
    			}
    			
    		}
    	}  res=1;
    		}catch(Exception e){ System.out.println("error is "+e);}
    	finally{
    		pm.close();
    		if(res==1)
    			resp.getWriter().write("<persisted>Success</persisted>");
    	    else
        	resp.getWriter().write("<persisted>Failed</persisted>");

    		
    	}	
    	}
    	
    	
    	
    }

	private String[] getnames(String name) {
		// TODO Auto-generated method stub
		String tt[]={name};
		//tt[0]=name;
		List<Integer> imp=new ArrayList<Integer>();
        int temp=0;
		temp=name.length();
        char ch[]=name.toCharArray();
        for(int i=0;i<temp;i++){
        	if(ch[i]==' ')
        	{imp.add(i);
        	//System.out.println(i);
        	}

        }
        int h=0;
        int nxt;

        Iterator<Integer> iterator = imp.iterator();
        int i=0;
        while(iterator.hasNext())
        {  nxt=iterator.next();

       // System.out.println(haha);
        tt[i]=name.substring(h,nxt);
       i++;
        h=nxt+1;
        }

		
		return tt;
	}
    
}