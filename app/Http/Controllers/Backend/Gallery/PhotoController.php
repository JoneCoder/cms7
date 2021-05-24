<?php

/**
 * @JoneCoder
 */

namespace App\Http\Controllers\Backend\Gallery;

use App\Http\Resources\Resource;
use App\Http\Controllers\Controller;
use App\Models\Gallery\Photo;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class PhotoController extends Controller
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
        $query  = Photo::with('album')->oldest('sorting');
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
            if (!empty($request->file('image'))) {
                $data['image'] = Storage::putFile('upload/photos', $request->file('image'));
            }
            Photo::create($data);
            return response()->json(['message' => 'Create Successfully!'], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Photo $photo)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        return $photo;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function edit(Photo $photo)
    {
        return view('layouts.backend_app');
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Photo $photo)
    {
        $data       = $request->all();
        $ex         = explode('storage/', $photo->image);
        $oldImage   = $ex[1] ?? "";

        if (!empty($request->file('image'))) {
            if (Storage::disk('public')->exists($oldImage)) :
                Storage::delete($oldImage);
            endif;
            $data['image'] = Storage::putFile('upload/photos', $request->file('image'));
        } else {
            $data['image'] = $oldImage;
        }
        $photo->update($data);
        return response()->json(['message' => 'Update Successfully!'], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Photo  $photo
     * @return \Illuminate\Http\Response
     */
    public function destroy(Photo $photo)
    {
        $ex         = explode('storage/', $photo->image);
        $oldImage   = $ex[1] ?? "";
        if (Storage::disk('public')->exists($oldImage)) :
            Storage::delete($oldImage);
        endif;
        if ($photo->delete()) {
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
            'title' => 'required',
            'image' => 'required'
        ]);
    }
}
