package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.ToolUi;
import com.psddev.cms.db.Taxon;
import java.util.*;

 // The GlobalFilter annotation makes the class
 // a default object to filter by in search and
 // in the SiteMap widget on the Dashboard.

 // Taxon provides a view of content based on Parent
 // child relationships in the Find Tool

@ToolUi.GlobalFilter
public class Tag extends Content implements Taxon {

	@Required
    @Indexed
    private String name;
    
    @Indexed
    private Tag parent;

    @Indexed
    @Recordable.JunctionField("parent")
    private List<Tag> children;


    public Tag getParent() {
        return parent;
    }

    public void setParent(Tag parent) {
        this.parent = parent;
    }

    public boolean isRoot() {
        return getParent() == null;
    }

    public List<Tag> getChildren() {
        if (children == null) {
            children = new ArrayList<Tag>();
        }

        return children;
    }

    public void setChildren(List<Tag> children) {
        this.children = children;
    }
 
	public String getName(){
		return name;
	}

	public void setName(String name){
		this.name = name;
	}

}