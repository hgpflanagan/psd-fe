<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div class="rail-module">
	<strong><c:out value="${content.name}"/></strong></br>
	<cms:render value="${content.text}"/>
</div>