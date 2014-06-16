<%@include file="/render/common/taglibs.jsp" %>
<link href="/static/css/main.css" rel="stylesheet">

<c:if test="${!empty alignment}">
    <c:set var="imageAlignment" value=" ${alignment}" />
</c:if>

<c:choose>
   	<c:when test="${empty content.altText}">
   		<div class="enhancement-mod${imageAlignment}">
   			<cms:img src="${content}" size="${imageSize}" overlay="true" alt="${content.name}"/>
   		</div>
   	</c:when>
   	<c:otherwise>
   	   	<div class="enhancement-mod${imageAlignment}">
   			<cms:img src="${content}" size="${imageSize}" overlay="true" alt="${content.altText}"/>
   		</div>
   	</c:otherwise>
</c:choose>

  
