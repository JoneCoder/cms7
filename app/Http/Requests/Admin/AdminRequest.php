<?php
/**
 * @JoneCoder
 */

namespace App\Http\Requests\Admin;

use Illuminate\Foundation\Http\FormRequest;

class AdminRequest extends FormRequest
{
    //Form Request Authorization
    public function authorize()
    {
        return true;
    }

    //Validation Rules
    public function rules()
    {
        return [
            'name'          => 'required',
            'email'         => 'required|min:2|unique:admins',
            'password'      => 'required|min:6',
            'role_id'       => 'required'
        ];
    }

    //Custom Validation Messages
    public function messages()
    {
        return [
            //ex: 'name.required' => 'Name is required.',
        ];
    }
}
