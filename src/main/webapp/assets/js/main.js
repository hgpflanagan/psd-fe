/**
 * This is our main application file. Here we will define the require js config and paths to any
 * vendor files for easy reference through our site. We also pull in a private version of jquery, our
 * controller, router, and initialize those.
 *
 */
(function () {
  'use strict';

  require.config({
    name: 'main',
    insertRequire: ['main'],
    baseUrl: '/etc/clientlibs/assets/js/',

    map: {
      /** '*' means all modules will get 'jquery-private' for their 'jquery' dependency. */
      '*': {
        'jquery': 'core/vendor/jquery-private',

        /**
          TODO: fix the fact that module paths are hardcoded to `/module/` at the controller level.
          This is an aliasing hack for now to reference the modules that moved to `core/modules` properly
          so ReqJS can resolve the paths */
        'modules/affix': 'core/modules/affix',
        'modules/carousel': 'core/modules/carousel',
        'modules/modal': 'core/modules/modal',
        'modules/show-more': 'core/modules/show-more',
        'modules/social-share': 'core/modules/social-share',
        'modules/tooltip': 'core/modules/tooltip',
        'modules/tab': 'core/modules/tab',
        'modules/form-validator': 'core/modules/form-validator'

      },

      /** 'jquery-private' wants the real jQuery module though. If this line was not here, there would be an unresolvable cyclic dependency. */
      'core/vendor/jquery-private': { 'jquery': 'jquery' }
    },

    /** here we will specify simpler module names for vendor modules */
    paths: {
      /** 'royalslider'   : 'vendor/jquery.royalslider-9.5.1' */
      'jquery': 'core/vendor/jquery',
      'text': 'core/vendor/text',
      'owlCarousel': 'vendor/owl.carousel'
    },

    urlArgs: 'bust=' + (new Date()).getTime(),
    wrap: false,
  });

  /** just an example of creating dependencies to pull in all the js */
  define(function (require) {

    var $          = require('jquery'),
        controller = require('controller'),
        app        = require('app'),
        modules    = require('modules');

    $(function () {
      controller.init();
      app.init();
    });

    /** START this is test code. This is only for dev and QA to allow for easier checking of the mobile site. we cannot launch with this */
    function _crappyTempJSMobileSwitcher() {

      var localhost = window.location.hostname.indexOf('localhost'),
          author = window.location.hostname.indexOf('author1.hgtv-dev'),
          url = window.location.href,
          page, width, isMobile;

      if(localhost === -1 && author === -1) {
        return false;
      }

      isMobile = url.indexOf('.mobile.');

      width = $(window).width();

      $(window).on('resize', function() {

        var currentWidth = $(window).width();

        if (currentWidth < 767 && width > 767) {
          window.location = url.replace('.html','.mobile.html');
        }

        if (currentWidth > 767 && width < 767) {
          window.location = url.replace('.mobile','');
        }

      });

      if(width > 767 && isMobile === -1) {
        //desktop viewport and desktop page
        return false;
      }

      if(width < 767 && isMobile > -1) {
        //mobile viewport and mobile page
        return false;
      }

      if(width < 767 && isMobile === -1) {
        window.location = url.replace('.html','.mobile.html');
        return false;
      }

      if(width > 767 && isMobile > -1) {
        window.location = url.replace('.mobile','');
        return false;
      }

    }

    // _crappyTempJSMobileSwitcher();
    /** END this is test code. This is only for dev and QA to allow for easier checking of the mobile site. we cannot launch with this */

  });
}());
