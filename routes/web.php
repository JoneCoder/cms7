<?php

Route::view('/', 'layouts.frontend_app')->name('home.page');

Auth::routes();






























































// for storage linked in public folder=======
Route::get('/sym', function () {
    return view('symlinkexample');
});
// cache clear
Route::get('/clear', function () {
    Artisan::call('cache:clear');
    Artisan::call('config:clear');
    Artisan::call('view:clear');
    return "Cleared!";
});
// cache 
Route::get('/cache', function () {
    Artisan::call('config:cache');
    Artisan::call('view:cache');
    return "cache!";
});
