package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

 // The categories page is an example of a page built entirely
 // from a query. There are no objects referenced. The
 // categories-page-object.jsp renders the results of the query
 // using the getArticlesByCategory method

@Renderer.LayoutPath("/render/common/page-container.jsp")
@Renderer.Path("/render/model/categories-page-object.jsp")
public class CategoriesPage extends Content {

	@Required
	private String name = "Categories Page";

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public Map<String, List<Article>> getArticlesByCategory(){
	
	    List<Grouping<Article>> groupings = Query.from(Article.class).groupBy("category");
        Map<String, List<Article>> arts = new HashMap<String, List<Article>>();
	    for (Grouping grouping : groupings) {
	    	Category category = (Category) grouping.getKeys().get(0);
	    	List<Article> articles = grouping.createItemsQuery().selectAll();
            arts.put(category.getName(), articles);
	        }
		return arts;
	}
  
}