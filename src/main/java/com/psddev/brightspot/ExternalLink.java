package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
 
 // A child of the Link class

public class ExternalLink extends Link {

	@ToolUi.Note("Start all external links with http://")
	private String url;

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}
	
}
