<?php

/**
 * @JoneCoder
 */

namespace App\Http\Controllers\Backend\Website;

use App\Models\Content\Content;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\Content\ContentFile;
use Illuminate\Support\Facades\Storage;

class ContentController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        return Content::latest()->get();
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create($slug = null)
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
        $data       = $request->all();
        $content    = Content::where('slug', $request->slug)->first();

        if (!empty($content)) {
            $ex         = explode('storage/', $content->image);
            $oldImage   = $ex[1] ?? "";
            $type = 'Update';
            if (!empty($request->file('image'))) {
                if (Storage::disk('public')->exists($oldImage)) :
                    Storage::delete($oldImage);
                endif;
                $data['image'] = Storage::putFile('upload/content', $request->file('image'));
            } else {
                $data['image'] = $oldImage;
            }
            $content->update($data);
        } else {
            $type = 'Create';
            if (!empty($request->file('image'))) {
                $data['image'] = Storage::putFile('upload/content', $request->file('image'));
            }
            Content::create($data);
        }
        return response()->json(['message' => $type . ' Successfully!'], 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function storeFile(Request $request, Content $content)
    {
        if ($this->validateCheck($request)) {
            $data = $request->all();
            if (!empty($request->file('file'))) {
                $data['file'] = Storage::putFile('upload/content', $request->file('file'));
            }
            $content->contentFiles()->create($data);
            return response()->json(['message' =>  'Create Successfully!'], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Model\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function show(Request $request, Content $content)
    {
        if ($request->format() == 'html') {
            return view('layouts.backend_app');
        }
        if (!empty($content)) {
            return Content::with('contentFiles')->find($content->id);
        }
        return [];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Model\Content  $content
     * @return \Illuminate\Http\Response
     */
    public function destroy(ContentFile $contentFile)
    {
        if (Storage::disk('public')->exists($contentFile->file)) :
            Storage::delete($contentFile->file);
        endif;
        if ($contentFile->delete()) {
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
            'file' => 'required'
        ]);
    }
}
