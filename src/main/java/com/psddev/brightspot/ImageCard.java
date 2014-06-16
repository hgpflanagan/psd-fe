package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // Simple Image module with an image and a link
 // Can be added to the Main Grid of the News Page
 // Can be previewed in the FindTool
 // thanks to the EmbedPreviewWidth annotation


@Renderer.Path("/render/modules/image-card-module.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
@Renderer.EmbedPreviewWidth(325)
public class ImageCard extends Content implements Placeable {

	private String name;
	private Image image;
	private Link link;

	public Image getImage(){
		return image;
	}
	
	public void setImage(Image image){
		this.image = image;
	}

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


}