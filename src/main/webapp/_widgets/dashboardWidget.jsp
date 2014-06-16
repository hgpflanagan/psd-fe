<%@page import="com.psddev.brightspot.utils.*, com.psddev.dari.db.Query, com.psddev.dari.util.Settings"%>
<%@include file="/render/common/taglibs.jsp" %>
<%

DashboardWidget dashWidget = Query.from(DashboardWidget.class).first();
if (dashWidget != null) {
    pageContext.setAttribute("dashWidget", dashWidget);
}

%>
<div style="${dashWidget.customCss}" class="widget">
<h1><cms:render value="${dashWidget.widgetTitle}"/></h1>
<cms:render value="${dashWidget.customContent}"/>
</div>
