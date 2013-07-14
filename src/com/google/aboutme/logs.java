package com.google.aboutme;
import com.google.appengine.api.datastore.Text;

import javax.jdo.annotations.*;

@PersistenceCapable
public class logs {

	
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
	Text logy;
	
	
	@Persistent
	String user;

	public logs() {}

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public Text getLogy() {
		return logy;
	}


	public void setLogy(Text logy) {
		this.logy = logy;
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}
	
	
	
}
