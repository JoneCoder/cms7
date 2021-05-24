<?php

/**
 * @JoneCoder
 */

namespace App\Http\Controllers\Backend\Website;

use App\Models\Menu;
use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class MenuController extends Controller
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
        $query = Menu::with('content', 'parent')->oldest('sorting');
        if (!empty($request->all())) {
            if (!empty($request->type)) {
                $query->where('type', $request->type);
            }
            if (!empty($request->position)) {
                $query->where('position', $request->position);
            }
            if (!empty($request->field_name) & !empty($request->value)) {
                $query->where($request->field_name, 'like', '%' . $request->value . '%');
            }
        }
        $datas  = $query->paginate($request->pagination);
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
        $data = $this->validateCheck($request);
        Menu::create($data);
        return response()->json(['message' => 'Create Successfully!'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Menu $menu)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return Menu::with('content')->findOrFail($menu->id);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function edit(Menu $menu)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Menu $menu)
    {
        $data = $this->validateCheck($request);
        $menu->update($data);
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Menu  $menu
     * @return \Illuminate\Http\Response
     */
    public function destroy(Menu $menu)
    {
        if ($menu->delete()) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }


    /**
     * get parent menus.
     */
    public function getParentMenu()
    {
        return  Menu::getMenuList();
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request)
    {
        return $request->validate([
            'parent_id' => 'nullable',
            'content_id' => 'nullable',
            'type' => 'nullable',
            'menu_look_type' => 'required',
            'position' => 'required|string|min:0|max:100',
            'title' => 'required|string|min:0|max:191',
            'slug' => 'nullable|string|min:0|max:191',
            'url' => 'nullable|string|min:0|max:191',
            'status' => 'nullable|string|min:0|max:30',
            'params' => 'nullable',
            'sorting' => 'nullable|numeric|min:-2147483648|max:2147483647'
        ]);
    }
}
