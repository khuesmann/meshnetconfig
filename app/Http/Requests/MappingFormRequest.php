<?php

namespace App\Http\Requests;

class MappingFormRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required'
        ];
    }
}