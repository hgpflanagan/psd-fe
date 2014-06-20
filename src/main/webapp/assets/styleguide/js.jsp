<%@include file="header.jsp" %>

<h1 class="sg-page-header">JS</h1>

<div class="sg-section">
    <h2 class="sg-section-header" id="">JS Framework</h1>

    <p>Since different sites and user interfaces have different JS needs, we do not try to specify exactly how you should setup your own application JS. Instead, we provide a format to create and use Brightspot (and other AMD) and plugins. Most of our sites do not need a JS framework to handle MVC, as that is provided by Brightspot and the JS is only responsible for view interactions, and not the data, or rendering. <a href="https://github.com/perfectsense/brightspot-js-utils/blob/master/PLUGIN.md" target="_blank">The Brightspot Plugin</a> allows your JS plugins to be installed, instantiated, and executed against the part of the DOM to which your plugin belongs. A plugin can be something as small as piece of JS that interacts with a form element to expand inputs, or as large as an entire slideshow or gallery.</p>

</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">RequireJS</h1>

    <p>While the BSP Plugin and utilities are supported and can be used without an AMD loader, it's a much better idea to use one. We like to use RequireJS as it's easy to use and widely supported. With RequireJS, AMD, and BSP Plugins, you'll be able to create efficent and clean modular code which executes when it needs to and doesn't pollute pages otherwise. We can also promote code reuse, as we can Require pre-written plugins as dependencies of our application, or our own plugins. </p>

    <p>An example of RequireJS is included in the base project and we'll go over the pieces here. </p>

    <h3 class="sg-section-subhead">main.js</h3>
    <ul class="sg-simple-list">
        <li>The main file that sets up our application and it's dependencies</li>
        <li>Used by the Require Optimizer that is part of our Grunt build to compile the single script file</li>
        <li>By default we map to a private jquery which will only be used in our application.</li>
        <li>As an example, we pull in jQuery (mediator.js) and any modules (modules.js) that are used in the entire application</li>
    </ul>

    <h3 class="sg-section-subhead">modules.js</h3>
    <ul class="sg-simple-list">
        <li>This file lists as dependencies any modules that we want to compile into our single script file</li>
        <li>If a module/plugin is explicitly required by our application (main.js requires modules.js which requires these modules) the Require Optimizer will compile that file into our single script</li>
        <li>if we do not specify a module/plugin here, but we require it later insize a different plugin, RequireJS will dynamically load that JS</li>
        <li>Best practice should be that any plugins/modules that are used should be listed in here, and we should not dynamically load JS unless it has a positive impact on whole site performance</li>
    </ul>

    <h3 class="sg-section-subhead">mediator.js</h3>
    <ul class="sg-simple-list">
        <li>Just an empty object that is our "global namespace". </li>
        <li>We can pass global events, as well as store global data in the mediator.</li>
        <li>By defauly, plugins and modules only know about themselves and their DOM. We do not want to attach data or events globally or to the window, so we can use the mediator as an AMD module that others can require when they want to know something about the global scope.</li>
    </ul>

</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">JS Plugin Example</h1>

    <p>We provided documentation inside the test plugin located in js/modules/test.js. To see the test plugin in action, open your console</p>

    <div class="sg-hs-module" data-namespace-testPlugin></div>
    <div class="sg-hs-module" data-namespace-testPlugin></div>
</div>


<%@include file="footer.jsp" %>
