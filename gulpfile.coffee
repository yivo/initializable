gulp    = require 'gulp'
concat  = require 'gulp-concat'
coffee  = require 'gulp-coffee'
umd     = require 'gulp-umd-wrap'
plumber = require 'gulp-plumber'
fs      = require 'fs'

gulp.task 'default', ['build', 'watch'], ->

gulp.task 'build', ->
  gulp.src('source/initializable.coffee')
    .pipe plumber()
    .pipe umd do ->
                global:       'Initializable'
                dependencies: [{global: 'Object', native: true}]
                header:       fs.readFileSync('source/__license__.coffee')
    .pipe concat('initializable.coffee')
    .pipe gulp.dest('build')
    .pipe coffee()
    .pipe concat('initializable.js')
    .pipe gulp.dest('build')

gulp.task 'watch', ->
  gulp.watch 'source/**/*', ['build']
