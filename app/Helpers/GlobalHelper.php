<?php

namespace App\Helpers;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\Storage;
use Auth, Image;

class GlobalHelper extends Model
{
    public static function get_guard()
    {
        if (Auth::guard('admin')->check()) {
            return "admin";
        } else {
            return null;
        }
    }

    //Store Uploaded Image (Default)
    public static function storeImage($file, $path, $fileName = null, $size = ['width' => 100, 'height' => 100], $quality = 100)
    {
        $fileName = (($fileName)? $fileName : time()).'.'.$file->getClientOriginalExtension();

        $image = Image::make($file)->resize($size['width'], $size['height']);

        $response = Storage::putFileAS($path, $image, $fileName);

        return $response;
    }
}
