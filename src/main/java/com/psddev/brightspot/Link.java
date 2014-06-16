package com.psddev.brightspot;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;

// Parent class. Child classes inherit the text property.
// The Embedded annotation means where Link is added to 
// an object, it is embedded within it, and is can not be
// used outside of it. The UI appears inline, indented.

@Recordable.Embedded
public abstract class Link extends Content {

	@Indexed
	private String text;
	
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}

}
