package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // Simple right rail module, implementing the interface.
 // The @ToolUi.RichText annotation allows String fields
 // to have rich text controls.

@Renderer.Path("/render/modules/text-module.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
@Renderer.EmbedPreviewWidth(300)
public class TextModule extends Content implements RightRail {

	@ToolUi.RichText
	private String name;
	private ReferentialText text;

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public ReferentialText getText(){
		return text;
	}
	
	public void setText(ReferentialText text){
		this.text = text;
	}
}