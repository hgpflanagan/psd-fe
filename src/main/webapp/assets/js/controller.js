/**
 * This is our main application controller
 *
 * The controller is responsible for areas and modules. When the page is first is loaded it will scan the DOM
 * looking for modules, require them and initialize them with their elements passed in. We are relying on the
 * modules module to include all the modules we know we will want compiled, so that the require optimizer can
 * pick them up. That way, when the controller requires the indiviual modules, they are precompiled. If we have
 * some modules that are going to be on a very small area of the site, we can choose not to precompile them
 * this way, and require should then lazy load our JS.
 *
 * An area is a piece of the page that can be targeted with content. If a link targeting an area exists, the router
 * intercept that click and kick off an event. The controller is then listening for that, AJAXing the content,
 * initilizing the modules in that new context, and then dumping it back into the DOM. It communicates back
 * to the router with an event to tell it that its done, so we can add the action back into the history.
 *
 */

/* jshint loopfunc: true */
define(function (require) {
  'use strict';

  var $           = require('jquery'),
      mediator    = require('mediator'),
      debug       = require('core/utilities/debug'),
      metadata    = require('utilities/metadata'),
      loadingHTML = require('text!templates/loading.jst');

  var module = {

    /**
     * Default init function. Gets called by app.js
     *
     * @public
     */
    init: function () {
      var self = this;
      debug('CONTROLLER: init');

      /** when we init the application go through and initialize any modules */
      self.initializeModules($(document), {skipDeferred:true} );

      /** the router will trigger this when a link is intercepted and we should load content via AJAX */
      $(mediator).on('ajax.areaContentReadyToLoad', function(event, data) {
        self._loadAreaContent(data);
      });

      /** other modules can instruct the controller to initialize modules via event or public API. If we standardize on event it will allow other things to listen if they need to */
      $(mediator).on('controller.initModules', function(event, data) {
        var $context = '';

        if (data) {
          $context = data.$context || '';
        }

        self.initializeModules($context);
      });
    },

    /**
     * Public API to initialize modules via context. This can be used directly, but the controller also listens for a
     * mediator event and when triggered, it will try to pull in the modules within the context provided
     *
     * @public
     */
    initializeModules: function($context, options) {
      var self = this,
          /** go through the context we have been provided and get all modules */
          contextModules = self._getModules($context, options);

      /** go through those modules */
      for (var module in contextModules) {

        /** Require.js is used to retrieve the modules and initialize them by passing them a DOM ref. It will either dynamically fetch the JS, or if the module has been added to the application as a dependency, it already exists and therefore bypasses the need for a network request. */
        (function(module) {
          /** We need to preserve the current value of 'module' so a new function scope is needed */
          require(['modules/' + module], function(theModule) {
            // always execute the init() for modules first
            // as long as the module exists
            if (contextModules[module]){
              theModule.init(contextModules[module]);
            }
          });
        })(module);

      }
    },

    _loadAreaContent: function(data) {
      var self = this,
          target = data.target || '',
          $target = $(document).find('div.area[data-sni-area=' + target + ']'),
          href =  data.href || '',
          targetType = $target.attr('data-sni-area-type') || 'replace',
          $savingOldContent = '',
          ajaxURL = '';

      /** if we have no link or href or target, something bad happened so get out */
      if (!href || !target) {
        debug('CONTROLLER: href and target not provided correctly, aborting...')
        return false;
      }

      /** if we have no target, go ahead and create one at the end of the document */
      if (!$target.length) {
        $target = $('<div class="area" data-sni-area="' + target + '"></div>').appendTo('body');
      }

      /** allow CSS to manage loaded states */
      $target.removeClass('loaded').addClass('loading');

      /** add the HTML5 friendly loading HTML */
      if(targetType === 'replace') {
        scrollTo(0,0);
        $target.html(loadingHTML);
        $savingOldContent = $target;
      } else {
        $target.append(loadingHTML);
      }

      /** trigger mediator event that we are about to start loading content */
      $(mediator).trigger('ajax.areaContentLoading', {
        target : target
      });

      /** we have to clean the URL from the href to get it ready for CQ */
      ajaxURL = self._cleanURLForCQ(href, target);

      /** TODO: Add graceful error handling */
      $.ajax({
        'cache': false,
        'url': ajaxURL + '?wcmmode=disabled',
        'complete': function(data) {
          self._areaContentLoaded({
            target: target,
            href: href,
            content: data.responseText
          });
        },
        'error' : function() {
          // if there was some weird error, put the content back
          if(targetType === 'replace') {
            self._areaContentError({
              target: target,
              href: href,
              content: $savingOldContent
            });
          }
        }
      });

    },

    /**
     * CQ cannot handle querystrings, so we have to clean the URL and get it ready for CQ
     * We need to insert .mobile selector and also the target as a selector. A bit dirty, but
     * this is required because of CQ
     */
    _cleanURLForCQ: function(url, target) {
      var cleanURL,
          relativePath;

      url = url.split(window.location.host)[1];

      if(window.cqMobile) {
        target += '.mobile';
      }

      if(cqBasePage.indexOf('.html') > -1) {
        cleanURL = cqBasePage.replace('.html','.' + target + '.html');
      }
      else {
        cleanURL = cqBasePage + '.' + target;
      }

      relativePath = url.replace(cqBasePage,'');
      cleanURL = cleanURL + relativePath;

      return cleanURL;
    },

    _areaContentError: function(data) {
      var self = this;

      $(mediator).trigger('ajax.areaContentError', data);
      debug('CONTROLLER: Error with the ajax on: ' + data.target);
    },

    _areaContentLoaded: function(data) {
      var self = this;

      /** add data into DOM, take care of Metrics, and trigger event that we are done */

      /** make sure we have content first */
      if (data.content) {
        self._insertAreaContentIntoDOM(data);
        $(mediator).trigger('ajax.areaContentLoaded', data);
        debug('CONTROLLER: areaContentLoaded: ' + data.target);
      }
      else {
        debug('CONTROLLER: Error. Ajax came through but no data for: ' + data.target);
      }
    },

    _updateMetrics: function(content) {
      var self = this,
          mdmData = $(content).data('mdm') || false;

      if(mdmData) {
        metadata.updateFromString(mdmData);
      }
      else {
        debug('CONTROLLER: Hijax MDM data missing');
      }
    },

    /**
     * This function inserts what data we have into the DOM properly. It has a metrics function that it triggers as well.
     * I didnt totally separate the metrics here so I woudnt have to perform the same target logic again
     */
    _insertAreaContentIntoDOM: function(data) {
      var self = this,
          $target,
          content,
          $context,
          targetType;

      /** have to clean up the CQ content that comes back. Need to wrap it with a div and then find the actual area we wanted inside of it, and THEN grab its content Ugh */
      content = $('<div>').html(data.content);
      content = $(content).find('div.area[data-sni-area=' + data.target + ']').html();

      /** look for the target in the current DOM */
      $target = $(document).find('div.area[data-sni-area=' + data.target + ']');
      /** figure out what type of target we have. We can either replace, append, or modal */
      targetType = $target.attr('data-sni-area-type') || 'replace';

      /** handle removing of the loading dots and loading classes. We are about to drop content and walk away */
      $target.removeClass('loading').addClass('loaded');
      $target.find('#loadingdot').remove();

      /**
       * Check target type. If we are supposed to append, append only if no type, we default to replace
       * Either way, make sure to only grab the inner HTML of the content we got back.
       * We do not want the whole container so .html() is required by CQ as it returns us everything including the outside area
       */
      if (targetType === 'append') {
        $context = $target.append(content);
      }
      else {
        $context = $target.html(content);

        /** POSSIBLE TO DO: Remove into its own logic */
        self._updateMetrics(data.content);
      }


      self.initializeModules($context, {skipDeferred:true});

    },

    _getModules: function($context, options) {
      /** find any modules that exist in the context provided (or document) This code is originaly written by Olivia and its being lifted as it works great */
      $context = $context || $(document),
      options = options || {};

      debug('CONTROLLER: getting modules in context');

      var self = this,
          modules = $context.find('[data-sni-module]'),
          i = modules.length,
          moduleName,
          deferred,
          skip,
          contextModules = {};

      /** this helper function pushes into one of the objects that we setup in the beginning depending on context. This is where the beauty lies, as there is a single instance of each module name but it may have an array of elements if there is more than one element per module */
      function addToPageModules(modName, elem) {
        if (contextModules[modName]) {
          contextModules[modName].push(elem);
        } else {
          contextModules[modName] = [elem];
        }
      }

      /** get the data-sni-module info and whether its deferred or not*/
      while (i--) {
        moduleName = modules[i].getAttribute('data-sni-module');
        deferred = modules[i].getAttribute('data-sni-module-defer');
        skip = false;

        /** if we are supposed to skip deferred and its a module that is deferred, please skip */
        if(options.skipDeferred) {
          if(deferred) {
            skip = true;
          }

          /** if we are inside of a module that is deferring, we do not want to call ourselves either */
          if($(modules[i]).closest('[data-sni-module-defer="true"]').length > 0) {
            skip = true;
          }
        }

        /** if we are to skip deferred modules, and a module marks itself as deferred, please skip */
        if(!skip) {
          /** multiple modules are allowed on one element: data-sni-module="module1, module2"  */
          if (/,/.test(moduleName)) {
            var arr = moduleName.replace(' ', '').split(',');
            arr.forEach(function (str) {
                addToPageModules(str, modules[i]);
            }, this)
          } else {
            addToPageModules(moduleName, modules[i]);
          }
        }
      }

      return contextModules;
    }

  };

  return module;

});
