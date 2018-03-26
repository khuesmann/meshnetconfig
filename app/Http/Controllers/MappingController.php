<?php

namespace App\Http\Controllers;

use App\Http\Requests\MappingFormRequest;
use App\Models\Mapping;

class MappingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return view('mapping.index')->with([
            'mappings' => Mapping::orderBy('name')->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('mapping.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  MappingFormRequest  $request
     * @param  Mapping  $mapping
     * @return \Illuminate\Http\Response
     */
    public function store(MappingFormRequest $request, Mapping $mapping)
    {
        $mapping->fill($request->all());
        $mapping->save();
        return redirect(route('mapping.edit', $mapping->id));
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Mapping  $mapping
     * @return \Illuminate\Http\Response
     */
    public function edit(Mapping $mapping)
    {
        return view('mapping.edit')->with([
            'mapping' => $mapping
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param MappingFormRequest $request
     * @param  Mapping $mapping
     * @return \Illuminate\Http\Response
     */
    public function update(MappingFormRequest $request, Mapping $mapping)
    {
        $mapping->fill($request->all());
        $mapping->save();
        return redirect(route('mapping.edit', $mapping->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Mapping  $mapping
     * @return \Illuminate\Http\Response
     */
    public function destroy(Mapping $mapping)
    {
        $mapping->delete();
        return redirect(route('mapping.index'));
    }

    public function activate(Mapping $mapping, $state = true)
    {
        $mapping->is_active = $state;
        $mapping->save();
        
        return redirect(route('mapping.index'));
    }
}
