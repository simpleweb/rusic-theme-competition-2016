gulp = require("gulp")
gutil = require("gulp-util")
_ = require('lodash')
sass = require('gulp-ruby-sass')
coffee = require("gulp-coffee")
concat = require('gulp-concat')
livereload = require('gulp-livereload')
uglify = require('gulp-uglify')
gulpFilter = require('gulp-filter')
prefix = require('gulp-autoprefixer')

paths = {
  output: "assets"
  coffee: "coffee/**/*.coffee"
  sass: "scss/style.scss"
  js: "js/**/*.js"
  vendorJS: [
    "components/clipboard/dist/clipboard.js"
  ]
  vendorCSS: [
  ]
}

gulp.task "scripts", ->
  combinedFiles = _.flatten([
    paths.vendorJS
    paths.js
    paths.coffee
  ])

  coffeeFilter = gulpFilter("**/*.coffee")

  gulp
    .src(combinedFiles)
    .pipe(coffeeFilter)
    .pipe(coffee().on('error', gutil.log))
    .pipe(coffeeFilter.restore())
    .pipe(concat("script.js"))
    .pipe(uglify())
    .pipe gulp.dest( paths.output )

gulp.task "styles", ->

  combinedFiles = _.flatten([
    paths.vendorCSS
    paths.sass
  ])

  scssFilter = gulpFilter("**/*.scss")

  gulp
    .src(combinedFiles)
    .pipe(scssFilter)
    .pipe(sass({
      style: "compressed"
    }))
    .pipe(scssFilter.restore())
    .pipe(concat("style.css"))
    .pipe(prefix())
    .pipe gulp.dest( paths.output )

gulp.task "watch", ->

  gulp.watch [
    paths.vendorJS
    paths.js
    paths.coffee
  ], ["scripts"]

  gulp.watch [
    paths.vendorCSS
    "**/*.scss"
  ], ["styles"]

gulp.task "build", ["scripts", "styles"]
gulp.task "default", ["scripts", "styles", "watch"]
