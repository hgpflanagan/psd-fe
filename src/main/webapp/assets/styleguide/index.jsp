<%@include file="header.jsp" %>

<h1 class="docs-page-header">Getting Started</h1>

<div class="docs-section">
    <h2 class="docs-section-header" id="Introduction">Introduction</h1>
    <p>In this section we will outline our FE development approach.</p>
</div>

<div class="docs-section">
    <h2 class="docs-section-header" id="Methodology">Methodology</h1>
    <p>The main guiding principle of our approach was writing clean reusable code and allowing front end and back end developers to create reusable objects without having to write a lot of extraneous CSS or JS. We adopted some of the theories of <a href="http://bradfrostweb.com/blog/post/atomic-web-design/" target="_blank">Brad Frost's Atomic Design</a> to accomplish this. While we are not using Atomic Design exactly as outlined, as we skip a few of the steps, the principles of relying on basic building blocks (Atoms or Elements) which put together create Objects still hold true.</p>
</div>

<div class="docs-section">
    <h2 class="docs-section-header" id="CSS Framework">CSS Framework</h1>
    <p>We started out this by taking the Bootstrap framework and relying on it’s development patterns. Bootstrap is a very well known framework and they have lots of structure and naming schemes in their code, which give us a solid foundation. What we did not want to do was to write styles on top of Bootstrap, as that would lead to code bloat, so we replaced a lot of the styles of Bootstrap with our own.</p>

    <p>We are relying on their foundation and development patterns, but inserting our own efficient code which conforms to the styles and guidelines presented by the design team. </p>

    <p>Another place where we take a fork in the road away from Bootstrap is in the implementation of the styles and classes into the DOM. While Bootstrap relies on classname modifiers, we instead use the power of LESS extends to take a more object oriented approach to our CSS. We created some simple guidelines on how to use and apply this and we go more in depth <a href="css.jsp">on our CSS page</a></p>
</div>

<div class="docs-section">
    <h2 class="docs-section-header" id="JS Framework">JS Framework</h1>
    <p>Since different sites and user interfaces have different JS needs, we do not try to specify exactly how you should setup your own application JS. Instead, we provide a format to create and use Brightspot (and other AMD) and plugins. Most of our sites do not need a JS framework to handle MVC, as that is provided by Brightspot and the JS is only responsible for view interactions, and not the data, or rendering. <a href="https://github.com/perfectsense/brightspot-js-utils/blob/master/PLUGIN.md" target="_blank">The Brightspot Plugin</a> allows your JS plugins to be installed, instantiated, and executed against the part of the DOM to which your plugin belongs. A plugin can be something as small as piece of JS that interacts with a form element to expand inputs, or as large as an entire slideshow or gallery.</p>
</div>

<div class="docs-section">
    <h2 class="docs-section-header" id="Code Style and Convention">Code Style and Convention</h1>
    <p>All the team members agreed on using the following code styles and conventions. Your IDE should be configured to follow these settings. You can use <a href="http://editorconfig.org/" target="_blank">editorConfig</a> to help, which you can install into the IDE of your choice. The .editorconfig file is already checked into source control at the root. </p>

    <p>It may also be helpful to install a JSHint/JSLint plugin and that will honor the .jshintrc file at the root of the -view folders. The Grunt build will catch them after the fact during a build, therefore you can break the build if you don't adhere to the linter's config.</p>

    <h3 class="docs-section-subhead">All</h3>
    <ul class="docs-simple-list">
        <li>spaces instead of tabs</li>
        <li>2 spaces for indentation</li>
    </ul>

    <h3 class="docs-section-subhead">CSS</h3>
    <ul class="docs-simple-list">
        <li>train-case for classnames</li>
        <li>property and value should have a single space separating them. eg {color: red}, not {color:red}</li>
        <li>commenting should follow the pattern that Bootstrap uses</li>
        <li>further conventions describing class name patterns are on the <a href="css.jsp">CSS page</a></li>
    </ul>

    <h3 class="docs-section-subhead">JS</h3>
    <ul class="docs-simple-list">
        <li>camelCase for variable names and plugins</li>
        <li>commenting should follow <a href="http://usejsdoc.org/" target="_blank">JSDoc patterns</a></li>
    </ul>

    <h3>General Best Practices</h3>
    <p>Please write self commenting code when possible. It's important not to "pre-minify" your code by shortening names, methods, and variables to the point where they are unreadable. JS Uglify comes in during the build process and will minify your code for you. Name variables according to what they are, and name functions according to what they do. Only use shortcuts in your code when it's absolutely required. It's a lot easier to read a full if/then statement than ? :.</p>
    <p>Commenting should strive to explain the "why" not the "what". For example, if you are looping over a collection of DOM nodes to attach a JS function onclick, your comment:</p>
    <p>should not be: <span class="s">/** looping over DOM nodes and attaching onclick */</span></p>
    <p>it should instead be: <span class="s">/** loading more images should be done lazily. So, if the user clicks on these nodes, we request the next set. */ </span></p>
</div>

<%@include file="footer.jsp" %>
