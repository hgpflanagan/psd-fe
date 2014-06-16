<%@include file="header.jsp" %>

<h1 class="page-header">CSS</h1>

<div class="docs-section">
    <h2 id="CSS Framework">CSS Framework</h1>
    <p>We started out this by taking the Bootstrap framework and relying on it’s development patterns. Bootstrap is a very well known framework and they have lots of structure and naming schemes in their code, which give us a solid foundation. What we did not want to do was to write styles on top of Bootstrap, as that would lead to code bloat, so we replaced a lot of the styles of Bootstrap with our own.</p>

    <p>We are relying on their foundation and development patterns, but inserting our own efficient code which conforms to the styles and guidelines presented by the design team. </p>

    <p>Another place where we take a fork in the road away from Bootstrap is in the implementation of the styles and classes into the DOM. While Bootstrap relies on classname modifiers, we instead use the power of LESS extends to take a more object oriented approach to our CSS. We created some simple guidelines on how to use and apply this and we go more in depth <a href="css.jsp">on our CSS page</a></p>
</div>


<%@include file="footer.jsp" %>
