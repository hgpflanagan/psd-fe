package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // The News Page is an example of a page built using the ListLayout feature
 // in Dari / Brightspot. Layouts have been created in the grid.less file
 // The News Page references these layouts and the CMS interface automatically provides 
 // UI to allow editors to choose from them, and pick content that works in each. 

 // The Placeable.class is an interface that has two classes that implement it.
 // By listing the Placeable.class any of the modules can be added to any area.
 // You can limit to a specific module, example, two wide grid layout only allows
 // images on the left, and photo galleries on the right.

@Renderer.LayoutPath("/render/common/page-container.jsp")
@Renderer.Path("/render/model/news-page-object.jsp")
public class NewsPage extends Content implements Singleton {

	@Required
	private String name = "News Page";
	@ToolUi.Heading("News Page Modules Grid")
    @Renderer.ListLayouts(map={
    	@Renderer.ListLayout(name="grid-one", itemClasses={Placeable.class}),
    	@Renderer.ListLayout(name="grid-two", itemClasses={Placeable.class}),
    })

	@CollectionMaximum(5)
	private List<Placeable> newsModules;

	@ToolUi.Heading("News Page Content Grid")
    @Renderer.ListLayouts(map={
		@Renderer.ListLayout(name="grid-2-modules", itemClasses={ImageCard.class, PhotoGallery.class}),
		@Renderer.ListLayout(name="grid-3-modules", itemClasses={ContentModule.class, ContentModule.class, ContentModule.class }),
    })
	private List<ContentModule> contentModules;


	public List<ContentModule> getContentModules(){
		return contentModules;
	}
	
	public void setContentModules(List<ContentModule> contentModules){
		this.contentModules = contentModules;
	}

	public List<Placeable> getNewsModules(){
		return newsModules;
	}
	
	public void setNewsModules(List<Placeable> newsModules){
		this.newsModules = newsModules;
	}

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}


}