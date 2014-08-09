var gulp = require('gulp'),
    bailey = require('gulp-bailey'),
    gutil = require('gulp-util'),
    nib   = require('nib'),
    stylus = require('gulp-stylus'),
    nodemon = require('gulp-nodemon'),
    gulpIgnore = require('gulp-ignore');

paths = {
  express: {
    src: './**/*.bs',
    dest: './'
  },
  client: {
    src: './public/bs/**/*.bs',
    dest: './public/js/'
  },
  stylus: {
    src: './stylus/*.styl',
    dest: './public/stylesheets/'
  }
};


gulp.task('default', ['stylus', 'express', 'client']);

gulp.task('express', function () {
  gulp.src(paths.express.src)
    .pipe(gulpIgnore.exclude(/public\/bs/))
    .pipe(bailey({node: true}).on('error', gutil.log))
    .pipe(gulp.dest(paths.express.dest));
});

gulp.task('client', function () {
  gulp.src(paths.client.src)
    .pipe(bailey({}).on('error', gutil.log))
    .pipe(gulp.dest(paths.client.dest));
});

gulp.task('stylus', function () {
    gulp.src(paths.stylus.src)
        .pipe(stylus({ use: nib() }))
        .pipe(gulp.dest(paths.stylus.dest));
});
