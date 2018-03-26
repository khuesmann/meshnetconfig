<?php

namespace App\Http\Requests;

class BuildingFormRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required',
            'latitude' => 'required',
            'longitude' => 'required',
            'latitude2' => 'required',
            'longitude2' => 'required',
            'latitude3' => 'required',
            'longitude3' => 'required',
            'scale_by' => 'required',
        ];
    }
}