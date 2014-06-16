<%@include file="/render/common/taglibs.jsp" %>

<%@page import="
com.psddev.brightspot.Article,
com.psddev.brightspot.Author,
com.psddev.dari.db.*,
com.psddev.brightspot.utils.SiteSettings,
com.psddev.dari.util.Settings,
java.util.List
"%>

<%

SiteSettings settings = Application.Static.getInstance(SiteSettings.class);
if (settings != null) {
    pageContext.setAttribute("rightRails", settings.getRightRailModules());
}

%>
<jsp:include page="/render/common/crosslinkable.jsp" />

<!-- Set the article crop size, configured in the CMS Admin.Settings -->
<c:set var="imageSize" value="articleCrop" scope="request" />
<!-- Adding microdata markup - run ?_format=json on an article page to view output. -->
<div itemscope itemtype="http://schema.org/Article">


<cms:layout class="article-layout container">
    <cms:render area="content">
      <h1><span itemprop="headline"><cms:render value="${content.headline}"/></span></h1>
			<h5>Written by: <span itemprop="author"><c:out value="${content.author.name}"/></span></h5>

      <!-- Render an Image, Gallery or Video -->
      <c:if test="${!empty content.lead}">
        <cms:render class="img-responsive articleLead" context="articleLead" value="${content.lead}" />
      </c:if>
      <br>
			<span itemprop="articleBody"><cms:render value="${content.body}" /></span>

			<hr>
      <div class="tagSection">
			<c:if test="${!empty content.tags}">
        <ul class="tags">
			  <c:forEach var="item" items="${mainContent.tags}">
				<li><span class="label label-info"><cms:render value="${item.name}" /></span></li>
			  </c:forEach>
        </ul>
			</c:if>
      </div>
    </cms:render>

    <!-- Render the RightRail -->
    <cms:render area="right" class="rightRail">
           <!-- Render the RightRail Modules from SiteSettings or the Article instance -->
          <c:choose>
            <c:when test="${!empty content.rightRailModules}">
                <cms:render context="rightRail" value="${content.rightRailModules}" />
            </c:when>    
              <c:otherwise>
                <cms:render value="${rightRails}" />
            </c:otherwise>
          </c:choose>
         </div>
        </div>
    </cms:render>
</cms:layout>
</div>