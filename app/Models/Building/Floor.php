<?php

namespace App\Models\Building;

use App\Models\BaseEloquentModel;

class Floor extends BaseEloquentModel
{
    protected $fillable = ['name', 'level', 'height', 'building_id'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function building()
    {
        return $this->belongsTo(Building::class, "building_id", "id");
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function rooms()
    {
        return $this->hasMany(Room::class, "floor_id", "id");
    }

    /**
     * @return array
     */
    public function prepareJson()
    {
        $rooms = [];
        foreach($this->rooms as $room) {
            $rooms[] = $room->prepareJson();
        }

        $preparedJson = [
            "id" => $this->id,
            "name" => $this->name,
            "level" => $this->level,
            "height" => $this->height,
            "rooms" => $rooms
        ];
        return $preparedJson;
    }

    /**
     * @return int
     */
    public function getLength()
    {
        $largestX = 0;
        foreach($this->rooms as $room) {
            if($room->grid_stop_x > $largestX) {
                $largestX = $room->grid_stop_x;
            }
        }
        return $largestX;
    }

    /**
     * @return int
     */
    public function getWidth()
    {
        $largestZ = 0;
        foreach($this->rooms as $room) {
            if($room->grid_stop_z > $largestZ) {
                $largestZ = $room->grid_stop_z;
            }
        }
        return $largestZ;
    }

    /**
     * @return int
     */
    public function getNodesCount()
    {
        $nodesCount = 0;
        foreach($this->rooms as $room) {
            $nodesCount += $room->nodes->count();
        }
        return $nodesCount;
    }
}
