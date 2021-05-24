const mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */

mix.js('resources/js/app.js', 'public/js')
    .js('resources/js/frontend_app.js', 'public/js')
    .sass('resources/sass/app.scss', 'public/css')
    .copyDirectory('resources/js/assets/backend/images', 'public/images')
    .copyDirectory('resources/js/assets/backend/icons', 'public/assets/icons')
    .copyDirectory('resources/js/assets/frontend/images', 'public/assets/frontend/images')
    .setResourceRoot((process.env.MIX_VUE_ROUTER_BASE) ? '/' + process.env.MIX_VUE_ROUTER_BASE + '/public/' : '/public/')
    .options({ processCssUrls: false });

mix.styles([
    'resources/js/assets/backend/css/AdminLTE.min.css',
    'resources/js/assets/backend/css/skins/_all-skins.min.css',
    'resources/js/assets/backend/css/bootstrap.min.css',
    'resources/js/assets/backend/css/style.css',
    'resources/js/assets/backend/css/responsive.css',
    'resources/js/assets/backend/css/color.css'
], 'public/assets/css/layouts.css');

mix.scripts([
    'resources/js/assets/backend/js/jquery.min.js',
    'resources/js/assets/backend/js/bootstrap.min.js',
    'resources/js/assets/backend/js/jquery.slimscroll.min.js',
    'resources/js/assets/backend/js/fastclick.js',
    'resources/js/assets/backend/js/adminlte.min.js',
    'resources/js/assets/backend/js/demo.js'
], 'public/assets/js/layouts.js');

mix.styles([
    'resources/js/assets/frontend/css/styles.css',
], 'public/assets/frontend/css/frontend.css');

let config = {
    output: {
        publicPath: (process.env.MIX_VUE_ROUTER_BASE) ? '/' + process.env.MIX_VUE_ROUTER_BASE + '/public/' : '/public/', // development
        chunkFilename: 'js/chunks/[name].js', // development
    },
};

if (mix.config.inProduction) {
    config.output.chunkFilename = 'js/chunks/[name].[chunkhash].js'; // production
} else {
    mix.webpackConfig({ devtool: 'source-map' }).sourceMaps();  // Enable sourcemaps
}
mix.webpackConfig(config);

// mix.browserSync({
//     proxy: 'http://localhost/vue-theme'
// });