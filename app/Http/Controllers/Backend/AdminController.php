<?php
/*
 *  @Developed By: JoneCoder
 */

namespace App\Http\Controllers\Backend;

use Hash;
use Auth;
use App\Models\Admin;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\App;
use App\Http\Requests\Admin\AdminRequest;

class AdminController extends Controller
{
    public function dashboard(Request $request)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
    }

    //get admin info
    public function adminInfo()
    {
        return App::make('adminInfo');
    }

    //get all admin or paginate data
    public function index(Request $request)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }

        $data  = Admin::getAdmin($request);

        return $data;

    }


    public function create()
    {
        return view('layouts.backend_app');
    }


    //Store admin
    public function store(AdminRequest $request)
    {
        $res = Admin::store($request);
        if($res){
            return response()->json(['status' => 200, 'message' => 'Create Successfully!'], 200);
        }else{
            return response()->json(['status' => 500, 'message' => 'Something went wrong!'], 500);
        }
    }


    public function show(Request $request, Admin $admin)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        if (Auth::guard('admin')->user()->role_id == 1) {
            return Admin::with('rolename')->find($admin->id);
        }
        return Admin::with('rolename')->find(Auth::guard('admin')->user()->id);
    }


    public function edit(Admin $admin)
    {
        return view('layouts.backend_app');
    }

    //update admin profile
    public function update(Request $request, Admin $admin)
    {
        $res = Admin::updateAdmin($request, $admin);
        if($res){
            return response()->json(['status' => 200, 'message' => 'Information Update Successfully!'], 200);
        }else{
            return response()->json(['status' => 500, 'message' => 'Something went wrong!'], 500);
        }
    }


    //Soft delete
    public function destroy(Admin $admin)
    {
        if ($admin->update(['status' => 'd'])) {
            return response()->json(['status' => 200, 'message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['status' => 500, 'message' => 'Delete Unsuccessfully!'], 500);
        }
    }

    public function checkOldPassword(Request $request)
    {
        if (Auth::guard('admin')->user()->role_id == 1 && Auth::guard('admin')->user()->id != $request->id) {
            return response()->json(true);
        }
        if (Auth::guard('admin')->validate(['password' => $request->old_password, 'id' => $request->id])) {
            return response()->json(true);
        } else {
            return response()->json(false);
        }
    }

    //password change
    public function passwordChange(Request $request)
    {
        $request->validate([
            'new_password'      => 'required|min:6|required_with:confirm_password|same:confirm_password',
            'confirm_password'  => 'required|min:6'
        ]);
        $password = Hash::make($request->new_password);
        Admin::where('id', $request->id)->update(['password' => $password]);
        return response()->json(['message' => 'Password change successfully!!'], 200);
    }
}
