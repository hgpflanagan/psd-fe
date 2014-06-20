<%@include file="header.jsp" %>

<h1 class="sg-page-header">CSS</h1>

<div class="sg-section">
    <h2 class="sg-section-header" id="">CSS Framework</h1>
    <p>As stated on our Getting Started page, our framework started with Bootstrap and it's development patters. We are also using portions of Bootstrap that work really well, such as their grid, variable structure, mixins, normalization, and some utilities. From there we fork away from it, by implementing the styles via LESS instead of by classes inside the DOM, and by creating an element and object structure that lets us write more object oriented CSS.</p>
</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">Elements</h1>
    <p>Elements are our basic building blocks of the site. These are the HTML tags and basic structure of the site. The inputs, the lists, the typography. The styles for these elements are defined in the root of our LESS folder. They aren't terribly useful on their own, but they do have properties, some basic styles, and are mostly used and built upon in bbjects. For the most part, these elemental properties shouldn't be used verbatim on the site, but should really be mixing or LESS extended onto objects. Think of these are private variables and mixins to be used in other objects. </p>
</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">Object Oriented CSS</h1>
    <p>We want to write our CSS in the most object oriented way possible. The simplest way to describe or explain this is to seperate the visual styling from the DOM markup completely, and think of each section of markup as an object. Some objects are going to be small and have just their own properties, but other objects can be complex and be extensions of other simpler objects. What this does is use the power of LESS and extends to assign visual styles from other objects onto your object vs using "cascading" of style sheets.</p>
    <p>The simplest example is a section header. When we create a section header, we should write markup that describes it as a class of "section-header". We should also write our LESS aginst that object. We shouldn't just go with a simple h2 and use the default h2 styles. If the "section-header" is supposed to receive the visual treatment of a second rate header, we can &:extend(.header2) onto it. If the SEO team deems that should be an h2 tag for SEO purposes, make it so, but still assign it the class of what the object actually is and provide it's styles inside the LESS. An example of this is the headers in the styleguide. Note the "sg-section-header" class and LESS extends used in styleguide.less.</p>
</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">Some simple rules to live by</h2>
    <ul class="sg-simple-list">
      <li><strong>Everything needs to be named</strong><p>If it has a purpose, name it with that purpose. Each styled element should be named. While we are used to styling elements like an "a", we should instead be calling it what it is, and extending the link styling onto it via LESS.</p></li>
      <li><strong>No more than 1 class name in the DOM per element</strong><p>This should be done in the LESS with extends instead. We have a class for ".header2", but your element is actually a ".article-header". Extend the ".header2" class onto your element in the LESS vs just putting a ".header2" class on your article header.</p></li>
      <li><strong>Do not nest your LESS more than 1 level in order to get around naming something correctly</strong><p>Nesting in LESS has a purpose. It is to create modifiers. Do not create so many modifiers as to get confusing, and do not create modifiers when something should be extended instead. Since we are explicitly naming things, we do not need to nest for specificity. This way things are easier to find, and you don't cascase styles as much as extend styles, so it's easy to see where your styles come from vs not really knowing. </p></li>
    </ul>
</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">Class and File naming Conventions</h2>
    <p>While some basics around coding syntax were listed <a href="index.jsp">on the Getting Started page</a>, but not around what to actually call the classes. We wanted to put some guidelines in place so when objects are named, they are easy for all developers (BE, FE, etc) to find, locate, and figure out.</p>
    <p>The template to follow for class names should be "namespace-objectType-fieldType".</p>
    <ul class="sg-simple-list">
        <li><strong>Namespace</strong><p>The namespace is an optional part of the class name, and necessary if that level of specificity is needed on a particular site of project.</p></li>
        <li><strong>Object Type</strong><p>The object type should be the next part of the CSS class name. This object type should have a relationship with a JSP renderer, an object in Brightspot, and a LESS file in the project. This will make it really easy to know when working on a JSP, where the styles for that object reside.</p></li>
        <li><strong>Field Type</strong><p>The field type should be the last part of the CSS class name. This is the field in the particular object, for example, the Title, or Description, etc etc.
    </ul>
    <p>Some examples of good class names would be "<strong>article-title</strong>", "<strong>article-subhead</strong>", "<strong>article-author</strong>".</p>
    <p>To see more examples of the proper way to name and extend elements, check out styleguide.less in assets/styles</p>
</div>

<div class="sg-section">
    <h2 class="sg-section-header" id="">More about LESS extend</h2>
    <p>Now that we are going to be using "extend" throughout the LESS, it's important to understand how it works, and how the CSS actually gets written. <a href="http://lesscss.org/features/#extend-feature" target="_blank">Some basic documentation is available on the LESS site,</a> but it's not quite clear on what the "all" options does. That option is important, as it allows the extended class to inherit all the rules of the original class, including any children classes or placements of that class inside of another. Without "all", only the base class will be used for the extension. Check out the example below:</p>

<pre class="sg-code-css">
// Without all:
<strong>LESS</strong>
.module {
    color: red;
    .bar {
        color:purple
    }
}
.rightRail .module {
    color: green;
}
.fooModule {
    &:extend(.module);
}

<strong>Compiled CSS</strong>
.module, .fooModule { color: red; }
.module .bar {color: purple; }
.rightRail .module { color: green; }


// With all:
<strong>LESS</strong>
.module {
    color: red;
}
.fooModule {
    &:extend(.module all);
}
.rightRail .module {
    color: green;
}

<strong>Compiled CSS</strong>
.module, .fooModule { color: red; }
.module .bar, fooModule .bar { color: purple; }
.rightRail .module, .rightRail .fooModule { color: green; }
</pre>

<%@include file="footer.jsp" %>
