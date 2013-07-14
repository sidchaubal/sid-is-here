package com.google.aboutme;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;
import com.google.appengine.api.datastore.Text;
@PersistenceCapable
public class pagecontent {
	@PrimaryKey
	@Persistent
private String page;
	
	@Persistent
	public Text content;

	public pagecontent() {}
	
	public pagecontent(String page, Text content)
	{
		this.page=page;
		this.content=content;
		
	}
	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public Text getContent() {
		return content;
	}

	public void setContent(Text content) {
		this.content = content;
	}
	



}
