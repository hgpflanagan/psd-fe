module.exports = function(grunt) {

  var projectRoot = '/src/main/assets';

  require('bsp-grunt')(grunt, {
    bsp: {

      bower: {
        'modernizr': [
          'modernizr.js'
        ]
      },

      styles: {
        dir: '/assets/styles',
          less: [
            'site.less',
              'styleguide.less'
          ]
      },

      scripts: {
        dir: 'assets/js',
        rjsConfig: 'main.js',
        jshintrc: '.jshintrc'
      }
    }

  });

}
