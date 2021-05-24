<?php

namespace App\Models\Menu;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Dominion extends Model
{
    use LogsActivity;

    protected $guarded = [];
    public function processes()
    {
        return $this->hasMany(Process::class);
    }

    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Dominion';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the dominion";
    }
}
