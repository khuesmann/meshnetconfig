<?php

use App\Models\Building\Floor;
use Illuminate\Database\Seeder;

class BuildingSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('buildings')->delete();

        $buildings[] = \App\Models\Building\Building::create([
            'name' => 'Einsteinstraße 62',
            'latitude' => 51.965828,
            'longitude' => 7.603257,
            'latitude2' => 51.966257,
            'longitude2' => 7.603248,
            'latitude3' => 51.966254,
            'longitude3' => 7.603458,
            'scale_by' => 'gps'
        ]);
    }
}
