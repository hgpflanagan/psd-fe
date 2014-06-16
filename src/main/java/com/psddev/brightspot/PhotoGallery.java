package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

// Galleries have their own page, can be added as enhancements in rich
// text areas, or used as the lead on an article object.


@ToolUi.Referenceable
@Renderer.LayoutPath("/render/common/page-container.jsp")
@Renderer.Paths ({
	@Renderer.Path(value = "/render/model/gallery-object.jsp"),
	@Renderer.Path(context = "contentModule", value="/render/modules/gallery-module.jsp"),
})
public class PhotoGallery extends Content implements Directory.Item, ArticleLead {

	@Indexed
	@Required
	private String name;
	@Required
	private List<Image> images;


	public List<Image> getImages(){
		return images;
	}
	
	public void setImages(List<Image> images){
		this.images = images;
	}
	 
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}


  // By implementing Directory.Item the createPermalink method can be used
  // to generate the URL logic. Below the name field is used to create
  // the permalink.

	@Override
    public String createPermalink(Site site) {

        if (this.getName() != null){
            return "/photos/" + StringUtils.toNormalized(name);
        } else {
            return null;
        }    
    }


}