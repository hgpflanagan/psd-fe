package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.RightRail;
import com.psddev.dari.db.ObjectType;

import com.psddev.crosslinker.db.Crosslinkable;
import com.psddev.crosslinker.db.Crosslinkable.SimulationName;

// Objects are added to the CMS by extending the Content class.

// Renderer.LayoutPath provides a path to the jsp file that creates the page layout.
// The Renderer.Path renders the object itself. Anywhere this object is used,
// that jsp is used to render it.

// The @Renderer.Path(context = "contentModule" provides a different renderer when it is 
// rendered in that context. The context is set in the jsp.

// Implementing Directory.Item creates a template, and places the Article in the Common Content widget.

// The @ToolUi.DropDown annotation on Category provies a simple dropdown interface.

// Use @ToolUi.Heading("Text Goes Here") to create sections in the content edit view.

// @SimulationName("Default") is in reference to the Crosslinker simulation for automatic link creation of
// keywords

// ContentModule is implemented to allow this object to be placed on the News Page

@Renderer.LayoutPath("/render/common/page-container.jsp")
@Renderer.Paths ({
	@Renderer.Path(value = "/render/model/article-object.jsp"),
	@Renderer.Path(context = "contentModule", value="/render/modules/content-module.jsp"),
})
@SimulationName("Default")
@Renderer.EmbedPath("/render/common/embed.jsp")
public class Article extends Content implements Directory.Item, Crosslinkable, ContentModule {

	@Required
	@Indexed
	private String headline;
	@Indexed
	@Required
	private Author author;
	@ToolUi.Note("Short text snippet (200 characters) to display when article is picked for the Homepage or a module")
	@ToolUi.SuggestedMaximum(205)
	private String intro;
	private ArticleLead lead;
	@Crosslinked
	private ReferentialText body;
	@Indexed
	@ToolUi.DropDown
	@ToolUi.Sortable
	private Category category;
	@Indexed
	private List<Tag> tags;
	@ToolUi.Tab("Page Modules")
	@ToolUi.Heading("Right Rail: Related Content")
	@ToolUi.NoteHtml("If not set, uses <a target='_blank' href='/cms/admin/settings.jsp'>Global Right Rail</a>")
	private List<RightRail> rightRailModules;

	@ToolUi.Tab("Extras")
	@ToolUi.Heading("Assign an icon to your content to be used when it is placed on the Homepage")
	@ToolUi.NoteHtml("Paste your FontAwesome icon name, example fa-camera - find them <a target='_blank' href='http://fontawesome.io/icons/'>here</a>")
	private String fontAwesomeIcon;

	public String getFontAwesomeIcon(){
		return fontAwesomeIcon;
	}
	
	public void setFontAwesomeIcon(String fontAwesomeIcon){
		this.fontAwesomeIcon = fontAwesomeIcon;
	}

	public Category getCategory(){
		return category;
	}
	
	public void setCategory(Category category){
		this.category = category;
	}

	public List<Tag> getTags(){
		return tags;
	}
	
	public void setTags(List<Tag> tags){
		this.tags = tags;
	}

	public List<RightRail> getRightRailModules(){
		return rightRailModules;
	}
	
	public void setRightRailModules(List<RightRail> rightRailModules){
		this.rightRailModules = rightRailModules;
	}
	
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

	 
	public ArticleLead getLead(){
		return lead;
	}
	
	public void setLead(ArticleLead lead){
		this.lead = lead;
	}


  // By implementing Directory.Item the createPermalink method can be used
  // to generate the URL logic. The headline field is used to create
  // the permalink.

	@Override
    public String createPermalink(Site site) {

        if (this.getHeadline() != null){
            return "/article/" + StringUtils.toNormalized(headline);
        } else {
            return null;
        }    
    }


}