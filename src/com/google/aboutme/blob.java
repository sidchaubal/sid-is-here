package com.google.aboutme;
import java.util.List;

import com.google.appengine.api.blobstore.BlobKey;

import javax.jdo.annotations.*;

@PersistenceCapable
public class blob {
	@PrimaryKey
	@Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	private Long id;
	
	@Persistent
private BlobKey blobkey;

	@Persistent
private String user;
	
@Persistent
private List<String> sharedwit;
		

	public blob() {}
	

	public long getId() {
		return id;
	}





	public void setId(long id) {
		this.id = id;
	}





	public BlobKey getBlobkey() {
		return blobkey;
	}





	public void setBlobkey(BlobKey blobkey) {
		this.blobkey = blobkey;
	}





	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}


	public List<String> getSharedwit() {
		return sharedwit;
	}


	public void setSharedwit(List<String> sharedwit) {
		this.sharedwit = sharedwit;
	}

	
	
	
	
}
