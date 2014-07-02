/**
 * Detects inserts into the DOM.
 *
 */
(function(globals, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery','throttleUtils'], factory);

    } else {
        // if we are not in AMD world, create or extend the bsp_utils namespace with these functions
        globals.bsp_utils = globals.bsp_utils || {};
        jQuery.extend(globals.bsp_utils,factory(globals.jQuery, globals.bsp_utils));
    }

})(this, function($, throttleUtils) {

    // either pulls in window.bsp_utils or creates a new object
    // this object is used to allow this module to work as a non AMD module if bsp_utils
    // is declared globally and dependency management is done through compiling JS together
    var bsp_utils = window.bsp_utils || {};

    // adds domUtils into the bsp_utils namespace
    // dont really like this too much but this supports use in non AMD use cases
    $.extend(bsp_utils,throttleUtils);

    var module = {

      domUtilInit: function() {

        var self = this;

        self.domInserts = [ ];
        self.insertedClassNamePrefix = 'bsp-onDomInsert-inserted-';
        self.insertedClassNameIndex = 0;

        // Try to detect DOM mutations efficiently.
        var mutationObserver = window.MutationObserver || window.WebKitMutationObserver;

        function redoAllDomInserts() {
            $.each(self.domInserts, function(i, domInsert) {
                self.doDomInsert(domInsert);
            });
        }

        if (mutationObserver) {
            new mutationObserver(bsp_utils.throttle(1, redoAllDomInserts)).observe(document, {
                'childList': true,
                'subtree': true
            });

        // But if not available, brute-force it.
        } else {
            setInterval(redoAllDomInserts, 1000 / 60);
        }

      },

        // Execute all callbacks on any new elements.
       doDomInsert: function(domInsert) {
            var insertedClassName = domInsert.insertedClassName;
            var $items = domInsert.$roots.find(domInsert.selector).filter(':not(.' + insertedClassName + ')');

            if ($items.length > 0) {
                $items.addClass(insertedClassName);

                var callbacks = domInsert.callbacks;
                var beforeInsert = callbacks.beforeInsert;
                var insert = callbacks.insert;
                var afterInsert = callbacks.afterInsert;

                if (beforeInsert) {
                    beforeInsert($.makeArray($items));
                }

                if (insert) {
                    $items.each(function() {
                        insert(this);
                    });
                }

                if (afterInsert) {
                    afterInsert($.makeArray($items));
                }
            }
        },

        onDomInsert: function(roots, selector, callbacks) {
            var self = this,
                insertedClassName = self.insertedClassNamePrefix + self.insertedClassNameIndex;

            ++ self.insertedClassNameIndex ;

            console.log(self);

            var domInsert = {
                '$roots': $(roots),
                'insertedClassName': insertedClassName,
                'selector': selector,
                'callbacks': callbacks
            };

            // Execute callbacks on already existing elements first.
            $(document).ready(function() {
                self.doDomInsert(domInsert);
            });

            self.domInserts.push(domInsert);
        }
    }

    module.domUtilInit();

    return module;

  });
