package com.psddev.brightspot.utils;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.cms.tool.*;

// New Tabs can be added to the navigation in the CMS

public class NewTab extends Tool {

	
    @Override
    public List<Plugin> getPlugins() {
        List<Plugin> plugins = new ArrayList<Plugin>();

        plugins.add(createArea2("Custom Tool", "customTool",
                "dashboard/customTool", "path/to/your.jsp"));

        return plugins;
    }

}
