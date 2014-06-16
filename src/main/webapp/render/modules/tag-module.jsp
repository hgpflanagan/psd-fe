<%@include file="/render/common/taglibs.jsp" %>

<%@page import="
com.psddev.brightspot.Tag,
com.psddev.brightspot.TagModule,
com.psddev.brightspot.Article,
com.psddev.dari.db.Query,
java.util.List;
"%>

<div class="rail-module">
	<strong><c:out value="${content.name}"/></strong><br />
	<%  List<Article> articles = Query.from(Article.class)
		.where("tags = ?", ((TagModule)request.getAttribute("record"))
		.getTag())
		.selectAll(); 
		pageContext.setAttribute("articles", articles);
	%>
	 <c:forEach var="item" items="${articles}">
		<li style="list-style:none;">
			<cms:a href="${item}"><cms:render value="${item.headline}" /></cms:a>
		</li>
	 </c:forEach>
 </div>

