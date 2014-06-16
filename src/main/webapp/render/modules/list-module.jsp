<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div class="rail-module">
	<strong><c:out value="${content.name}"/></strong>
	</br>
		<c:forEach var="item" items="${content.links}">
			<li>
				<cms:a target="_blank" href="${item.url}">
					<cms:render value="${item.text}" />
				</cms:a>
			</li>
		</c:forEach>
</div>