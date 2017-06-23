gulp = require("gulp")
gutil = require("gulp-util")
_ = require('lodash')
sass = require('gulp-ruby-sass')
concat = require('gulp-concat')
livereload = require('gulp-livereload')
gulpFilter = require('gulp-filter')
prefix = require('gulp-autoprefixer')

paths = {
  output: "assets"
  sass: "scss/style.scss"
  vendorCSS: [
  ]
}

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
    paths.vendorCSS
    "**/*.scss"
  ], ["styles"]

gulp.task "build", ["styles"]
gulp.task "default", ["styles", "watch"]
