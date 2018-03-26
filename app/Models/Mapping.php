<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Mapping extends Model
{
    use \App\Traits\IsActiveTrait;
    
    protected $fillable = [
        'name',
        'is_active',
        'result_mapping',
        'scan_result_mapping',
        'node_mapping',
        'general_info_mapping'
    ];

    /**
     * @param array $options
     */
    public function save(array $options = [])
    {
        $currentActive = $this->where('is_active', true)->first();
        if (!empty($currentActive) && $this->is_active && $this->id != $currentActive->id) {
            $currentActive->is_active = false;
            $currentActive->save();
            \Cache::forget("activeMapping");
        }
        parent::save($options);
    }

    /**
     * @return array
     */
    public function getResultMapping()
    {
        return (array) json_decode($this->result_mapping);
    }

    /**
     * @return array
     */
    public function getScanResultMapping()
    {
        return (array) json_decode($this->scan_result_mapping);
    }

    /**
     * @return array
     */
    public function getNodeMapping()
    {
        return (array) json_decode($this->node_mapping);
    }

    /**
     * @return array
     */
    public function getGeneralInformationMapping()
    {
        return (array) json_decode($this->general_info_mapping);
    }

}
