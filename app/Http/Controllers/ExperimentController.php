<?php

namespace App\Http\Controllers;

use App\Http\Requests\ExperimentFormRequest;
use App\Models\Building\Building;
use App\Models\Building\Room;
use App\Models\Experiment;
use App\Models\Mapping;
use Illuminate\Http\Request;
use Illuminate\Http\Response;

class ExperimentController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function index()
    {
        return view('experiment.index')->with([
            'experiments' => Experiment::orderBy('created_at', 'desc')->get()
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function create()
    {
        return view('experiment.create')->with([
            'mappings' => Mapping::orderBy('name', 'asc')->get()
        ]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  ExperimentFormRequest $request
     * @param  Experiment $experiment
     * @return \Illuminate\Http\Response
     */
    public function store(ExperimentFormRequest $request, Experiment $experiment)
    {
        $experiment->fill($request->all());
        $experiment->save();
        if(!empty($request->file('xml_file'))) {
            $experiment->saveXml($request->file('xml_file'));
            $experiment->createAnalysis();
        }
        return redirect(route('experiment.show', $experiment->id));
    }

    public function storeQuick(Request $request, Experiment $experiment)
    {
        if(Mapping::getActive() == null) return response('no default mapping configured');
        if(!empty($request->get('ext_id'))) {
            $existingExperiment = Experiment::where('ext_id', $request->get('ext_id'))->first();
            if($existingExperiment != null) {
                return redirect(env('VIEWER_URL') . "?experimentId=" . $existingExperiment->id);
            }
        }
        $experiment->name = "QuickStart Experiment - " . date("Y/m/d H:i", time());
        $experiment->mapping_id = Mapping::getActive()->id;
        $experiment->ext_id = $request->get('ext_id');
        if(!empty($request->get('config'))) {
            $configExperiment = Experiment::find($request->get('config'));
            $experiment->config = json_encode($configExperiment->getConfigSettings());
        }
        $experiment->save();
        $experiment->saveXml($request->file('xml_file'));
        $experiment->createAnalysis();
        return redirect(env('VIEWER_URL') . "?experimentId=" . $experiment->id);
    }

    /**
     * Display the specified resource.
     *
     * @param  Experiment $experiment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function show(Experiment $experiment)
    {
        return view('experiment.show')->with([
            'experiment' => $experiment,

        ]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Experiment $experiment
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
    public function edit(Experiment $experiment)
    {
        return view('experiment.edit')->with([
            'experiment' => $experiment,
            'mappings' => Mapping::orderBy('name', 'asc')->get()

        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param ExperimentFormRequest $request
     * @param  Experiment $experiment
     * @return \Illuminate\Http\Response
     */
    public function update(ExperimentFormRequest $request, Experiment $experiment)
    {
        $experiment->fill($request->all());
        $experiment->save();
        $experiment->saveXml($request->file('xml_file'));
        $experiment->createAnalysis();
        return redirect(route('experiment.show', $experiment->id));
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Experiment $experiment
     * @return \Illuminate\Http\Response
     */
    public function destroy(Experiment $experiment)
    {
        $experiment->delete();
        $experiment->deleteFiles();
        return redirect(route('experiment.index'));
    }

    public function analyze(Experiment $experiment)
    {
        if(!empty($experiment->raw_experiment)) {
            $experiment->createAnalysis();
        }
        return redirect(route('experiment.show', $experiment->id));
    }

    public function fetch(Experiment $experiment)
    {
        ini_set('memory_limit', '4G');
        return response()->json($experiment->getAnalysis());
    }

    public function fetchAll()
    {
        return response()->json(Experiment::orderBy('created_at', 'desc')->get());
    }

    public function saveData(Request $request, Experiment $experiment)
    {
        $experiment->config = json_encode($request->get('persist'));
        $experiment->save();
        return new Response("saved");
    }

    public function load(Request $request, Experiment $experiment) {
        $experiment->is_active = true;
        $experiment->save();
        return \Redirect::back();
    }

    public function quickStart(Request $request)
    {
        return view('experiment.quickStart')->with([
            'configuredExperiments' => Experiment::whereNotNull('config')->orderBy('updated_at', 'desc')->get()
        ]);
    }

    public function fetchConfig(Experiment $experiment)
    {
        return $experiment->config;
    }
}
