<%@include file="/render/common/taglibs.jsp" %>

<cms:a href="${content}">
	<div class="content-module" >
		<strong><c:out value="${content.headline}"/></strong>
		<p>
		<cms:render value="${content.intro}"/>
	</div>
</cms:a>
