package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

// By implementing Singleton only one Footer can exist.
// It is created in the DB when the application starts.

public class Footer extends Content implements Singleton {


	private String name = "Global Footer";
	private List<Link> socialLinks;
	private String contactInfo;


	public String getContactInfo(){
		return contactInfo;
	}
	
	public void setContactInfo(String contactInfo){
		this.contactInfo = contactInfo;
	}

	public List<Link> getSocialLinks(){
		return socialLinks;
	}
	
	public void setSocialLinks(List<Link> socialLinks){
		this.socialLinks = socialLinks;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}


}