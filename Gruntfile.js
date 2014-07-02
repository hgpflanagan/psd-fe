module.exports = function(grunt) {

  var projectRoot = '/src/main/assets';

  require('bsp-grunt')(grunt, {
    bsp: {

      bower: {
        'components-font-awesome':
        [{
          src:'less/*',
          dest:'/assets/styles/font-awesome',
          expand:true,
          flatten: true
        },
        {
          src:'fonts/*',
          dest:'/assets/fonts',
          expand:true,
          flatten: true
        }]
      },

      styles: {
        dir: 'assets/styles',
        less: [
            'site.less',
            'styleguide.less'
        ],
        autoprefixer: false
      },

      scripts: {
        dir: 'assets/js',
        rjsConfig: 'main.js',
        jshintrc: '.jshintrc'
      }
    }

  });

}
