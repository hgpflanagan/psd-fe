package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // Simple right rail module, implementing the interface.
 // The @ToolUi.RichText annotation allows String fields
 // to have rich text controls.

@Renderer.Path("/render/modules/text-card-module.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
@Renderer.EmbedPreviewWidth(300)
public class TextCard extends Content implements Placeable {

	@ToolUi.CssClass("example")
	private String name;
	private ReferentialText text;
	@ToolUi.CodeType("text/css")
	@ToolUi.Note("Hex value of background color of Card, Example #eaeaea")
	private String backgroundColor;
	@ToolUi.CodeType("text/css")
	@ToolUi.Note("Hex value of text color of Card, Example #ffffff")
	private String textColor;
	private Link link;


	public Link getLink(){
		return link;
	}
	
	public void setLink(Link link){
		this.link = link;
	}

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

	public String getBackgroundColor(){
		return backgroundColor;
	}
	
	public void setBackgroundColor(String backgroundColor){
		this.backgroundColor = backgroundColor;
	}

	public String getTextColor(){
		return textColor;
	}
	
	public void setTextColor(String textColor){
		this.textColor = textColor;
	}
}