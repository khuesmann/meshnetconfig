<?php
namespace App\Traits;

trait IsActiveTrait {

    public function save(array $options = [])
    {
        $currentActive = $this->where('is_active', true)->first();
        if (!empty($currentActive) && $this->is_active && $this->id != $currentActive->id) {
            $currentActive->is_active = false;
            $currentActive->save();
        }
        parent::save($options);
    }
    
    public static function getActive()
    {
        return self::where('is_active', true)->first();
    }
    
    
}