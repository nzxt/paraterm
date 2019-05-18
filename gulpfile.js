var gulp         = require('gulp'),
    browserSync  = require('browser-sync').create(),
    sass         = require('gulp-sass'),
    cleanCSS     = require('gulp-clean-css'),
    autoprefixer = require('gulp-autoprefixer'),
    bourbon      = require('node-bourbon'),
    ftp          = require('vinyl-ftp'),
    log          = require('fancy-log');

var reload = browserSync.reload;

// Обновление страниц сайта на локальном сервере
gulp.task('browser-sync', function() {
  browserSync.init({
    proxy: "termopara.net",
    notify: false
  });
});

// Compile sass into CSS & auto-inject into browsers
gulp.task('sass', function() {
  return gulp.src("catalog/view/theme/paraterm/sass/customize.sass")
    .pipe(sass.sync({
      includePaths: bourbon.includePaths,
      outputStyle: 'compressed'
    }).on('error', sass.logError))
    .pipe(autoprefixer(['last 15 versions']))
    .pipe(cleanCSS())
    .pipe(gulp.dest("catalog/view/theme/paraterm/stylesheet/"))
    .pipe(browserSync.stream());
});

// Наблюдение за файлами
gulp.task('watch', function() {
  gulp.watch('catalog/view/theme/paraterm/sass/**/*.sass', gulp.parallel('sass'));
  gulp.watch('catalog/view/theme/paraterm/template/**/*.tpl', reload);
  gulp.watch(['catalog/view/theme/paraterm/javascript/**/*.js', 'catalog/view/javascript/common.js'], reload);
  gulp.watch('catalog/view/theme/paraterm/libs/**/*.js', reload);
});

// Выгрузка изменений на хостинг
// gulp.task('deploy', function() {
//   var conn = ftp.create({
//     host:      'hostname.com',
//     user:      'username',
//     password:  'userpassword',
//     parallel:  10,
//     log: log
//   });
//   var globs = [
//     'catalog/view/theme/paraterm/**'
//   ];
//   return gulp.src(globs, { buffer: false })
//         .pipe(conn.dest('/path/to/folder/on/server'));
// });

gulp.task('default', gulp.parallel('watch', 'sass', 'browser-sync'));
