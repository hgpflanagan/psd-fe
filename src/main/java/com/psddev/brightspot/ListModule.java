package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // Simple right rail module, implementing the interface.

@Renderer.Path("/render/modules/list-module.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
@Renderer.EmbedPreviewWidth(300)
public class ListModule extends Content implements RightRail {

	private String name;
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