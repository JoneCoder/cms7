<?php

namespace App\Models\Menu;

use Illuminate\Database\Eloquent\Model;

class Permission extends Model
{
    protected $appends = array('permission_list');

    protected $guarded = [];
    public function role()
    {
        return $this->belongsTo(Role::class)->withDefault();
    }
    public function getPermissionListAttribute()
    {
        $permissions = [];
        foreach (json_decode($this->permissions, 1) as $permission) {
            if (isset($permission['route_name'])) {
                $route_name = $permission['route_name'];
                $routes = explode(',', $route_name);
                foreach ($routes as $route) {
                    array_push($permissions, $route);
                }
            }
        }
        return $permissions;
    }
    public static function getRollHasPermissionList($role_id)
    {
        $permissions = Permission::where('role_id', $role_id)->first();
        $processList = array_combine(array_column(json_decode($permissions->permissions, true), 'id'), array_column(json_decode($permissions->permissions, true), 'id'));

        return $processList;
    }
}
