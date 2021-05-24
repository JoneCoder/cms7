<?php

/**
 * @JoneCoder
 */

namespace App\Http\Controllers\Backend\Gallery;

use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Models\Gallery\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class SliderController extends Controller
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
        $query  = Slider::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
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
        if ($this->validateCheck($request)) {
            $data = $request->all();
            if (!empty($request->file('slider'))) {
                $data['slider'] = Storage::putFile('upload/slider', $request->file('slider'));
            }
            Slider::create($data);
            return response()->json(['message' => 'Create Successfully!'], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Slider $slider)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $slider;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        $data       = $request->all();
        $ex         = explode('storage/', $slider->slider);
        $oldImage   = $ex[1] ?? "";

        if (!empty($request->file('slider'))) {
            if (Storage::disk('public')->exists($oldImage)) :
                Storage::delete($oldImage);
            endif;
            $data['slider'] = Storage::putFile('upload/slider', $request->file('slider'));
        } else {
            $data['slider'] = $oldImage;
        }
        $slider->update($data);
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function destroy(Slider $slider)
    {
        if ($slider->update(['status' => 'd'])) {
            return response()->json(['message' => 'Delete Successfully!'], 200);
        } else {
            return response()->json(['message' => 'Delete Unsuccessfully!'], 200);
        }
    }

    /**
     * Validate form field.
     *
     * @return \Illuminate\Http\Response
     */
    public function validateCheck($request)
    {
        return $request->validate([
            'title'     => 'required',
            'slider'    => 'required'
        ]);
    }
}
