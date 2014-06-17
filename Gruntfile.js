module.exports = function (grunt) {
  require('time-grunt')(grunt);

  // Default task(s).
  grunt.registerTask('default', ['build']);

  // builds the project
  grunt.registerTask('build', ['bowercopy', 'clean', 'jshint', 'requirejs', 'concat:before', 'concat:scripts', 'uglify', 'less', 'copy']);

  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-requirejs');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-less');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-bowercopy');

  var projectRoot = './src/main/webapp/assets';

  // Project configuration.
  grunt.initConfig({

    pkg: grunt.file.readJSON('package.json'),

    clean: {
      all: [
        '.grunt',
        projectRoot + '/dist',
        projectRoot + '/build'
      ]
    },

    concat: {
      before: {
        src: [
          projectRoot + '/js/vendor/modernizr.js',
        ],
        dest: projectRoot + '/build/before.js',
        nonull: true
      },
      scripts: {
        src: [
          projectRoot + '/build/before.js',
          projectRoot + '/build/main.js'
        ],
        dest: projectRoot + '/build/scripts.js',
        nonull: true
      }
    },

    copy: {
      fonts: {
        files: [
          // we are relying on maven to copy the entire assets folder into the proper target
          // we need to make sure that fonts are in dist, so that the dist css refers to them relatively
          {
            expand: true,
            flatten: true,
            dest: projectRoot + '/dist/fonts',
            src:[
              projectRoot + '/fonts/**/*'
            ]
          }
        ]
      },
      less: {
        files:[
          {
            expand: true,
            flatten: true,
            dest: projectRoot + '/dist/less',
            src:[
              projectRoot + '/less/**/*'
            ]
          }
        ]
      }

    },

    uglify: {
      all: {
        options: {
          preserveComments: 'some',
          sourceMap: projectRoot + '/dist/js/scripts.js.map',
          sourceMappingURL: '/etc/clientlibs/assets/dist/js/scripts.js.map',
          sourceMapPrefix: 1
        },
        files: [{
          src: projectRoot + '/build/scripts.js',
          dest: projectRoot +'/dist/js/scripts.min.js'
        }]
      },
      modules: {
        options: {
          mangle: false,
          preserveComments: 'some'
        },
        files: [{
          expand: true,
          flatten: true,
          src: projectRoot + '/js/modules/**/*.js',
          dest: projectRoot + '/dist/js/modules/'
        }]
      }
    },

    jshint: {
      all: [
        'Gruntfile.js',
        projectRoot + '/js/**/*.js'
      ],
      options: {
        jshintrc: '.jshintrc',
        /* ignore vendor scripts */
        ignores: [
          projectRoot + '/js/vendor/**/*.js'
        ]
      }
    },

    requirejs: {
      all: {
        options: {
          name: 'vendor/require',
          include: 'main',
          baseUrl: projectRoot + '/js/',
          mainConfigFile: projectRoot + '/js/main.js',
          out: projectRoot + '/build/main.js',
          optimize: 'none',
          inlineText: true,
          stubModules: ['text'],
        }
      }
    },

    less: {
      development: {
        files: [{
          src: projectRoot + '/less/site.less',
          dest: projectRoot + '/dist/css/site.min.css'
        }],
        options: {
          compress: true,
          cleancss: true,
          sourceMap: true,
          sourceMapFilename: projectRoot + '/dist/css/site.css.map',
          sourceMapURL: '/etc/clientlibs/assets/dist/css/site.css.map'
        }
      }
    },

    mocha_phantomjs: {
      all: ['tests/**/*.html'],
      options: {
        'reporter': 'spec'
      }
    },

    /** Copies specified bower_components into our core vendor dir so we don't pollute the assets dir */
    bowercopy: {
      options: {
        srcPrefix: 'bower_components'
      },
      scripts: {
        options: {
          destPrefix: projectRoot + '/js/'
        },
        files: {
          'vendor/jquery.js'   : 'jquery/jquery.js',
          'vendor/modernizr.js': 'modernizr/modernizr.js',
          'vendor/require.js'  : 'requirejs/require.js',
          'vendor/less.js'     : 'less/dist/less-1.7.0.js',
          'vendor/bsp-utils.js': 'bsp-utils/bsp-utils.js'
        }
      }
    }

  });
};
