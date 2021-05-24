<?php

namespace App\Models;

use App\Models\Content\Content;
use Auth;
use Illuminate\Support\Str;
use Illuminate\Database\Eloquent\Model;
use Spatie\Activitylog\Traits\LogsActivity;

class Menu extends Model
{
    use LogsActivity;

    protected $guarded = [];

    public function getRouteKeyName()
    {
        return 'slug';
    }

    protected static function boot()
    {
        parent::boot();
        static::creating(function ($menu) {
            $menu->slug = Str::slug($menu->title);
        });
        static::updating(function ($menu) {
            $menu->slug = Str::slug($menu->title);
        });
    }

    public function parent()
    {
        return $this->belongsTo(Menu::class, 'parent_id', 'id')->select(
            'id',
            'parent_id',
            'title',
            'slug',
            'params',
            'url'
        );;
    }
    public function childs()
    {
        return $this->hasMany(Menu::class, 'parent_id', 'id');
    }
    /**
     * Get the content for this model.
     *
     * @return App\Content
     */
    public function content()
    {
        return $this->belongsTo(Content::class, 'content_id')->withDefault();
    }


    /**
     * Get updated_at in array format
     *
     * @param  string  $value
     * @return array
     */
    public function childrenMenus()
    {
        return $this->hasMany(Menu::class, 'parent_id', 'id')->select(
            'id',
            'parent_id',
            'title',
            'slug',
            'type',
            'params',
            'url'
        );
    }

    public function allChildrenMenus()
    {
        return $this->childrenMenus()->with('allChildrenMenus')->oldest('sorting')->select(
            'id',
            'parent_id',
            'title',
            'slug',
            'type',
            'params',
            'url'
        );;
    }
    static function parentMenus()
    {
        return Menu::where('parent_id', null)->pluck('name', 'id')->oldest('sorting')->toArray();
    }

    public static function getMenuList()
    {
        $Menus = Menu::with('childs')->where('parent_id', Null)->oldest('sorting')->get();
        $Menus = Menu::recursiveMenuList($Menus);
        return $Menus;
    }
    public static function recursiveMenuList($datas)
    {
        static $desiglistlist = array();
        static $level = 0;
        $level++;
        if (isset($datas)) {
            foreach ($datas as $desiglist) {
                if (!empty($desiglist['childs'])) {
                    $desiglistlist[$desiglist['id']] = str_repeat('|__', $level - 1) . $desiglist['title'];
                } else {
                    $desiglistlist[$desiglist['id']] = str_repeat('|__', $level - 1) . $desiglist['title'];
                }
                Menu::recursiveMenuList($desiglist['childs']);
            }
        }
        $level--;
        return $desiglistlist;
    }

    // get menus for home page
    public static function getMenus()
    {
        return  Menu::select(
            'id',
            'parent_id',
            'title',
            'url',
            'slug',
            'menu_look_type'
        )->where('parent_id', null)
            ->where('status', 'Active')
            ->where('position', 'header')
            ->with('allChildrenMenus')
            ->oldest('sorting')->limit(7)
            ->get();
    }

    // get parent id / /title for home page
    public static function getParentMenu($field, $type)
    {
        $menu =  Menu::select('parent_id')
            ->where($field, $type)->where('status', 'Active')
            ->where('position', 'header')->first();
        if (!empty($menu)) {
            $title = Menu::where('id', $menu->parent_id)
                ->select('title')->where('status', 'Active')
                ->where('position', 'header')->first();
            $data['title'] = $title->title;
        }
        $data['parent_id'] = $menu->parent_id;
        return $data;
    }
    // get left menus for home page
    public static function getLeftMenus($parent_id)
    {
        return  Menu::select(
            'parent_id',
            'title',
            'slug',
            'type',
            'params',
            'url'
        )->where('parent_id', $parent_id)
            ->where('status', 'Active')
            ->where('position', 'header')
            ->oldest('sorting')->get();
    }



    //--------------------------------------------------------
    // LOG ACTIVITY
    //--------------------------------------------------------
    protected static $logAttributes = ['*'];
    protected static $logName = 'Frontend Menu';
    public function getDescriptionForEvent(string $eventName): string
    {
        $name = Auth::guard('admin')->user()->name;
        return "{$name} have {$eventName} the Frontend Menu";
    }
}
