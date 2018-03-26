<?php
/**
 * This Version of MeshNetConf does not use predefined nodes.
 */
namespace App\Models\Building;

use App\Models\BaseEloquentModel;

class Node extends BaseEloquentModel
{
    protected $fillable = ["room_id", "name", "position_x", "position_y", "position_z", "color_r", "color_g", "color_b", "color_a"];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function room()
    {
        return $this->belongsTo(Room::class, "room_id", "id");
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
                "x" => $this->position_x,
                "y" => $this->position_y,
                "z" => $this->position_z,
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
}
