<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

Route::post('/login', function (Request $request) {
    $data = $request->validate([
        "email" => "required",
        "password" => "required"
    ]);

    auth()->attempt($request->only('email', 'password'));
    return auth()->user();

    /*$user = User::where('email', $request->email)->first();
     if (!$user || !Hash::check($request->password, $user->password)) {
         return response([
             'email' => ['The provided credentials are incorrect.'],
         ], 404);
     }

     return $user->createToken('my-token')->plainTextToken;*/
});
