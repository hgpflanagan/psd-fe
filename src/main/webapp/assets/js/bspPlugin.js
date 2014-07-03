(function(globals, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery','domUtils'], factory);

    } else {
        // if we are not in AMD world, create or extend the bsp_utils namespace with these functions
        globals.bsp_utils = globals.bsp_utils || {};
        jQuery.extend(globals.bsp_utils,factory(globals.jQuery, globals.bsp_utils));
    }

})(this, function($, domUtils) {

    // either pulls in window.bsp_utils or creates a new object
    // this object is used to allow this module to work as a non AMD module if bsp_utils
    // is declared globally and dependency management is done through compiling JS together
    var bsp_utils = window.bsp_utils || {};

    // adds domUtils into the bsp_utils namespace
    // dont really like this too much but this supports use in non AMD use cases
    $.extend(bsp_utils,domUtils);

    var NOT_WHITE_RE = /\S+/g;
    var OPTIONS_DATA_KEY = '_options';

    var $d = $(document);

    var module = {

      plugin:function(globals, namespace, name, actions) {
        var plugin = actions || { };

            plugin._name = namespace + '_' + name;

            plugin._classNamePrefix = namespace + '-' + name + '-';
            plugin._rootClassName = plugin._classNamePrefix + 'root';
            plugin._itemClassName = plugin._classNamePrefix + 'item';

            // Event handling.
            function renameEvents(events) {
                return $.map(events.match(NOT_WHITE_RE), function(s) {
                    return s + '.' + plugin._name;
                }).join(' ');
            }

            plugin._on = function(elements, events, selectorOrHandler, dataOrHandler, handler) {
                var $elements = $(elements);
                events = renameEvents(events);

                if (handler) {
                    $elements.on(events, selectorOrHandler, dataOrHandler, handler);

                } else if (dataOrHandler) {
                    $elements.on(events, selectorOrHandler, dataOrHandler);

                } else {
                    $elements.on(events, selectorOrHandler);
                }
            };

            plugin._off = function(elements, events, selector) {
                var $elements = $(elements);

                if (selector) {
                    $elements.off(renameEvents(events), selector);

                } else if (events) {
                    $elements.off(renameEvents(events));

                } else {
                    $elements.off('.' + plugin._name);
                }
            };

            // Private data.
            plugin._dataKeyPrefix = namespace + '-' + name + '-';

            plugin._data = function(elements, key, value) {
                var $elements = $(elements);

                if ($elements.length === 0) {
                    return null;

                } else {
                    key = plugin._dataKeyPrefix + key;

                    if (value === undefined) {
                        return $.data($elements[0], key);

                    } else {
                        return $elements.each(function() {
                            $.data(this, key, value);
                        });
                    }
                }
            };

            // Options.
            plugin.option = function(elements, key, value) {
                var plugin = this;

                if (typeof key === 'undefined') {
                    return plugin._data(elements, OPTIONS_DATA_KEY) || { };

                } else if (typeof value === 'undefined') {
                    return (plugin._data(elements, OPTIONS_DATA_KEY) || { })[key];

                } else {
                    $(elements).each(function() {
                        var options = plugin._data(this, OPTIONS_DATA_KEY);

                        if (!options) {
                            options = { };
                            plugin._data(this, OPTIONS_DATA_KEY, options);
                        }

                        options[key] = value;
                    });

                    return null;
                }
            };

            plugin._attrName = 'data-' + namespace + '-' + name;
            plugin._attrNamePrefix = plugin._attrName + '-';
            plugin._optionsAttrName = plugin._attrNamePrefix + 'options';

            function updateOptions($element, parentOptions) {
                var elementOptions = $element.attr(plugin._optionsAttrName);

                plugin._data($element[0], OPTIONS_DATA_KEY, elementOptions ?
                        $.extend(true, { }, parentOptions, $.parseJSON(elementOptions)) :
                        parentOptions);
            }

            // Initialization.
            plugin.live = function(roots, selector, options) {
                var $roots = $(roots);

                if ($roots.length === 0) {
                    return;
                }

                // Update root options.
                $roots.each(function() {
                    var $rootElement = this.nodeType === 9 ? $(this.documentElement) : $(this);

                    $rootElement.addClass(plugin._rootClassName);
                    updateOptions($rootElement, $.extend(true, { }, plugin._defaultOptions, options));
                });

                var init = plugin._init;
                var each = plugin._each;
                var all = plugin._all;

                if (init) {
                    init.call(plugin, $.makeArray($roots), selector);
                }

                if (each || all) {
                    if (selector) {

                        bsp_utils.onDomInsert($.makeArray($roots), selector, {
                            'insert': function(item) {
                                var $item = $(item);
                                var rootOptions = plugin.option($item.closest('.' + plugin._rootClassName));

                                $item.addClass(plugin._itemClassName);
                                updateOptions($item, rootOptions);

                                if (each) {
                                    each.call(plugin, item);
                                }
                            },

                            'afterInsert': !all ? $.noop : function(items) {
                                all.call(plugin, items);
                            }
                        });
                    }
                }
            };

            plugin.init = function(elements, options) {
                plugin.live(elements, null, options);
            };

            // One-time installation callback.
            if (plugin._install) {
                plugin._install();
            }

            // Automatically initialize.
            $d.ready(function() {
                plugin.live(document, '[' + plugin._attrName + ']');
            });

            if (globals) {
                globals[plugin._name] = plugin;
            }

            return plugin;
      }

    }

    return module;

});
