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
    baseUrl: '/assets/js/',

    map: {
      /** '*' means all modules will get 'jquery-private' for their 'jquery' dependency. */
      '*': {
        'jquery': 'jquery-private',
      },

      /** 'jquery-private' wants the real jQuery module though. If this line was not here, there would be an unresolvable cyclic dependency. */
      'jquery-private': { 'jquery': 'jquery' }
    },

    urlArgs: 'bust=' + (new Date()).getTime(),
    wrap: false,
  });

  /** just an example of creating dependencies to pull in all the js */
  define(function (require) {

    var $         = require('jquery'),
        mediator  = require('mediator'),
        modules   = require('modules');

  });
}());
