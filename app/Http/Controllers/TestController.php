<?php

namespace App\Http\Controllers;


class TestController extends Controller
{
    public function menuRolePermission(Type $var = null)
    {
        $processArr = [
            "index",
            "create",
            "store",
            "show",
            "edit",
            "update",
            "destroy",
        ];
        foreach ($processArr as $procs) {
            $store = [
                'dominion_id'   => 5,
                'name'          => ucfirst($procs),
                'route_name'    => 'permission.' . $procs
            ];
            dd($store);
            Process::create($store);
        }

        $proAll = Process::get()->toArray();
        $jsonPer = json_encode($proAll);
        $per = [
            'permissions'   => $jsonPer,
            'role_id'       => '1',
        ];
        Permission::where('id', 1)->update($per);
        dd($jsonPer);

        $menu1 = [
            'parent_id'     => 2,
            'dominion_id'   => 2,
            'process_id'    => 9,
            'name'          => 'Role',
            'icon'          => "<i class='fa fa-dashboard'></i>",
            'guard'         => 'admin',
            'route_name'    => 'role.index',
            'position'      => 1,
        ];
        Authorizedmenu::create($menu1);
        $menu2 = [
            'parent_id'     => 2,
            'dominion_id'   => 6,
            'process_id'    => 37,
            'name'          => 'Dominion',
            'icon'          => "<i class='fa fa-dashboard'></i>",
            'guard'         => 'admin',
            'route_name'    => 'dominion.index',
            'position'      => 2,
        ];
        Authorizedmenu::create($menu2);
        $menu3 = [
            'parent_id'     => 2,
            'dominion_id'   => 4,
            'process_id'    => 23,
            'name'          => 'Process',
            'icon'          => "<i class='fa fa-dashboard'></i>",
            'guard'         => 'admin',
            'route_name'    => 'process.index',
            'position'      => 3,
        ];
        Authorizedmenu::create($menu3);
        $menu4 = [
            'parent_id'     => 2,
            'dominion_id'   => 5,
            'process_id'    => 30,
            'name'          => 'Permission',
            'icon'          => "<i class='fa fa-dashboard'></i>",
            'guard'         => 'admin',
            'route_name'    => 'permission.index',
            'position'      => 4,
        ];
        Authorizedmenu::create($menu4);
        $menu5 = [
            'parent_id'     => 2,
            'dominion_id'   => 3,
            'process_id'    => 16,
            'name'          => 'Authorized Menu',
            'icon'          => "<i class='fa fa-dashboard'></i>",
            'guard'         => 'admin',
            'route_name'    => 'authorizedmenu.index',
            'position'      => 5,
        ];
        Authorizedmenu::create($menu5);
        $menu6 = [
            'parent_id'     => null,
            'dominion_id'   => 1,
            'process_id'    => 2,
            'name'          => 'Admin',
            'icon'          => "<i class='fa fa-users'></i>",
            'guard'         => 'admin',
            'route_name'    => 'admin.index',
            'position'      => 20,
        ];
        Authorizedmenu::create($menu6);
        die("exit");
    }
}
