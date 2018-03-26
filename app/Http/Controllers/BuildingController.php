<?php

namespace App\Http\Controllers;

use App\Http\Requests\BuildingFormRequest;
use App\Models\Building\Building;
use Illuminate\Http\Response;

class BuildingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        return view('building.index')->with([
            'buildings' => Building::orderBy('name')->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('building.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  BuildingFormRequest  $request
     * @param  Building  $building
     * @return \Illuminate\Http\Response
     */
    public function store(BuildingFormRequest $request, Building $building)
    {
        $building->fill($request->all());
        $building->save();
        return redirect(route('building.show', $building->id));
    }

    /**
     * Display the specified resource.
     *
     * @param  Building  $building
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Building $building)
    {
        return view('building.show')->with([
            'building' => $building
        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Building  $building
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Building $building)
    {
        return view('building.edit')->with([
            'building' => $building
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param BuildingFormRequest $request
     * @param  Building $building
     * @return \Illuminate\Http\Response
     */
    public function update(BuildingFormRequest $request, Building $building)
    {
        $building->fill($request->all());
        $building->save();
        return redirect(route('building.show', $building->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Building  $building
     * @return \Illuminate\Http\Response
     */
    public function destroy(Building $building)
    {
        $building->delete();
        return redirect(route('building.index'));
    }

    /**
     * Returns the building data in desired JSON format
     * @param Building $building
     * @return Response
     */
    public function fetch()
    {
        return response()->json(Building::getAllBuildings());
    }
}
