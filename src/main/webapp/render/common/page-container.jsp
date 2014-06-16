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

    <link href="/static/css/bootstrap.css" rel="stylesheet">
    <link href="/static/css/main.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,300,700' rel='stylesheet' type='text/css'>
    <link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
    <script src="/static/js/jquery.min.js"></script>
    <script src="/static/js/smoothscroll.js"></script>
    
    <cms:render value="${stage.headNodes}" />
  </head>

  <body data-spy="scroll" data-offset="0" data-target="#navigation">

    <!-- Fixed navbar -->
	    <div id="navigation" class="navbar navbar-default navbar-fixed-top">
	      <div class="container">
	        <div class="navbar-header">
	          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	            <span class="icon-bar"></span>
	          </button>
	          <a class="navbar-brand" href="/">
	        <c:choose>
	            <c:when test="${!empty settings.headerLogo}">
	                <cms:img width="150" src="${settings.headerLogo}"/>
	            </c:when>    
	            <c:otherwise>
	                <b><cms:render value="${settings.navBarText}"/></b>
	            </c:otherwise>
            </c:choose>
	          </a>
	        </div>
	        <div class="navbar-collapse collapse">
	          <ul class="nav navbar-nav">
		        <c:forEach var="item" items="${settings.header.links}">
	              <li><cms:a class="active" href="${item.url}">
	                <cms:render value="${item.text}" />
	              </cms:a>
	              </li>
	          	</c:forEach>
	          </ul>
	        </div><!--/.nav-collapse -->
	      </div>
	    </div>

	<cms:render value="${mainContent}"/>
    
	<div id="footerwrap">
		<div class="container">
			<div class="col-lg-5">
				<h3>Social</h3>
				<br>
				<c:forEach var="socialLink" items="${settings.footer.socialLinks}">
				<a href="${socialLink.url}"><c:out value="${socialLink.text}"/></a>
				</c:forEach>
			</div>
			
			<div class="col-lg-7">
				<h3>Contact</h3>
				<br>
				<p><cms:render value="${settings.footer.contactInfo}"/>
			</div>
		</div>
	</div>

    <script src="/static/js/bootstrap.js"></script>
	<script>
	$('.carousel').carousel({
	  interval: 2000
	})
	</script>
  </body>
</html>
