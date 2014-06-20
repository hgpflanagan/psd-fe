<!DOCTYPE html><%@include file="/render/common/taglibs.jsp" %><%@page import="com.psddev.dari.db.*,com.psddev.brightspot.utils.SiteSettings,com.psddev.dari.db.Query,com.psddev.dari.util.Settings
"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="/static/ico/favicon.png">

    <%

    SiteSettings settings = Application.Static.getInstance(SiteSettings.class);
    if (settings != null) {
        pageContext.setAttribute("settings", settings);
    }

    %>

    <title>${seo.title}</title>

    <link rel="stylesheet/less" type="text/css" href="/assets/styles/site.less"/>
    <script src="/assets/js/less.js" type="text/javascript"></script>

    <script data-main="/assets/js/main.js" src="/assets/js/require.js"></script>

    <cms:render value="${stage.headNodes}" />
  </head>

  <body>

	<cms:render value="${mainContent}"/>

  </body>
</html>
