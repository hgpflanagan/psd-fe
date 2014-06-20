<%@include file="header.jsp" %>

<h1 class="docs-page-header">JS</h1>

<div class="docs-section">
    <h2 class="docs-section-header" id="">JS Framwork</h1>

    <p>Since different sites and user interfaces have different JS needs, we do not try to specify exactly how you should setup your own application JS. Instead, we provide a format to create and use Brightspot (and other AMD) and plugins. Most of our sites do not need a JS framework to handle MVC, as that is provided by Brightspot and the JS is only responsible for view interactions, and not the data, or rendering. <a href="https://github.com/perfectsense/brightspot-js-utils/blob/master/PLUGIN.md" target="_blank">The Brightspot Plugin</a> allows your JS plugins to be installed, instantiated, and executed against the part of the DOM to which your plugin belongs. A plugin can be something as small as piece of JS that interacts with a form element to expand inputs, or as large as an entire slideshow or gallery.</p>

</div>

<div class="docs-section">
    <h2 class="docs-section-header" id="">JS Plugin Example</h1>

    <p>To see the test plugin in action, open your console</p>
    <div class="docs-hs-module" data-namespace-testPlugin>First element that has test JS plugin</div>
    <div class="docs-hs-module" data-namespace-testPlugin>Second element that has test JS plugin</div>
</div>


<%@include file="footer.jsp" %>
