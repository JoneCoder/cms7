<?php

/**
 * @JoneCoder
 */

use App\Models\MyRoute;
use App\Helpers\Module;
use Illuminate\Http\Request;

Route::prefix('admin/')->group(function () {
    // ------------------login and Logout------------------
    Route::match(['get', 'post'], 'loginme',  'Auth\AdminLoginController@login')->name('admin.loginme');
    Route::get('loginme',       'Auth\AdminLoginController@login')->name('admin.loginme');
    Route::get('logout',        'Auth\AdminLoginController@logout')->name('admin.logout');
    Route::get('login-check',   'Auth\AdminLoginController@loginCheck')->name('admin.loginCheck');
    // ------------------user portion------------------
    Route::resource('user',             'UserController');
    Route::view('document',             'layouts.backend_app');
    Route::view('document/create',      'layouts.backend_app');

    // ---------------------------------------------------------
    // LOGGED USER CAN ACCESS THIS PORTION (WITHOUT PERMISSION)
    // ---------------------------------------------------------
    Route::group(['namespace' => 'Backend', 'middleware' => 'auth:admin'], function () {
        // ------------------for left menu------------------
        Route::namespace('Menu')->group(function () {
            Route::get('dominionList',                  'DominionController@dominionList');
            Route::get('alldominion',                   'DominionController@AllDominion');
            Route::get('roleList',                      'RoleController@RoleList');
            Route::get('processList/{id?}/{field?}',    'ProcessController@ProcessList')->name('processList');
            Route::get('AllProcess/{id?}/{field?}',     'ProcessController@AllProcess')->name('AllProcess');
            Route::get('rootmenu/{menu?}',              'AuthorizedmenuController@RootMenu')->name('authorizedmenu.rootmenu');
            Route::get('get-dashboard-menus',           'AuthorizedmenuController@dashboardMenu');
        });

        // ------------------Frontend Parent Menu && Content------------------
        Route::get('parent-menus',                      'Website\MenuController@getParentMenu');
        Route::get('get-content',                       'Website\ContentController@index');
        // ------------------Album portion------------------
        Route::get('check-album',                       'Gallery\AlbumController@checkAlbum');
        Route::get('get-album/{type}',                  'Gallery\AlbumController@album');
        // ------------------admin portion------------------
        Route::get('admin-info',                        'AdminController@adminInfo');
        // ------------------Change password------------------
        Route::post('check-old-password',               'AdminController@checkOldPassword');
        Route::post('change-password',                  'AdminController@passwordChange');

        /*=============CKFINDER=============*/
        Route::view('ckfinder-custom',                  'ckfinder');
    });


    // ---------------------------------------------------------
    // PERMITTED USER CAN ACCESS THIS PORTION
    // ---------------------------------------------------------
    Auth::routes();
    Route::group(['middleware' => 'permission'], function () {
        // ------------------dashboard------------------
        Route::view('dashboard',                'layouts.backend_app')->name('admin.dashboard');
        // ------------------Activity Log portion------------------
        Route::get('activityLog',               'ActivityLogController@index')->name('activityLog.index');
        Route::get('activityLog/{id}',          'ActivityLogController@show')->name('activityLog.show');
        Route::get('allRead',                   'ActivityLogController@allRead')->name('activityLog.allRead');
        Route::delete('activityLog/{id}',       'ActivityLogController@destroy')->name('activityLog.destroy');


        // ------------------Website portion------------------
        Route::namespace('Backend\Website')->group(function () {
            // ------------------Content portion------------------
            Route::get('content/{content}',             'ContentController@show')->name('content.show');
            Route::get('content/{slug}/create',         'ContentController@create')->name('content.create');
            Route::get('content-file/{slug}',           'ContentController@create')->name('content.file');
            Route::post('content',                      'ContentController@store')->name('content.store');
            Route::post('content-file/{content}',       'ContentController@storeFile')->name('content.storeFile');
            Route::delete('content/{contentFile}',      'ContentController@destroy')->name('content.destroy');
        });

























































        //--------------------------------------------------------
        // MODULE CREATE
        //---------------------------------------------------------
        Route::view('module',         'layouts.backend_app')->name('module.index');
        Route::match(['get', 'post'], 'module/create', function (Request $request) {
            return Module::create($request);
        })->name('module.create');
        Route::get('module/check-model', function (Request $request) {
            return Module::check($request);
        })->name('module.check');

        //--------------------------------------------------------
        // DYNAMIC ROUTES CREATED FOR MODULE
        //---------------------------------------------------------
        $routes = MyRoute::where('type', 'backend')->get();
        if (!empty($routes)) {
            foreach ($routes as $route) {
                $controller = str_replace("'", "", $route->namespace . "'\'" . $route->controller); // controller define
                Route::resource($route->path, $controller); // route define
            }
        }
    });
});
