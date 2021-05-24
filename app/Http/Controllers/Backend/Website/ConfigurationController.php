<?php

/**
 * @JoneCoder
 */

namespace App\Http\Controllers\Backend\Website;

use App\Http\Resources\Resource;
use App\Models\Configuration;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Storage;
use App\Helpers\GlobalHelper;

class ConfigurationController extends Controller
{

     //Display a listing of the resource.

    public function index(Request $request)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        $data  = Configuration::getPaginateData($request);
        return new Resource($data);
    }

    public function create()
    {
        return view('layouts.backend_app');
    }

    public function store(Request $request)
    {
        $confg = Configuration::first();
        $data  = $request->all();
        if (!empty($confg)) {
            $type = "Update";
            // image=========
            $ex         = explode('storage/', $confg->logo);
            $oldImage   = $ex[1] ?? "";
            if (Storage::disk('public')->exists($oldImage)) :
                Storage::delete($oldImage);
            endif;
            if (!empty($request->logo)) {
                $data['logo'] = Storage::putFile('upload/logo', $request->file('logo'));
            } else {
                $data['logo'] =  $oldImage ? '/' . $oldImage : '';
            }
            $confg->update($data);
        } else {
            $type = "Create";
            if (!empty($request->file('logo'))) {
                $data['logo'] = Storage::putFile('upload/logo', $request->file('logo'));
            }
            Configuration::create($data);
        }
        return response()->json(['message' => $type . ' Successfully!'], 200);
    }


    public function show(Request $request, Configuration $configuration)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return Configuration::first();
    }


    public function edit(Configuration $configuration)
    {
        return view('layouts.backend_app');
    }


    public function update(Request $request, Configuration $configuration)
    {
        return view('layouts.backend_app');
    }


    public function destroy(Configuration $configuration)
    {
        $ex         = explode('storage/', $configuration->logo);
        $oldImage   = $ex[1] ?? "";
        if (Storage::disk('public')->exists($oldImage)) :
            Storage::delete($oldImage);
        endif;
        if ($configuration->delete()) {
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
