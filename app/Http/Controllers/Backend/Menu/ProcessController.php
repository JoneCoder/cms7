<?php

namespace App\Http\Controllers\Backend\Menu;

use Illuminate\Http\Request;
use App\Models\Menu\Process;
use App\Http\Controllers\Controller;
use App\Http\Resources\Resource;

class ProcessController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $query = Process::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }
        if (!empty($request->dominion_id)) {
            $query->where('dominion_id', 'like', $request->dominion_id);
        }
        $datas = $query->with('dominion')->paginate($request->pagination);
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
        $datas = $request->all();
        $routes = explode(',', $datas['route_name']);
        foreach ($routes as $route_name) {
            $names = explode('.', $route_name);
            $name = ucfirst($names[0]);
            if (isset($names[1])) {
                $name = ucfirst($names[1]);
            }
            $data = [];
            $data = ['name' => $name, 'dominion_id' => $datas['dominion_id'], 'guard' => $datas['guard'], 'route_name' => $route_name];
            Process::create($data);
        }
        return response()->json(['message' => 'Create Successfully!'], 200);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Process  $process
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Process $process)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $process;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Process  $process
     * @return \Illuminate\Http\Response
     */
    public function edit(Process $process)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Process  $process
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Process $process)
    {
        $process->update($request->all());
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Process  $process
     * @return \Illuminate\Http\Response
     */
    public function destroy(Process $process)
    {
        if ($process->delete()) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }
    public function ProcessList($id = null, $field = null)
    {
        $query = Process::latest();
        if (!empty($id) & !empty($field)) {
            $query = $query->where($field, $id);
        }
        return $query->pluck('name', 'id')->toArray();
    }
    public function AllProcess($id = null, $field = null)
    {
        $query = Process::latest();
        if (!empty($id) & !empty($field)) {
            $query = $query->where($field, $id);
        }
        return $query->get();
    }
}
