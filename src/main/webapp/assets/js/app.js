/**
 * This is our router.
 *
 * The function of the router is to route but not actually ineract with the DOM.
 * If a click is not supposed to just be a regular click, it will intercept that click,
 * and create history API information out of that. Out of that comes an event which
 * the controller uses to pull new data and push it into the DOM
 *
 */

/* jshint loopfunc: true */
define(function (require) {
  'use strict';

  /** requires all the different views and the mediator */
  var $         = require('jquery'),
      debug     = require('core/utilities/debug'),
      history   = require('vendor/history'),
      mediator  = require('mediator'),
      analytics = require('utilities/analytics');

  var module = {

    init: function () {
      var self = this;

      debug('APP: init');

      analytics.init();

      /* Let the app take care of hijax handling */
      if(Modernizr.history) {
        self._takeOverClickHandling();
        self._handleStateChange();
      }

    },

    /** TODO: This has to get more complicated. Add forms, submit selects, etc. Not just clicks
    might have to undo the "link" thing as well and separate into target, href, etc, since
    sometimes there won't be a link */
    _takeOverClickHandling: function() {
      var self = this;

      $(document).on('click','a',function(event) {
        var target = $(this).attr('data-target') || '',
            href = $(this).attr('href') || '',
            cqWCMDisabled = window.cqWCMDisabled || false;

        /* If we are NOT in WCM Disabled Mode, let the click go through */
        if(!cqWCMDisabled) {
          return;
        }

        /** if there is no target specified, or if cqBasePage (used for AJAX) is missing then allow the click to go through */
        if (target === '' || typeof(cqBasePage) === 'undefined') {
          return;
        }
        else {

          /** otherwise, if we have a target and we have an href, lets push this into the browser history */
          if (href) {
            History.pushState({
                target: target
            }, null, href);
          }
          else {
            debug('APP: You have target but no href so cannot do anything...');
          }

          return false;
        }
      });

      debug('ROUTER: took over click handling');
    },

    /** here is where we listen to the history change */
    _handleStateChange: function() {
      var self = this;

      History.Adapter.bind(window,'statechange',function() {

        var state = History.getState(),
        target = state.data.target;

        /** when there is a target, lets go ahead and load content into it. cleanURL is always there in history API so we dont need to check for it */
        if (target) {

          $(mediator).trigger('ajax.areaContentReadyToLoad',{
            target: state.data.target,
            href: state.cleanUrl
          });

        }
        else {
          debug('ROUTER: the state changed, which means the URL changed, but no target. Refresh to get the user on the right page');
          location.reload();
        }

      });
    }

  };

  return module;

});
