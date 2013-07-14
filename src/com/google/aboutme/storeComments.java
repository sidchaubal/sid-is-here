package com.google.aboutme;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
//import javax.servlet.http.HttpSession;

@PersistenceCapable
public class storeComments {
	@PrimaryKey
	@Persistent
    private String name;
	
	@Persistent
	private String comment;
	
	@Persistent
	private int live;
	

	public storeComments()
	{
		name="default_user";
		comment="I love this site!";
		live=0;
	}
	
	storeComments(String name, String comment){
		this.name=name;
		this.comment=comment;
		live=0;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getLive() {
		return live;
	}

	public void setLive(int live) {
		this.live = live;
	}
	
	
}
	