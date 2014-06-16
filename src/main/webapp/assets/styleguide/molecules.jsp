<%@include file="header.jsp" %>

<h1 class="docs-page-header">Objects</h1>

<div class="docs-section">
    <h2 class="docs-section-header" id="">Block</h1>
    <p>A block is comprised of an image or video asset along with an optional title, description, and detail text. This media block is used throughout the site either as a standalone element (single photo asset, or combined to form other objects on the homepage, search results grid, and single photo asset collections.</p>

    <p>By default an media block has the title, description, and detail text underneath the image. It can also receive modifications to apply styles such as text overlays, alignment, and image fading. It also expands to the size of it's container. When combined into an organism, the organism can choose to align the image blocks however it sees fit.</p>

    <div class="docs-example">

        <div class="docs-block">
          <div class="block-media">
            <a href="#"><img src="http://placehold.it/202x150"></a>
          </div>
          <div class="block-text">
            <a href="#"><h4 class="block-text-primary">Primary Text</h4></a>
            <p class="block-text-secondary">Secondary Text</p>
          </div>
        </div>

        <div class="docs-block-text-right">
          <div class="block-media">
            <a href="#"><img src="http://placehold.it/202x150"></a>
          </div>
          <div class="block-text">
            <a href="#"><h4 class="block-text-primary">Primary Text</h4></a>
            <p class="block-text-secondary">Secondary Text</p>
          </div>
        </div>

    </div>
</div>


<%@include file="footer.jsp" %>
