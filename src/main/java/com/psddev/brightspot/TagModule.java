package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // Simple right rail module, implementing the interface. Tag selected 
 // will result in articles matching that tag selected in the module
 // See the jsp for the query.

@Renderer.Path("/render/modules/tag-module.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
public class TagModule extends Content implements RightRail {

	private String name;
	private Tag tag;

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public Tag getTag(){
		return tag;
	}
	
	public void setTag(Tag tag){
		this.tag = tag;
	}
}