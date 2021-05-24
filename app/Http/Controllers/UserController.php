<?php

namespace App\Http\Controllers;

use App\Http\Resources\UserResource;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{

    public function index(Request $request)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        $query  = User::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }

        $datas  = $query->paginate(10);
        return new UserResource($datas);
    }


    public function create()
    {
        return view('layouts.backend_app');
    }


    public function store(Request $request)
    {
        User::create($request->all());
        return response()->json(['message' => 'Create Successfully!'], 200);
    }


    public function show(Request $request, User $user)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $user;
    }

    public function edit(User $user)
    {
        return view('layouts.backend_app');
    }

    public function update(Request $request, User $user)
    {
        $user->update($request->all());
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    public function destroy(User $user)
    {
        if ($user->delete()) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }


    public function validateCheck($request)
    {
        return $request->validate([
            //ex: 'name' => 'required|email|nullable|date|string|min:0|max:191',
        ]);
    }
}
