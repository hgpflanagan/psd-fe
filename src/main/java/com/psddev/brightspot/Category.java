package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.dari.db.*;
import com.psddev.dari.db.Recordable;
import com.psddev.dari.util.*;
import com.psddev.cms.db.ToolUi;

 // The GlobalFilter annotation makes the class
 // a default object to filter by in search and
 // in the SiteMap widget on the Dashboard.

// This includes an example of the beforeSave method being
// used to populate a hidden field.

@ToolUi.GlobalFilter
public class Category extends Content {

	@Required
	@Indexed(unique = true)
	private String name;

	@Indexed
    @ToolUi.Hidden
    private String internalName;
	
	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

    public String getInternalName() {
        return internalName;
    }

    public void setInternalName(String internalName) {
        this.internalName = internalName;
    }

    @Override
    public void beforeSave() {
        this.internalName = StringUtils.toNormalized(name);
    }

    public String toString() {
        return internalName;
    }

}