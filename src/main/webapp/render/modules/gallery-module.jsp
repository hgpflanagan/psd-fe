<%@include file="/render/common/taglibs.jsp" %>

    <div id="gallery" class="carousel slide">
        <div class="carousel-inner">
            <c:forEach items="${content.images}" var="image" varStatus="status">
                <div class="item${status.first ? ' active' : ''}">
                    <cms:img size="galleryModuleCropTwoWide" src="${image}"/>      
        		</div>
            </c:forEach>
        </div>
    </div>


<script>
    !function ($) {
        $('#gallery').carousel({
            interval:200;
        });
    }(window.jQuery)
</script>


