<%@include file="/render/common/taglibs.jsp" %>

<%@ page import="
com.psddev.cms.tool.Widget,
com.psddev.cms.tool.JspWidget,
com.psddev.cms.tool.ToolPageContext,
com.psddev.brightspot.utils.*, 
com.psddev.brightspot.Homepage,
com.psddev.brightspot.Article,
com.psddev.brightspot.utils.*,
com.psddev.dari.db.Query,
com.psddev.dari.util.Settings"
%>

<%

ContentWidget contentWidget = Query.from(ContentWidget.class).first();
if (contentWidget != null) {
    pageContext.setAttribute("contentWidget", contentWidget);
}

%>


<cms:render value="${contentWidget.text}"/>

<%
ToolPageContext wp = new ToolPageContext(pageContext);
Widget widget = JspWidget.getWidget(wp);
Object object = JspWidget.getObject(wp);
  

if (JspWidget.isUpdating(wp) && object instanceof Article) {
	Article article = (Article) object;
		
	if (article.getPermalink() == null) {
				
	}

    return;
}
%>
<% if (object instanceof Article) { %>
 	
 	You're editing an Article

<% } %>

<% if (object instanceof Homepage) { %>
 	
 	You are editing the Homepage

<% } %>
