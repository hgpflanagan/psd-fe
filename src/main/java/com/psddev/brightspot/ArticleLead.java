package com.psddev.brightspot;

import com.psddev.cms.db.Content;
import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.ToolUi;
import java.util.*;


public interface ArticleLead extends Recordable {

	// This is an interface that groups together any items that can
	// be the lead content in an article - an Image or a Gallery
	// using <cms:render value="${content.lead}"/> either object is
	// rendered in place. See article-object.jsp for the code.

}