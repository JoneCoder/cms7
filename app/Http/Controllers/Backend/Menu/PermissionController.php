<?php

namespace App\Http\Controllers\Backend\Menu;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Menu\Permission;
use App\Http\Resources\Resource;

class PermissionController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        $query = Permission::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }
        $datas = $query->with('role')->paginate($request->pagination);

        return new Resource($datas);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('layouts.backend_app');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $datas = [];
        $datas['permissions']   = json_encode($request->permissions);
        $datas['role_id']       = $request->role_id;

        Permission::create($datas);
        return response()->json(['message' => 'Create Successfully!'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Permission $permission)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        $datas = array();
        $datas['id'] = $permission->id;
        $datas['permissions'] = json_decode($permission->permissions, 1);
        $datas['role_id'] = $permission->role_id;

        return $datas;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function edit(Permission $permission)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Permission $permission)
    {
        $datas = [];
        $datas['id'] = $request->id;
        $datas['permissions'] = json_encode($request->permissions);
        $datas['role_id'] = $request->role_id;
        $permission->update($datas);
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Permission  $permission
     * @return \Illuminate\Http\Response
     */
    public function destroy(Permission $permission)
    {
        if ($permission->delete()) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }

    public function getPermissions(Request $request, $id, $field_name)
    {
        $permissions = Permission::where($field_name, $id)->get();
        return $permissions;
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param Request $request
     * @param $id
     * @param $field_name
     * @return Response
     */
    public function getPermission(Request $request, $id, $field_name)
    {
        $permission = Permission::where($field_name, $id)->first();
        return $permission;
    }
}
