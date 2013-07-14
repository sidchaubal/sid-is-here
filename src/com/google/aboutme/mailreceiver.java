package com.google.aboutme;

import java.io.ByteArrayOutputStream;
import java.io.IOException; 
import java.io.InputStream;
import java.util.Date;
import java.util.Properties; 

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.Part;
import javax.mail.Session; 
import javax.mail.internet.MimeMessage; 
import javax.servlet.http.*; 
import javax.mail.internet.InternetAddress;
import javax.mail.Multipart;
import javax.jdo.PersistenceManager;
import com.google.aboutme.PMF;
import com.google.appengine.api.datastore.Text;

@SuppressWarnings("serial")
public class mailreceiver extends HttpServlet {
private Text bodytext=null;
//ArrayList<attachment> attachments;
Date sentdate=new Date();
String subj="default subject";
PersistenceManager pm2 = PMF.get().getPersistenceManager();

		    public void doPost(HttpServletRequest req, 
	                       HttpServletResponse resp) 
	            throws IOException { 
	        Properties props = new Properties(); 
	        Session session = Session.getDefaultInstance(props, null);
	        
	        PersistenceManager pm = PMF.get().getPersistenceManager();

	        //String query = "select user from " + blob.class.getName();
			//List<String> users_temp = (List<String>) pm.newQuery(query).execute();
	        mailstore newmail=new mailstore();
	        String sender="defaultsender";
	        String sendremail="sender@email.com";
	       
	        try {

				MimeMessage message = new MimeMessage(session, req.getInputStream());
				Address[] sendert=message.getFrom();
				sender=((InternetAddress) sendert[0]).getPersonal();
				sendremail=((InternetAddress) sendert[0]).getAddress();
				sentdate=message.getSentDate();
				subj=message.getSubject();
				if(message.getContentType().startsWith("text/plain"))
				{ bodytext=new Text((String) message.getContent());
				}
				else
				{extractPart(message);}
				//String content=contentt.getBodyPart(2).toString();
				newmail.setSender(sender);
				newmail.setSenderemail(sendremail);
				newmail.setSentdate(sentdate);
				newmail.setSubject(subj);
				newmail.setMessg(bodytext);
				
				pm.makePersistent(newmail);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				newmail.setSender(sender);
				newmail.setSenderemail(sendremail);
				newmail.setSentdate(sentdate);
				newmail.setSubject(subj);
				newmail.setMessg(bodytext);
				
				pm.makePersistent(newmail);
				//System.out.println("Message exception:"+e.toString());
				e.printStackTrace();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
}
		    
		    private void extractPart(final Part part) 
		    throws MessagingException,
		    IOException {
		    	 if(part.getContent() instanceof Multipart) {
		             Multipart mp=(Multipart)part.getContent();
		             for(int i=0;i<mp.getCount();i++) {
		                 extractPart(mp.getBodyPart(i));
		             }
		             return;
		         }

		    if(part.getContentType().startsWith("text/html")) {
		    	if(bodytext==null) {
		    		bodytext=new Text((String)part.getContent());
		    		} 
		    	else {
		    		String bodytext1=bodytext.getValue();
		    		bodytext1=bodytext1+"<HR/>"+(String)part.getContent();
		    		Text body2=new Text(bodytext1);
		    		bodytext=body2;
		    		}
		    	}
		    
		    else if(!part.getContentType().startsWith("text/plain")) {
	            attachment attachmen=new attachment();
	            attachmen.setContenttype(part.getContentType());
	            attachmen.setFilename(part.getFileName());
	             
	            InputStream in=part.getInputStream();
	            ByteArrayOutputStream bos=new ByteArrayOutputStream();
	           
	            byte[] buffer=new byte[8192];
	            int count=0;
	            while((count=in.read(buffer))>=0) bos.write(buffer,0,count);
	            in.close();
	            attachmen.setContent(bos.toByteArray());
	            String ttt=sentdate.toString()+subj;
	            attachmen.setEmailid(ttt);
	           pm2.makePersistent(attachmen);
	            // attachments.add(attachmen);
	            
	        }

		    }
		    
		    
}