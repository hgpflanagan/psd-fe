<!DOCTYPE html><%@include file="/render/common/taglibs.jsp" %><%@page import="com.psddev.dari.db.*,com.psddev.brightspot.utils.SiteSettings,com.psddev.dari.db.Query,com.psddev.dari.util.Settings
"%>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <%

    SiteSettings settings = Application.Static.getInstance(SiteSettings.class);
    if (settings != null) {
        pageContext.setAttribute("settings", settings);
    }

    %>

    <link rel="stylesheet/less" type="text/css" href="/assets/styles/styleguide.less"/>
    <script src="/assets/js/less.js" type="text/javascript"></script>

    <script data-main="/assets/js/main.js" src="/assets/js/require.js"></script>
  </head>
  <body>
    <div class="sg-container">
      <div class="sg-navigation">
        <ul class="sg-nav-list">
          <li><a href="index.jsp">Getting Started</a></li>
          <li><a href="css.jsp">CSS</a></li>
          <li><a href="js.jsp">JS</a></li>
          <li><a href="elements.jsp">Elements</a></li>
          <li><a href="objects.jsp">Objects</a></li>
        </ul>
      </div>
      <div class="sg-content">
