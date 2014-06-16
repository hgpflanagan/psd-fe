package com.psddev.brightspot.utils;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.cms.tool.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 // Custom JSP widgets can be added to the content edit view
 // The JSP can render any logic.
 // If a widget is not appearing check Admin > Settings or run http://localhost:8080/_debug/init

public class ContentWidget extends Tool {

	private static Logger LOGGER = LoggerFactory.getLogger(ContentWidget.class);

    private String widgetTitle = "Custom Content Widget";
    private ReferentialText text;
    

    public String getWidgetTitle(){
        return widgetTitle;
    }
    
    public void setWidgetTitle(String widgetTitle){
        this.widgetTitle = widgetTitle;
    }


    public ReferentialText getText(){
        return text;
    }
    
    public void setText(ReferentialText text){
        this.text = text;
    }
	
    @Override
    public List<Plugin> getPlugins() {
        List<Plugin> plugins = new ArrayList<Plugin>();

        plugins.add(createJspWidget(
                "Content Widget",
                "contentWidget.area",
                "/_widgets/contentWidget.jsp",
                // CONTENT_BOTTOM_WIDGET_POSITION, 0.0, 100.0));
                CONTENT_RIGHT_WIDGET_POSITION, 0.0, 100.0));

        return plugins;
    }

}
