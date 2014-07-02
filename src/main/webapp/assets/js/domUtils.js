/**
 * Detects inserts into the DOM.
 *
 */
(function(globals, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery','throttleUtils'], factory);

    } else {
        globals.bsp_utils = globals.bsp_utils || {};
        jQuery.extend(globals.bsp_utils,factory(globals.jQuery, globals.bsp_utils));
    }

})(this, function($, bsp_utils) {

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
