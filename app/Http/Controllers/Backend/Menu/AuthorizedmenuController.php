<?php

namespace App\Http\Controllers\Backend\Menu;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Cache;
use Illuminate\Support\Facades\App;
use App\Models\Menu\Authorizedmenu;
use App\Http\Resources\Resource;

class AuthorizedmenuController extends Controller
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
        $query = Authorizedmenu::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }
        $datas = $query->with('dominion', 'process', 'parent')->paginate($request->pagination);
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
        Cache::forget('side_menus');
        Cache::forget('dashboard_menus');
        Authorizedmenu::create($request->all());
        return response()->json(['message' => 'Create Successfully!'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Authorizedmenu  $authorizedmenu
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Authorizedmenu $authorizedmenu)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $authorizedmenu;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Authorizedmenu  $authorizedmenu
     * @return \Illuminate\Http\Response
     */
    public function edit(Authorizedmenu $authorizedmenu)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Authorizedmenu  $authorizedmenu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Authorizedmenu $authorizedmenu)
    {
        Cache::forget('side_menus');
        Cache::forget('dashboard_menus');
        $authorizedmenu->update($request->all());
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Authorizedmenu  $authorizedmenu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Authorizedmenu $authorizedmenu)
    {
        if ($authorizedmenu->delete()) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }
    public function RootMenu(Request $request, $data = null)
    {
        if ($request->format() == 'html') {
            return response(view('layouts.backend_app'));
        } elseif ($request->format() == 'json') {
            switch ($data) {
                case 'side_menu':
                    return App::make('sideMenus');
                    break;

                default:

                    return Authorizedmenu::getMenuList();
                    break;
            }
        }
    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Authorizedmenu  $authorizedmenu
     * @return \Illuminate\Http\Response
     */
    public function dashboardMenu()
    {
        return App::make('dashboardMenus');
    }
}
