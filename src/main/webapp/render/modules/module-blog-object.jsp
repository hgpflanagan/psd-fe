<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div class="rail-module">
	<strong><cms:render value="${content.headline}"/></strong></br>
	<cms:render value="${content.intro}"/> <cms:a href="${content}">Read More</cms:a>
</div>