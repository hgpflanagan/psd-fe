package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

// By implementing Singleton only one Header can exist.
// It is created in the DB when the application starts.

public class Header extends Content implements Singleton {


	private String name = "Global Header";
	private List<Link> links;

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public List<Link> getLinks(){
		return links;
	}
	
	public void setLinks(List<Link> links){
		this.links = links;
	}


}