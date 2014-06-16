<%@include file="/render/common/taglibs.jsp" %>

<div class="container">
        <c:if test="${cms:instanceOf(mainContent,'com.psddev.brightspot.PhotoGallery')}">
            <h1><c:out value="${content.name}" /></h1>
        </c:if>
    <div id="gallery" class="carousel slide">
        <div class="carousel-inner">
            <c:forEach items="${content.images}" var="image" varStatus="status">
                <div class="item${status.first ? ' active' : ''}">
                    <cms:img size="galleryCrop" src="${image}"/> 
                        <div class="carousel-caption">
                		</div>       
        		</div>
            </c:forEach>
        </div>

    <!-- Carousel nav -->
    <a class="carousel-control left" href="#gallery" data-slide="prev">&lsaquo;</a>
    <a class="carousel-control right" href="#gallery" data-slide="next">&rsaquo;</a>
    </div>
</div>

<script>
    !function ($) {
        $('#gallery').carousel({
            interval:200;
        });
    }(window.jQuery)
</script>


