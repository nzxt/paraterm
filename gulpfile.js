// Подключаем Gulp и все необходимые библиотеки
var gulp           = require('gulp'),
		gutil          = require('gulp-util' ),
		sass           = require('gulp-sass'),
		browserSync    = require('browser-sync'),
		cleanCSS       = require('gulp-clean-css'),
		autoprefixer   = require('gulp-autoprefixer'),
		bourbon        = require('node-bourbon'),
		ftp            = require('vinyl-ftp');

// Обновление страниц сайта на локальном сервере
gulp.task('browser-sync', function() {
	browserSync({
		proxy: "termopara.net",
		notify: false
	});
});

// Компиляция stylesheet.css
gulp.task('sass', function() {
	return gulp.src('catalog/view/theme/paraterm/stylesheet/stylesheet.sass')
		.pipe(sass({
			includePaths: bourbon.includePaths
		}).on('error', sass.logError))
		.pipe(autoprefixer(['last 15 versions']))
		.pipe(cleanCSS())
		.pipe(gulp.dest('catalog/view/theme/paraterm/stylesheet/'))
		.pipe(browserSync.reload({stream: true}))
});

// Наблюдение за файлами
gulp.task('watch', gulp.series('sass', 'browser-sync', function() {
	gulp.watch('catalog/view/theme/paraterm/stylesheet/stylesheet.sass', ['sass']);
	gulp.watch('catalog/view/theme/paraterm/template/**/*.tpl', browserSync.reload);
	gulp.watch('catalog/view/theme/paraterm/javascript/**/*.js', browserSync.reload);
	gulp.watch('catalog/view/theme/paraterm/libs/**/*', browserSync.reload);
}));

// Выгрузка изменений на хостинг
gulp.task('deploy', function() {
	var conn = ftp.create({
		host:      'hostname.com',
		user:      'username',
		password:  'userpassword',
		parallel:  10,
		log: gutil.log
	});
	var globs = [
		'catalog/view/theme/paraterm/**'
	];
	return gulp.src(globs, { buffer: false })
		.pipe(conn.dest('/path/to/folder/on/server'));
});

gulp.task('default', gulp.series('watch'));
