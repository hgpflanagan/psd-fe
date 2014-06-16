<%@include file="/render/common/taglibs.jsp" %>

<a target="_blank" href="${content.link.url}">
	<div class="img-card-module" >

		<!-- When the module is placed in the promo spot on the
		news page -->

		<c:if test="${cms:inContext('grid-two-large')}">
		    <c:set var="size" value="large" />
		</c:if>
		<c:if test="${cms:inContext('grid-one-tall')}">
		    <c:set var="size" value="tall" />
		</c:if>

		<!-- When the module is one of the side promo spots
		on the news page -->

		<c:if test="${cms:inContext('grid-one-small')}">
		    <c:set var="size" value="small" />
		</c:if>
		<c:if test="${cms:inContext('grid-two-small')}">
		    <c:set var="size" value="small" />
		</c:if>

		<!-- When the module is placed in either the three or two wide grids
		on the news page -->

		<c:if test="${cms:inContext('grid-3-modules')}">
		    <c:set var="size" value="threeWideCard" />
		</c:if>
		<c:if test="${cms:inContext('grid-2-modules')}">
		    <c:set var="size" value="twoWideCard" />
		</c:if>
		<cms:img overlay="true" src="${content.image.file}" size="${size}"/>
	</div>
</a>