<?php

namespace App\Http\Requests;

class ExperimentFormRequest extends Request
{
    public function rules()
    {
        return [
            'name' => 'required',
//            'xml_file' => 'required',
            'mapping_id' => 'required|min:1'
        ];
    }
}