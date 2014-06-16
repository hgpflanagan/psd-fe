/**
 *  This JS is what we will use to precompile our modules
 *  for most cases, we will list our modules here as we want to precompile most everything
 *  only in exception cases, will we allow for dynamic loading of modules and other assets
 */

define(function (require) {
  'use strict';

  var affix        = require('core/modules/affix'),
      carousel     = require('core/modules/carousel'),
      modal        = require('core/modules/modal'),
      showMore     = require('core/modules/show-more'),
      socialShare  = require('core/modules/social-share'),
      tooltip      = require('core/modules/tooltip'),
      tab          = require('core/modules/tab'),
      photoGrid    = require('modules/photo-library-grid'),
      photoOverlay = require('modules/photo-gallery');

  return this;
});
