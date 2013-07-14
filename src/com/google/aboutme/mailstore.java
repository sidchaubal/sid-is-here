package com.google.aboutme;

import java.util.Date;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Text;

/**
 * @author Sid
 *
 */
@PersistenceCapable
public class mailstore {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	private String sender;
	
	@Persistent
	private String senderemail;
	
	@Persistent
	private String subject;
	
	@Persistent
	private Text messg;
	
	@Persistent
	private Date sentdate;
	
	public mailstore() {}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public Text getMessg() {
		return messg;
	}

	public void setMessg(Text messg) {
		this.messg = messg;
	}

	public Date getSentdate() {
		return sentdate;
	}

	public void setSentdate(Date sentdate) {
		this.sentdate = sentdate;
	}

	public String getSenderemail() {
		return senderemail;
	}

	public void setSenderemail(String senderemail) {
		this.senderemail = senderemail;
	}
	
	
	
}
