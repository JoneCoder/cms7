<?php

namespace App\Models;

use App\Models\Menu\Permission;
use App\Models\Menu\Role;
use App\Http\Resources\Resource;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Support\Facades\Hash;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Support\Facades\Storage;

class Admin extends Authenticatable
{
    use HasApiTokens, Notifiable;

    protected $guard  = 'admin';

    protected $fillable = ['name', 'email', 'username', 'password', 'role_id', 'profile', 'mobile', 'address', 'status'];

    protected $hidden = ['password', 'remember_token'];

    public function getProfileAttribute($value)
    {
        if (!empty($value)) {
            return url('/') . "/public/storage/" . $value;
        }
        return null;
    }

    public function setPasswordAttribute($val)
    {
        $this->attributes['password'] = Hash::make($val);
    }

    //get admins
    public static function getAdmin($request)
    {
        $query  = Admin::latest()->with('rolename')->where('status', 'a');
        if (!empty($request->field_name) & !empty($request->value)) {
            $query->where($request->field_name, 'like', '%' . $request->value . '%');
        }

        if ($request->allData) {
            return $query->get();
        } else {
            $data = $query->paginate($request->pagination);
            return new Resource($data);
        }
    }

    //store admin
    public static function store($request)
    {
        $res = Admin::create($request->all());
        if($res){
            return $res;
        }else{
            return false;
        }
    }

    //update admin
    public static function updateAdmin($request, $admin)
    {
        $ex = explode('storage/', $admin->profile);
        $oldImage = $ex[1] ?? "";
        if (!empty($request->file('profile'))) {
            if (Storage::disk('public')->exists($oldImage)) :
                Storage::delete($ex[1]);
            endif;
            $image      = $request->file('profile');
            $fileName   = time().'.'.$image->getClientOriginalExtension();
            $imgPath    = Storage::putFileAs('upload/profile', $image, $fileName);
        }
        $arr = [
            'name'      => $request->name,
            'role_id'   => $request->role_id ?? $admin->role_id,
            'mobile'    => $request->mobile,
            'address'   => $request->address,
            'profile'   => $imgPath ?? $oldImage,
        ];
        return $admin->update($arr);
    }

    public function scopeGetAdmins()
    {
        return Admin::where('status', 'a')->orderBy('id', 'asc')->get();
    }

    public function rolename()
    {
        return $this->hasOne(Role::class, 'id', 'role_id');
    }

    public function role()
    {
        return $this->belongsTo(Role::class)->with('permission')->withDefault();
    }

    public function permisson()
    {
        return $this->belongsTo(Permission::class, 'role_id', 'role_id')->withDefault();
    }
}
