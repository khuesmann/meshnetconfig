<?php

namespace App\Models\Building;

use App\Models\BaseEloquentModel;

class Room extends BaseEloquentModel
{
    protected $fillable = [
        'floor_id', 
        'name', 
        'grid_start_x', 
        'grid_start_z', 
        'grid_stop_x', 
        'grid_stop_z',
        "color_r",
        "color_g",
        "color_b",
        "color_a",
    ];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function floor()
    {
        return $this->belongsTo(Floor::class, "floor_id", "id");
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function nodes()
    {
        return $this->hasMany(Node::class, "room_id", "id");
    }

    /**
     * @return array
     */
    public function prepareJson()
    {
        $preparedJson = [
            "id" => $this->id,
            "name" => $this->name,
            "grid" => [
                "start" => [
                    "x" => $this->grid_start_x,
                    "z" => $this->grid_start_z,
                ],
                "stop" => [
                    "x" => $this->grid_stop_x,
                    "z" => $this->grid_stop_z,
                ]
            ],
            "color" => [
                "r" => $this->color_r,
                "g" => $this->color_g,
                "b" => $this->color_b,
                "a" => $this->color_a,
            ]
        ];

        return $preparedJson;
    }

    /**
     * @param $value
     * @return float
     */
    public function getColorAAttribute($value) { if($value === null) return 0.2; return $value; }

    /**
     * @param $value
     * @return int
     */
    public function getColorRAttribute($value) { if($value === null) return 0; return $value; }

    /**
     * @param $value
     * @return int
     */
    public function getColorGAttribute($value) { if($value === null) return 0; return $value; }

    /**
     * @param $value
     * @return int
     */
    public function getColorBAttribute($value) { if($value === null) return 0; return $value; }
}
