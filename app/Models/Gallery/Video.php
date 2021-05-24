<?php

namespace App\Models\Gallery;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Video extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function album()
    {
        return $this->belongsTo(Album::class);
    }




    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Video';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the Video";
    }
}
