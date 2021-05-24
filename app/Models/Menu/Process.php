<?php

namespace App\Models\Menu;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Process extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function dominion()
    {
        return $this->belongsTo(Dominion::class)->withDefault();
    }


    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Process';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the process";
    }
}
