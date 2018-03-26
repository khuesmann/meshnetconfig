<?php

namespace App\Http\Controllers;

use App\Http\Requests\FloorFormRequest;
use App\Models\Building\Building;
use App\Models\Building\Floor;

class FloorController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Building $building)
    {
        return view('floor.create')->with([
            'building' => $building
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  FloorFormRequest  $request
     * @param  Floor  $floor
     * @return \Illuminate\Http\Response
     */
    public function store(FloorFormRequest $request, Floor $floor)
    {
        $floor->fill($request->all());
        $floor->save();
        return redirect(route('floor.show', $floor->id));
    }

    /**
     * Display the specified resource.
     *
     * @param  Floor  $floor
     * @return \Illuminate\Http\Response
     */
    public function show(Floor $floor)
    {
        return view('floor.show')->with([
            'floor' => $floor
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Floor  $floor
     * @return \Illuminate\Http\Response
     */
    public function edit(Floor $floor)
    {
        return view('floor.edit')->with([
            'floor' => $floor
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param FloorFormRequest $request
     * @param  Floor $floor
     * @return \Illuminate\Http\Response
     */
    public function update(FloorFormRequest $request, Floor $floor)
    {
        $floor->fill($request->all());
        $floor->save();
        return redirect(route('floor.show', $floor->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Floor  $floor
     * @return \Illuminate\Http\Response
     */
    public function destroy(Floor $floor)
    {
        $building = $floor->building;
        $floor->delete();
        return redirect(route('building.show', $building->id));
    }

    public function cloneFloor(Floor $floor)
    {
        // clone selected floor, rename it, increase and floor number
        $clonedFloor = $floor->replicate();
        $clonedFloor->name .= ' (cloned)';
        $clonedFloor->level++;
        $clonedFloor->push();

        // clone selected floors, too, and set their floor to the new clone
        foreach($floor->rooms as $room) {
            $clonedRoom = $room->replicate();
            $clonedRoom->floor_id = $clonedFloor->id;
            $clonedRoom->push();
        }

        return redirect(route('building.show', $floor->building->id));
    }
}
