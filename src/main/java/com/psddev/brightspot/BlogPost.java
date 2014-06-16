package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.RightRail;
import com.psddev.dari.db.ObjectType;

// Multiple paths to various jsp files can be set on an object, specific to the context it will
// be rendered in. In the example below the BlogPost object can be used on a page, as a blog post
// and also as a right rail module or a content module.
// When the context is set, the rendering of the content changes.

// PageStage is used in this example to show how custom CSS or JavaScript can be added 
// to a page, based on the object being used. BlogPosts use a custom CSS style on this
// example site to illustrate this - with a new header nav color and footer color.

@Renderer.Paths ({
	@Renderer.Path(value = "/render/model/blog-object.jsp"),
	@Renderer.Path(context = "rightRail", value = "/render/modules/module-blog-object.jsp"),
	@Renderer.Path(context = "contentModule", value = "/render/modules/content-module.jsp"),
})
@Renderer.LayoutPath("/render/common/page-container.jsp")
@Renderer.EmbedPath("/render/common/embed.jsp")
public class BlogPost extends Content implements Directory.Item, RightRail, ContentModule, PageStage.Updatable {

	@Indexed
	@Required
	private String headline;
	@Indexed
	private Author author;
	@ToolUi.Note("Short text snippet (200 characters) to display when blog is placed as module")
	@ToolUi.SuggestedMaximum(200)
	private String intro;
	private ReferentialText body;

	
	public String getHeadline() {
		return headline;
	}
	public void setHeadline(String headline) {
		this.headline = headline;
	}
	public Author getAuthor() {
		return author;
	}
	public void setAuthor(Author author) {
		this.author = author;
	}

	public String getIntro(){
		return intro;
	}
	
	public void setIntro(String intro){
		this.intro = intro;
	}
	
	public ReferentialText getBody() {
		return body;
	}
	
	public void setBody(ReferentialText body) {
		this.body = body;
	}

  // By implementing Directory.Item the createPermalink method can be used
  // to generate the URL logic. Below the headline field is used to create
  // the permalink.

	@Override
    public String createPermalink(Site site) {

	Author author = this.getAuthor();
	        if (!ObjectUtils.isBlank(author)) {
	        	return "/blog/" + StringUtils.toNormalized(author.getName()) + "/" + StringUtils.toNormalized(headline);
	        } else {
	        	return "/blog/" + StringUtils.toNormalized(headline);
	        }
	}
    
    // Custom CSS Styles for when the blog object appears on content. This
    // is added to the <head> of the page-container using: <cms:render value="${stage.headNodes}" />

	@Override
    public void updateStage(PageStage stage) {
        stage.addStyleSheet("/static/css/blog.css");
    }

    /**
     * Returns the number of total pages in the ReferentialText area.
     *
     * @return page count in referential text
     */
    
    public int getPageCount() {

        int count = 1;

        for (Object obj : this.body) {
            if (obj instanceof Reference) {
                Object referenced = ((Reference) obj).getObject();
                if (referenced instanceof ReferentialTextMarker) {
                    if ((((ReferentialTextMarker) referenced).getInternalName().equals("pagination-marker"))) {
                        count++;
                    }
                }
            }
        }
        return count;
    }
    
}