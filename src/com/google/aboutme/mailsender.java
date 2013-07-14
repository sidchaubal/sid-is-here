package com.google.aboutme;

import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.Properties;

import javax.jdo.PersistenceManager;
import com.google.aboutme.PMF;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class mailsender {

	public String sendmail(String fromemail, String fromname, String messgbody, String toemail, String toname, String msgsubject) {
		
		Properties props = new Properties();
        Session session = Session.getDefaultInstance(props, null);
		 PersistenceManager pm = PMF.get().getPersistenceManager();
		 Date dat=new Date();

        try {
            Message msg = new MimeMessage(session);
            msg.setFrom(new InternetAddress(fromemail, fromname));
            msg.addRecipient(Message.RecipientType.TO,
                             new InternetAddress(toemail, toname));
            msg.setSubject(msgsubject);
            msg.setText(messgbody);
            Transport.send(msg);
            System.out.println("Email sent to:"+toemail);
            
            sentemails sentEmails= new sentemails();
            sentEmails.setSent_to(toemail);
            sentEmails.setSentdate(dat);
            sentEmails.setSubject(msgsubject);
            sentEmails.setMessg(messgbody);
            sentEmails.setSentby("Siddharth Chaubal");
            
            pm.makePersistent(sentEmails);
            pm.close();
            
        } catch (AddressException e) {
            System.out.println("Address Exception: No such address; "+e);
            return e.toString();
        } catch (MessagingException e) {
            System.out.println("Messaging Exception: Cannot send message: "+e);
            return e.toString();
        } catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
            System.out.println("Unsupported Encoding: "+e);
        	e.printStackTrace();
        	return e.toString();
		}

        return("Success");
		
		
	}
}
