<?php

namespace App\Providers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\ServiceProvider;
use App\Models\Menu\Permission;
use App\Helpers\GlobalHelper;
use App\Models\Menu\Authorizedmenu;
use App\Models\Menu\Role;
use App\Models\Menu\Dominion;
use App\Models\Admin;

class DatabaseServiceProvider extends ServiceProvider
{

    protected $defer = true;
    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        /*-----SIDE MENUS-----*/
        $this->app->singleton('sideMenus', function ($app) {
            $seconds = '';
            return Cache::remember('side_menus',  $seconds, function () {
                if ($admin = Auth::guard(GlobalHelper::get_guard())->user()) {
                    $roleHasProcessList = Permission::getRollHasPermissionList($admin->role_id);
                    $sideMenus = Authorizedmenu::whereNull('parent_id')->with(['allChildrenMenus' => function ($query) use ($roleHasProcessList) {
                        $query->whereIn('process_id', $roleHasProcessList);
                    }])->orderBy('position', 'asc')->get();
                } else {
                    $sideMenus = [];
                }
                return  $sideMenus;
            });
        });

        /*-----ROLES-----*/
        $this->app->singleton('roles', function ($app) {
            return Cache::rememberForever('role_lists', function () {
                return Role::pluck('name', 'id')->toArray();
            });
        });

        /*-----DOMINION LISTS-----*/
        $this->app->singleton('dominions', function ($app) {
            return Cache::rememberForever('dominion_lists', function () {
                return Dominion::orderBy('id', 'desc')->pluck('name', 'id')->toArray();
            });
        });

        /*-----DASHBOARD MENUS-----*/
        $this->app->singleton('dashboardMenus', function ($app) {
            return Cache::rememberForever('dashboard_menus', function () {
                return Authorizedmenu::where('show_dasboard', 1)->get();
            });
        });

        /*-----ADMIN INFO-----*/
        $this->app->singleton('adminInfo', function ($app) {
            $seconds = '';
            return Cache::remember('admin_info',  $seconds, function () {
                return Admin::with('role', 'permisson')->find(Auth::user()->id);
            });
        });
    }

    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    { }
}
