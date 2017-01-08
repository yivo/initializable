gulp    = require 'gulp'
concat  = require 'gulp-concat'
coffee  = require 'gulp-coffee'
iife    = require 'gulp-iife-wrap'
plumber = require 'gulp-plumber'

gulp.task 'default', ['build'], ->

gulp.task 'build', ->
  gulp.src('source/initializable.coffee')
  .pipe plumber()
  .pipe iife(global: 'Initializable', dependencies: [{global: 'Object', native: true}])
  .pipe concat('initializable.coffee')
  .pipe gulp.dest('build')
  .pipe coffee()
  .pipe concat('initializable.js')
  .pipe gulp.dest('build')
