package com.google.aboutme;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

@PersistenceCapable
public class attachment {

	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long contentid;
	
	@Persistent
	private String emailid;
	
	@Persistent
	private String contenttype;
	@Persistent
	private String filename;
	@Persistent
	private byte[] content;
	       
	
	
	
	    public Long getContentid() {
		return contentid;
	}

	public void setContentid(Long contentid) {
		this.contentid = contentid;
	}

		public String getContenttype() {
	        return contenttype;
	    }

	    public void setContenttype(String contenttype) {
	        this.contenttype = contenttype;
	    }

	    public String getFilename() {
	        return filename;
	    }

	    public void setFilename(String filename) {
	        this.filename = filename;
	    }

	    public byte[] getContent() {
	        return content;
	    }

	    public void setContent(byte[] content) {
	        this.content = content;
	    }

	 

		public String getEmailid() {
			return emailid;
		}

		public void setEmailid(String emailid) {
			this.emailid = emailid;
		}

	    
	    
	}


