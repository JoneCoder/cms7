<?php

namespace App\Models\Menu;

use Auth;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Authorizedmenu extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function dominion()
    {
        return $this->belongsTo(Dominion::Class)->select(
            'id',
            'name'
        )->withDefault();
    }
    public function process()
    {
        return $this->belongsTo(Process::class)
            ->select(
                'id',
                'dominion_id',
                'guard',
                'name',
                'route_name'
            )->withDefault();
    }
    public function parent()
    {
        return $this->belongsTo(Authorizedmenu::class)->withDefault();
    }
    public function childrenMenus()
    {
        return $this->hasMany(Authorizedmenu::class, 'parent_id', 'id');
    }
    public function allChildrenMenus()
    {
        return $this->childrenMenus()
            ->with('allChildrenMenus')
            ->with('dominion')
            ->with('process')
            ->orderBy('position', 'asc');
    }

    public static function getMenuList()
    {
        $Menus = Authorizedmenu::with('childrenMenus')->where('parent_id', Null)->oldest('position')->get();
        $Menus = Authorizedmenu::recursiveMenuList($Menus);
        return $Menus;
    }
    public static function recursiveMenuList($datas)
    {
        static $desiglistlist = array();
        static $level = 0;
        $level++;
        if (isset($datas)) {
            foreach ($datas as $desiglist) {
                if (!empty($desiglist['childrenMenus'])) {
                    $desiglistlist[$desiglist['id']] = str_repeat('|__', $level - 1) . $desiglist['name'];
                } else {
                    $desiglistlist[$desiglist['id']] = str_repeat('|__', $level - 1) . $desiglist['name'];
                }
                Authorizedmenu::recursiveMenuList($desiglist['childrenMenus']);
            }
        }
        $level--;
        return $desiglistlist;
    }


    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Authorized Menu';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the authorized menu";
    }
}
