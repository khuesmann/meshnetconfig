<?php

namespace App\Http\Controllers;

use App\Http\Requests\RoomFormRequest;
use App\Models\Building\Building;
use App\Models\Building\Floor;
use App\Models\Building\Room;

class RoomController extends Controller
{
    /**
     * Show the form for creating a new resource.
     *
     * @param Floor $floor
     * @return \Illuminate\Http\Response
     */
    public function create(Floor $floor)
    {
        return view('room.create')->with([
            'floor' => $floor
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  RoomFormRequest  $request
     * @param  Room  $room
     * @return Room|\Illuminate\Http\Response
     */
    public function store(RoomFormRequest $request, Room $room)
    {
        $room->fill($request->all());
        $room->save();
        if($request->ajax()) return $room;
        return redirect(route('room.show', $room->id));
    }

    /**
     * Display the specified resource.
     *
     * @param  Room  $room
     * @return \Illuminate\Http\Response
     */
    public function show(Room $room)
    {
        return view('room.show')->with([
            'room' => $room
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Room  $room
     * @return \Illuminate\Http\Response
     */
    public function edit(Room $room)
    {
        return view('room.edit')->with([
            'room' => $room
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param RoomFormRequest $request
     * @param  Room $room
     * @return \Illuminate\Http\Response
     */
    public function update(RoomFormRequest $request, Room $room)
    {
        $room->fill($request->all());
        $room->save();
        return redirect(route('room.show', $room->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Room  $room
     * @return \Illuminate\Http\Response
     */
    public function destroy(Room $room)
    {
        $room->delete();
        return redirect(route('floor.show', $room->floor->id));
    }
}
