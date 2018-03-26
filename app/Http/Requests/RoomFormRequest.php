<?php

namespace App\Http\Requests;

class RoomFormRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required',
            'grid_start_x' => 'required|numeric',
            'grid_start_z' => 'required|numeric',
            'grid_stop_x' => 'required|numeric',
            'grid_stop_z' => 'required|numeric',
        ];
    }
}