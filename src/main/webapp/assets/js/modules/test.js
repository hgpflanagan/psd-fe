(function(globals, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery','bsp-utils'], factory);

    } else {
        globals.bsp_utils = globals.bsp_utils || {};
        jQuery.extend(globals.bsp_utils,factory(globals.jQuery, globals.bsp_utils));
    }

})(this, function($, bsp_utils) {

    var module = {

      '_install': function() {
            var plugin = this;

            console.log('TEST: ----_install------------------');
            console.log('This gets called whenever the plugin is installed, which means as soon as bsp_utils.plugin() is called. This could be before doc ready.');
        },

        '_init': function(document, selector) {
            var plugin = this;

            console.log('TEST: ----_init------------------');
            console.log('This gets called whenever the plugin is actually initialized by bsp-utils after document ready. This will get the DOM and the selector via which you could try to reference your module.');
            console.log(document);
            console.log(selector);
        },

        '_each': function(item) {

            console.log('TEST: ----_each------------------');
            console.log('This gets called whenever the plugin is actually called PER ELEMENT. It gets passed the actual DOM element.');
            console.log(item);

            $(item).text('Look at me, I\'m a test plugin!');

        },

        '_all': function(items) {

            console.log('TEST: ----_all------------------');
            console.log('This gets called whenever the plugin is actually called, but once, after all of the _eaches are done. It gets passed an array of DOM element.');
            console.log(items);
        },
    };

    return bsp_utils.plugin(false, 'namespace', 'testPlugin', module);

});
