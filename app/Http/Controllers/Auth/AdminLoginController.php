<?php

/**
 * Dev: @JoneCoder
 */

namespace App\Http\Controllers\Auth;

use Auth;
use Session;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Admin;
use Illuminate\Support\Facades\Cache;

class AdminLoginController extends Controller
{
    public function __construct()
    {
        $this->middleware('guest:admin')->except('logout', 'loginCheck');
    }

    public function login(Request $request)
    {
        Cache::forget('admin_info');
        Cache::forget('sideMenus');
        Cache::forget('dashboardMenus');
        if ($request->isMethod('post')) {
            if ($this->validateCheck($request)) {
                $email = $request->email;
                // check email / user===========
                if (filter_var($email, FILTER_VALIDATE_EMAIL)) :
                    $arr = [
                        'email'     => $email,
                        'password'  => $request->password,
                        'status'    => 'a'
                    ];
                else :
                    $arr = [
                        'username'  => $email,
                        'password'  => $request->password,
                        'status'    => 'a'
                    ];
                endif;

                $admin = Admin::where('email', $email)->first();
                if (!empty($admin)) {
                    if ($admin->block == 0) {
                        if (Auth::guard('admin')->attempt($arr, $request->remember)) {
                            Session::forget($email);
                            return response([
                                'message'   => "Login Successfully",
                                'id'        => Auth::guard('admin')->user()->id ?? "",
                                'name'      => Auth::guard('admin')->user()->name ?? "",
                                'role'      => Auth::guard('admin')->user()->role->name ?? ""
                            ], 200);
                        } else {
                            $attempt = $this->attemptAdmin($admin->id, $email);
                            if ($attempt <= 3 && $attempt != 0) {
                                $msg =  "There are " . $attempt . " attempts left";
                            } else if ($attempt == 0) {
                                $msg =  "Your account is block, plese contact your administrator";
                            } else {
                                $msg =  "Your Login Information is Wrong";
                            }
                            return response([
                                'message'  => $msg
                            ], 201);
                        }
                    } else {
                        Session::forget($email);
                        return response([
                            'message'  => "Your account is block, plese contact your administrator"
                        ], 201);
                    }
                } else {
                    return response([
                        'message'  => "Email does not match our records!"
                    ], 201);
                }
            }
        } else if ($request->isMethod('get')) {
            return view('layouts.backend_app');
        } else {
            return view('layouts.backend_app');
        }
    }

    private function attemptAdmin($id, $email)
    {
        $count  = Session::get($email) ?? 0;
        $inc    = $count + 1;
        Session::put($email, $inc);

        $attempt = 6 - $inc;
        if ($attempt == 0) {
            Session::forget($email);
            Admin::where('id', $id)->update(['block' => 1]);
        }
        return $attempt;
    }


    /**
     * Validation check====
     */
    public function validateCheck($request)
    {
        return $request->validate([
            "email"     => "required",
            "password"  => "required"
        ]);
    }

    public function logout()
    {
        Cache::forget('admin_info');
        Cache::forget('sideMenus');
        Cache::forget('dashboardMenus');
        $logout = Auth::guard('admin')->logout();
        return response()->json(true);
    }

    public function loginCheck()
    {
        if (Auth::guard('admin')->user()) {
            return response([
                'message'   => "Login Successfully",
                'id'        => Auth::guard('admin')->user()->id ?? "",
                'name'      => Auth::guard('admin')->user()->name ?? "",
                'role'      => Auth::guard('admin')->user()->role->name ?? "",
                'username'  => Auth::guard('admin')->user()->username ?? ""
            ], 200);
        }
        return response([
            'message'   => "Unauthorized",
        ], 201);
    }
}
