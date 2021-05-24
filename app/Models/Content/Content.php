<?php

namespace App\Models\Content;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Content extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    public function contentFiles()
    {
        return $this->hasMany(ContentFile::class)->oldest('sorting');
    }

    public function getImageAttribute($value)
    {
        if (!empty($value)) {
            return url('/') . "/public/storage/" . $value;
        }
        return null;
    }



    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Role';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the role";
    }
}
