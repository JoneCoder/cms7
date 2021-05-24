<?php

/**
 * @JoneCoder
 */

namespace App\Helpers;

use App\Models\MyRoute;
use App\Models\Menu\Process;
use App\Models\Menu\Dominion;
use App\Models\Menu\Permission;
use App\Models\Menu\Authorizedmenu;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\Artisan;

class Module
{
    // ------------------------------------------------------
    // check model name
    // ------------------------------------------------------
    public static function check($request)
    {
        $model = $request->model;
        $path       = app_path() . "'\'" . $model . ".php";
        $pathModel  = app_path() . "'\Models\'" . $model . ".php";
        $pathNs     = app_path() . "'\Models\'" . $model . ".php";
        $pathNsMenu = app_path() . "'\Models\Menu\'" . $model . ".php";
        $pathNsGal  = app_path() . "'\Models\Gallery\'" . $model . ".php";
        $pathNsCont = app_path() . "'\Models\Content\'" . $model . ".php";

        if (file_exists(str_replace("'", "", $path))) {
            return response()->json(true);
        } else if (file_exists(str_replace("'", "", $pathNs))) {
            return response()->json(true);
        } else if (file_exists(str_replace("'", "", $pathModel))) {
            return response()->json(true);
        } else if (file_exists(str_replace("'", "", $pathNsMenu))) {
            return response()->json(true);
        } else if (file_exists(str_replace("'", "", $pathNsGal))) {
            return response()->json(true);
        } else if (file_exists(str_replace("'", "", $pathNsCont))) {
            return response()->json(true);
        }
        return response()->json(false);
    }

    // ------------------------------------------------------
    // create module
    // ------------------------------------------------------
    public static function create($request)
    {
        Cache::forget('dashboardMenus');
        Cache::forget('dominion_lists');
        $name = $request->model_name;

        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        if ($request->isMethod('get')) {
            return Self::folderPath($name ?? 'Test');
        }

        Self::createFile($name);
    }

    public static function createFile($name)
    {
        // create a new model / controller / resource / database / factory file
        Artisan::call('make:model', ['name' => 'Models/' . $name, '-a' => 'default']);
        Artisan::call('make:request', ['name' => $name.'/' . $name.'Request']);
        // Artisan::call('make:resource', ['name' => $name . 'Resource', '--collection' => 'default']);

        // -------------route create-------------
        Self::routeCreate($name);

        // -------------move controller-------------
        Self::moveController($name . 'Controller');

        // -------------create a vue file-------------
        Artisan::call('make:vue-create', ['name' => $name . '.Create']);
        Artisan::call('make:vue-index', ['name' => $name . '.Index']);
        Artisan::call('make:vue-view', ['name' => $name . '.View']);

        // -------------dominion && process create-------------
        Self::dominionProcess($name);

        return response()->json(true);
    }

    // ------------------------------------------------------
    // route create
    // ------------------------------------------------------
    public static function routeCreate($name)
    {
        $count = MyRoute::where('name', $name)->count();
        if ($count == 0) {
            $arr = [
                'name'          => $name,
                'path'          => lcfirst($name),
                'controller'    => $name . 'Controller'
            ];
            MyRoute::create($arr);
        }
    }

    // ------------------------------------------------------
    // move to controller one folder to another folder
    // ------------------------------------------------------
    public static function moveController($controller)
    {
        $oldPath     = str_replace("'", "", app_path() . "'\Http\Controllers\'" . $controller . ".php");
        $newPath     = str_replace("'", "", app_path() . "'\Http\Controllers\Backend\'" . $controller . ".php");

        rename($oldPath, $newPath);
    }

    // ------------------------------------------------------
    // dominion && process && Menu create
    // ------------------------------------------------------
    public static function dominionProcess($name = null)
    {
        $dominionCount      = Dominion::where('name', $name)->count();
        if ($dominionCount == 0) {
            $dom = Dominion::create(['name' => $name]);
        }
        $processArr = Self::processName();
        if (!empty($dom)) {
            foreach ($processArr as $procs) {
                $store = [
                    'dominion_id'   => $dom->id,
                    'name'          => ucfirst($procs),
                    'route_name'    => lcfirst($name) . '.' . $procs
                ];
                $process = Process::create($store);
                if ($procs == 'index') {
                    /* ------------menu create------------ */
                    Self::createMenu($name, $dom->id, $process->id);
                }
                /* ------------permission------------ */
                Self::permissionProcess($process);
            }
        }
    }
    /* ------------menu create------------ */
    public static function createMenu($name, $domID, $processID)
    {
        $menu = [
            'parent_id'     => null,
            'dominion_id'   => $domID,
            'process_id'    => $processID,
            'name'          => ucfirst($name),
            'icon'          => "<i class='fa fa-circle-o text-aqua'></i>",
            'guard'         => 'admin',
            'route_name'    => lcfirst($name) . '.index',
            'position'      => 0,
        ];
        Authorizedmenu::create($menu);
    }
    /* ------------menu create------------ */
    public static function permissionProcess($process)
    {
        $permission = Permission::where('role_id', 1)->first()->toArray();
        $array      = json_decode($permission['permissions'], true);
        $perCount   = count($array);

        $processArr =  $process->toArray();
        $processArr['guard'] = 'admin';
        $newArray = [
            $perCount =>  $processArr
        ];
        $array += $newArray;
        Permission::where('role_id', 1)->update(['permissions' => $array]);
    }
    /* ------------process Name------------ */
    public static function processName()
    {
        return [
            "index",
            "create",
            "store",
            "show",
            "edit",
            "update",
            "destroy",
        ];
    }


    // ------------------------------------------------------
    // folder path
    // ------------------------------------------------------
    public static function folderPath($name = null)
    {
        return [
            'name'          => $name,
            'route'         => lcfirst($name),
            'model'         => 'app/Models/Backend/' . $name . '.php',
            'controller'    => 'app/Http/Controllers/' . $name . 'Controller.php',
            // 'resource'      => 'app/Http/Resources/' . $name . 'Resource.php',
            'resource'      => 'app/Http/Resources/Resource.php',
            'database'      => 'database/migrations',
            'vue_file'      => 'resources/js/views/backend/' . $name . '/Create.vue, Index.vue, View.vue'
        ];
    }
}
