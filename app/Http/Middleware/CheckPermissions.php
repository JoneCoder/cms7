<?php

namespace App\Http\Middleware;

use App\Helpers\GlobalHelper;
use App\Models\Admin;
use Auth;
use Route;
use Closure;

class CheckPermissions
{

    public function handle($request, Closure $next, $guard = null)
    {
        $guard = GlobalHelper::get_guard();
        $currentRouteName = Route::currentRouteName();
        $ckeck_guard = Auth::guard($guard)->check();
        if ($ckeck_guard & !empty(Auth::guard($guard)->user()->id)) {
            $user = Admin::with('permisson')->find(Auth::guard($guard)->user()->id);
            foreach (json_decode($user->permisson->permissions, 1) as $permissions) {
                if (isset($permissions['route_name'])) {
                    if ($permissions['route_name'] == $currentRouteName) {
                        if ($request->format() == 'html') {
                            return response(view('layouts.backend_app'));
                        } elseif ($request->format() == 'json') {
                            return $next($request);
                        } else {
                            abort(404, 'Bustard');
                        }
                    }
                }
            }
        }
        return redirect('/');
    }
}
