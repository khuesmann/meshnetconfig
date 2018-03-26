<?php

namespace App\Models\Building;

use App\Models\BaseEloquentModel;

class Building extends BaseEloquentModel
{
    protected $fillable = ['name', 'longitude', 'latitude', 'longitude2', 'latitude2', 'longitude3', 'latitude3', 'scale_by'];

    const SCALE_TYPE_ENUM = ['unscaled' => 'Unscaled', 'gps' => 'GPS'];

    /**
     * @return Floor[]
     */
    public function floors()
    {
        return $this->hasMany(Floor::class, "building_id", "id")->orderBy('level');
    }

    /**
     * @return \Illuminate\Support\Collection
     */
    public static function getAllBuildings()
    {
        $allBuildings = [];
        foreach(Building::orderBy('name')->get() as $building) {
            $allBuildings[] = $building->jsonify(false);
        }
        return collect($allBuildings);
    }

    /**
     * @param bool $jsonEncode
     * @return array|string
     */
    public function jsonify($jsonEncode = true)
    {
        $floors = [];
        foreach($this->floors as $floor) {
            $floors[$floor->level] = $floor->prepareJson();
        }

        $buildingJson = [
            "id" => $this->id,
            "name" => $this->name,
            "alias" => $this->name,
            "scale" => [
                "x" => $this->getScaleFactorLength(),
                "z" => $this->getScaleFactorWidth(),
                "y" => $this->getScaleFactorHeight(),
            ],
            "latitude" => $this->latitude,
            "longitude" => $this->longitude,
            "latitude2" => $this->latitude2,
            "longitude2" => $this->longitude2,
            "latitude3" => $this->latitude3,
            "longitude3" => $this->longitude3,
            "floors" => $floors
        ];

        if($jsonEncode) return json_encode($buildingJson);
        return $buildingJson;
    }

    /**
     * @return int
     */
    public function getHeight()
    {
        $buildingHeight = 0;
        foreach($this->floors as $floor) {
            $buildingHeight += $floor->height;
        }
        return $buildingHeight;
    }

    /**
     * @return int
     */
    public function getWidth()
    {
        $buildingWidth = 0;
        foreach($this->floors as $floor) {
            $floorWidth = $floor->getWidth();
            if($floorWidth > $buildingWidth) {
                $buildingWidth = $floorWidth;
            }
        }
        return $buildingWidth;
    }

    /**
     * @return int
     */
    public function getLength()
    {
        $buildingLength = 0;
        foreach($this->floors as $floor) {
            $floorLength = $floor->getLength();
            if($floorLength > $buildingLength) {
                $buildingLength = $floorLength;
            }
        }
        return $buildingLength;
    }

    /**
     * @return float
     */
    public function getGPSWidth()
    {
        $width = $this->haversineGreatCircleDistance($this->latitude, $this->longitude, $this->latitude2, $this->longitude2);
        return round($width, 2);
    }

    /**
     * @return float
     */
    public function getGPSLength()
    {
        $length = $this->haversineGreatCircleDistance($this->latitude2, $this->longitude2, $this->latitude3, $this->longitude3);
        return round($length, 2);
    }

    /**
     * @return int|string
     */
    public function getScaleFactorLength()
    {
        if($this->scale_by == 'unscaled') return 1;
        $computedLength = $this->getLength();
        if(empty($computedLength)) return 1;
        $length = $this->getGPSLength();
        if(empty($length)) return 1;
        return number_format($length / $computedLength, 2, ".", "");

    }

    /**
     * @return int|string
     */
    public function getScaleFactorHeight()
    {
        if($this->scale_by == 'unscaled') return 1;
        if(empty($this->height) || $this->getHeight()) return 1;
        return number_format($this->height / $this->getHeight(), 2, ".", "");
    }

    /**
     * @return int|string
     */
    public function getScaleFactorWidth()
    {
        if($this->scale_by == 'unscaled') return 1;
        $computedWidth = $this->getWidth();
        if(empty($computedWidth)) return 1;
        $width = $this->getGPSWidth();
        if(empty($width)) return 1;
        return number_format($width / $computedWidth, 2, ".", "");
    }

    /**
     *
     */
    public function getRotation() {

    }

    /**
     * @param $latitudeFrom
     * @param $longitudeFrom
     * @param $latitudeTo
     * @param $longitudeTo
     * @param int $earthRadius
     * @return int
     */
    public function haversineGreatCircleDistance($latitudeFrom, $longitudeFrom, $latitudeTo, $longitudeTo, $earthRadius = 6371000)
    {
        // convert from degrees to radians
        $latFrom = deg2rad($latitudeFrom);
        $lonFrom = deg2rad($longitudeFrom);
        $latTo = deg2rad($latitudeTo);
        $lonTo = deg2rad($longitudeTo);

        $latDelta = $latTo - $latFrom;
        $lonDelta = $lonTo - $lonFrom;

        $angle = 2 * asin(sqrt(pow(sin($latDelta / 2), 2) +
                cos($latFrom) * cos($latTo) * pow(sin($lonDelta / 2), 2)));
        return $angle * $earthRadius;
    }

    /**
     * @return array
     */
    public static function getAllJson()
    {
        $buildings = [];
        foreach (Building::all() as $building) {
            $buildings[] = $building->jsonify(false);
        }
        return $buildings;
    }
}
