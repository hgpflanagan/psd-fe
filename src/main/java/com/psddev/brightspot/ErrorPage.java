package com.psddev.brightspot.utils;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;


@Renderer.Path("/render/common/error.jsp")
@Renderer.LayoutPath("/render/common/page-container.jsp")
public class ErrorPage extends Content {

	@Required
	private String name;
	private ReferentialText text;

	public String getName(){
		return name;
	}
	
	public void setName(String name){
		this.name = name;
	}

	public ReferentialText getText(){
		return text;
	}
	
	public void setText(ReferentialText text){
		this.text = text;
	}

}