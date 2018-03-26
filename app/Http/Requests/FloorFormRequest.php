<?php

namespace App\Http\Requests;

class FloorFormRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required',
            'level' => 'required|numeric',
            'height' => 'required|numeric',
        ];
    }
}