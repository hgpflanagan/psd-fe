/**
 * Throttles execution of a function.
 *
 */
(function(globals, factory) {
    if (typeof define === 'function' && define.amd) {
        define(['jquery'], factory);

    } else {
        globals.bsp_utils = globals.bsp_utils || {};
        jQuery.extend(globals.bsp_utils,factory(globals.jQuery));
    }

})(this, function($) {

  var module = {

    throttle: function(interval, throttledFunction) {
      if (interval <= 0) {
          return throttledFunction;
      }

      var lastTrigger = 0,
          timeout,
          lastArguments;

      return function() {
          lastArguments = arguments;

          // Already scheduled to run.
          if (timeout) {
              return;
          }

          var context = this,
              now = +$.now(),
              delay = interval - now + lastTrigger;

          // Waited long enough so execute.
          if (delay <= 0) {
              lastTrigger = now;
              throttledFunction.apply(context, lastArguments);

          // Schedule for later.
          } else {
              timeout = setTimeout(function() {
                  lastTrigger = now;
                  timeout = null;
                  throttledFunction.apply(context, lastArguments);
              }, delay);
          }
      };
    }
  };

  return module;

});
