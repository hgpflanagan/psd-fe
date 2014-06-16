<%@include file="/render/common/taglibs.jsp" %>

	<div style="background-color:${content.headerColor}!important;" id="headerwrap">
	    <div class="container">
	    	<div class="row centered">
	    		<div class="col-lg-12">
					<h1 style="color:${content.headerTextColor}!important;">
						<cms:render value="${content.title}"/>
					</h1>
					<h3><cms:render value="${content.subTitle}"/></h3>
					<br>
	    		</div>
	    		
	    		<div class="col-lg-2">
	    			<h5><cms:render value="${content.callouts.leftHeading}"/></h5>
	    			<p><cms:render value="${content.callouts.leftDescription}"/></p>
	    			<img class="hidden-xs hidden-sm hidden-md" src="static/img/arrow1.png">
	    		</div>
	    		<div class="col-lg-8">
	    			<cms:img class="img-responsive homepage-lead-image" src="${content.image}"/>
	    		</div>
	    		<div class="col-lg-2">
	    			<br>
	    			<img class="hidden-xs hidden-sm hidden-md" src="static/img/arrow2.png">
	    			<h5><cms:render value="${content.callouts.rightHeading}"/></h5>
	    			<p><cms:render value="${content.callouts.rightDescription}"/></p>
	    		</div>
	    	</div>
	    </div> <!--/ .container -->
	</div><!--/ #headerwrap -->


	<section id="desc" name="desc"></section>
	<!-- INTRO WRAP -->
	<div id="intro">
		<div class="container">
			<div class="row centered">
				<h1><cms:render value="${content.sectionHeading}"/></h1>
				<br>
				<br>
				<c:forEach var="item" items="${content.promoArticles}">
				<div class="col-lg-4">
					<i class="fa ${item.fontAwesomeIcon} fa-5x"></i>
					<h3><cms:a href="${item}"><cms:render value="${item.headline}"/></cms:a></h3>
					<p>
					<c:choose>
					   	<c:when test="${empty item.intro}">
					   		<cms:render value="${item.body}"/>
					   	</c:when>
					   	<c:otherwise>
					    		<cms:render value="${item.intro}"/>	
					   	</c:otherwise>
					</c:choose>
				</div>
				</c:forEach>
			</div>
			<br>
			<hr>
	    </div> <!--/ .container -->
	</div><!--/ #introwrap -->
	
	<!-- FEATURES WRAP -->
	<div id="features">
		<div class="container">
			<div class="row">
				<h1 class="centered"><cms:render value="${content.newSectionHeading}"/></h1>
				<br>
				<br>
				<div class="col-lg-6 centered">
					<cms:img width="500" style="margin-top:-20px;" class="centered" src="${content.featureImage}"/>
				</div>
				
				<div class="col-lg-6">
					<h3><cms:render value="${content.newSectionSubHeading}"/></h3>
					<br>
				<!-- ACCORDION -->
		            <div class="accordion ac" id="accordion2">
		                <c:forEach var="newItem" items="${content.newProductFeatures}" varStatus = "status">
		                <div class="accordion-group">
		                    <div class="accordion-heading">
		                        <a class="accordion-toggle" data-toggle="collapse" data-parent="#accordion2" href="#collapse${status.count}">
		                        <c:out value="${newItem.title}"/>
		                        </a>
		                    </div><!-- /accordion-heading -->
		                    <div id="collapse${status.count}" class="accordion-body collapse ${status.first ? 'in' : ''}">
		                        <div class="accordion-inner">
								<cms:render value="${newItem.description}"/>
								</div><!-- /accordion-inner -->
		                    </div><!-- /collapse -->
		                </div><!-- /accordion-group -->
		                <br>
		                </c:forEach>			
					</div><!-- Accordion -->
				</div>
			</div>
		</div><!--/ .container -->
	</div><!--/ #features -->
	
	