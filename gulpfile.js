const elixir = require('laravel-elixir');

require('laravel-elixir-vue-2');

/*
 |--------------------------------------------------------------------------
 | Elixir Asset Management
 |--------------------------------------------------------------------------
 |
 | Elixir provides a clean, fluent API for defining some basic Gulp tasks
 | for your Laravel application. By default, we are compiling the Sass
 | file for our application, as well as publishing vendor resources.
 |
 */

elixir(mix => {
    mix.less('style.less')
       .webpack('app.js');

    // copy images
    mix.copy('./resources/assets/img', 'public/img');

    // copy fonts
    mix.copy('./resources/assets/fonts', 'public/fonts');
});
