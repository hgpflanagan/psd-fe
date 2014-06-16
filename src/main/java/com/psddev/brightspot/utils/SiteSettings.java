package com.psddev.brightspot.utils;

import com.psddev.dari.db.*;
import com.psddev.dari.util.*;
import com.psddev.cms.db.*;
import java.util.*;
import com.psddev.brightspot.*;
import com.psddev.dari.db.ObjectType;
import com.psddev.cms.tool.Tool;

 // Global settings can be created by extending the Tool class. This is an example.
 // These objects appear in Admin > Settings. In this example the global header
 // and footer are set for the entire site, as well as the default rail modules

public class SiteSettings extends Tool {

    private String navBarText;
    private StorageItem headerLogo;
    private Header header;
    private Footer footer;
    @ToolUi.Heading("Global Right Rail")
    @ToolUi.Note("Default Right Rail Modules on all Article pages. If no modules are set on an individual article, these default modules are used.")
    private List<RightRail> rightRailModules;


    public List<RightRail> getRightRailModules(){
        return rightRailModules;
    }
    
    public void setRightRailModules(List<RightRail> rightRailModules){
        this.rightRailModules = rightRailModules;
    }

    public Header getHeader(){
        return header;
    }
    
    public void setHeader(Header header){
        this.header = header;
    }

    public String getNavBarText(){
        return navBarText;
    }
    
    public void setNavBarText(String navBarText){
        this.navBarText = navBarText;
    }

    public StorageItem getHeaderLogo(){
        return headerLogo;
    }
    
    public void setHeaderLogo(StorageItem headerLogo){
        this.headerLogo = headerLogo;
    }

    public Footer getFooter(){
        return footer;
    }
    
    public void setFooter(Footer footer){
        this.footer = footer;
    }
     

}
