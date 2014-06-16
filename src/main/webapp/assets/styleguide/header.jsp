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

    <link rel="stylesheet/less" type="text/css" href="/assets/less/styleguide.less"/>
    <script src="/assets/js/vendor/less.js" type="text/javascript"></script>
  </head>
  <body>
    <div class="container">
