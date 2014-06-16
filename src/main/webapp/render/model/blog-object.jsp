<%@include file="/render/common/taglibs.jsp" %>

<%@page import="
com.psddev.brightspot.BlogPost,
com.psddev.brightspot.Author,
com.psddev.dari.db.Query,
com.psddev.dari.util.Settings,
com.psddev.dari.db.*,
java.util.List" %>


  <%  int pageNum = 1;
    String pageNumber = request.getParameter("page");
    if (pageNumber!=null){
        try {
            pageNum = Integer.parseInt(pageNumber);
        }
        catch (Exception e){            
        }
    }
    pageContext.setAttribute("pageNumber", pageNum);
 %>
<c:set var="pageCount" value="${content.pageCount}"/>  

<div class="container">
     <h1><cms:render value="${content.headline}"/></h1>
	 <h5>Written by: <c:out value="${content.author.name}"/></h5>
	    <c:choose>
		        <c:when test="${pageCount eq 1}">
		            <cms:render value="${content.body}" />                    
		        </c:when>
	        <c:otherwise>
	            <cms:render value="${content.body}"
	                beginOffset="${pageNumber < 2 ? '' : pageNumber - 2}"
	                endOffset="${pageNumber == pageCount ? '' : pageNumber - 1}"
	                beginMarker="${pageNumber < 2 ? '' : 'pagination-marker'}"
	                endMarker="${pageNumber == pageCount ? '':'pagination-marker'}" />                    
	        </c:otherwise>
	    </c:choose>
	        <c:if test="${pageCount > 1}">
        <div class="pagination clrfix">
            <ul class="clrfix">
                <li class="prev">
                     <c:choose>
                         <c:when test="${pageNumber <= 1}">
                               <a class="prev btn disabled"></a> 
                         </c:when>
                         <c:otherwise>
                            <a class="prev btn" href="${content.permalink}/?page=${pageNumber-1}"></a> 
                         </c:otherwise>
                     </c:choose>                   
                </li>
                <li class="status">
                    <span class="current">${pageNumber}</span>
                    of
                    <span class="total">${pageCount}</span>
                </li>
                <li class="next">
                     <c:choose>
                         <c:when test="${pageNumber >= pageCount}">
                            <a class="next btn disabled"></a>
                         </c:when>
                         <c:otherwise>
                            <a class="next btn" href="${content.permalink}/?page=${pageNumber+1}"></a>
                         </c:otherwise>
                     </c:choose>                   
               </li>
            </ul>
        </div>                 
    </c:if>
	<hr>
</div>



    