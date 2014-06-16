package com.psddev.brightspot.utils;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.cms.tool.*;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

 // Custom Page widgets can be added to the CMS dashboard
 // The JSP can render any content / logic
 // If a widget is not appearing on your dashboard run http://localhost:8080/_debug/init

public class DashboardWidget extends Tool {

	private static Logger LOGGER = LoggerFactory.getLogger(DashboardWidget.class);

    private String widgetTitle = "Custom Dashboard Widget";
    @ToolUi.Note("Add custom css to style the widget. Example: background-color: #000;")
    @ToolUi.CodeType("text/css")
    private String customCss = "background-color:#eaeaea; height:400px;";
    private ReferentialText customContent;

    public String getWidgetTitle(){
        return widgetTitle;
    }
    
    public void setWidgetTitle(String widgetTitle){
        this.widgetTitle = widgetTitle;
    }

    public ReferentialText getCustomContent(){
        return customContent;
    }
    
    public void setCustomContent(ReferentialText customContent){
        this.customContent = customContent;
    }

    public String getCustomCss(){
        return customCss;
    }
    
    public void setCustomCss(String customCss){
        this.customCss = customCss;
    }
	
    @Override
    public List<Plugin> getPlugins() {
        List<Plugin> plugins = new ArrayList<Plugin>();

        plugins.add(createPageWidget(
                "Dashboard Widget",
                "dashboardWidget.area",
                "/_widgets/dashboardWidget.jsp",
                DASHBOARD_WIDGET_POSITION, 1.0, 4.0));

        return plugins;
    }

}
