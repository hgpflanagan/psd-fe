<%@include file="/render/common/taglibs.jsp" %>

<a target="_blank" href="${content.link.url}">
	<div style="color: ${content.textColor};
		background-color:${content.backgroundColor};" class="card-module" >
		<strong><c:out value="${content.name}"/></strong>
		<p>
		<cms:render value="${content.text}"/>
	</div>
</a>
