<?php

namespace App\Models;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Configuration extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function getLogoAttribute($value)
    {
        if (!empty($value)) {
            return url('/') . "/public/storage/" . $value;
        }
        return null;
    }

    //Get paginate Data
    public static function getPaginateData($request)
    {
        $query  = Configuration::latest();
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }

        $data  = $query->paginate($request->pagination);
        return $data;
    }





    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Configuration';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the Configuration";
    }
}
