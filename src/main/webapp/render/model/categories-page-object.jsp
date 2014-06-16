<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="cms" uri="http://psddev.com/cms" %>

<div class="container">
<h2>Articles by Category</h2>
	<c:forEach var="item" items="${content.articlesByCategory}">
		<h4><c:out value="${item.key}"/></h4>
	  			<c:forEach var="article" items="${item.value}">
						<cms:a href="${article.permalink}">
							<c:out value="${article.headline}"/>
						</cms:a><p>
						<cms:render value="${article.intro}"/>
				</c:forEach>
			<hr>
	</c:forEach>
</div>