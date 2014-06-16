<%@include file="/render/common/taglibs.jsp" %>

<cms:layout class="news-page-layout">
  <cms:render  area="newsModules">
  <h1><cms:render value="${content.name}"/></h1>
      <cms:layout class="${cms:listLayouts(content, 'newsModules')}">
	      	<cms:render value="${content.newsModules}" />
      </cms:layout>
      <br>
      <cms:layout class="${cms:listLayouts(content, 'contentModules')}">
	      	<cms:render context="contentModule" value="${content.contentModules}" />
      </cms:layout>
  </cms:render>
</cms:layout>
