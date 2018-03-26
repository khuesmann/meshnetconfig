@extends('layout.layout', ['noVue'=>true])

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Experiment <i>{{$experiment->name}}</i>
                    <div class="btn-group pull-right">
                        @if(!empty($experiment->getAnalysis()))
                            <a class="btn btn-success" href="{{$experiment->viewerUrl()}}">Show Experiment</a>
                        @endif
                        <a class="btn  btn-default " href="{{route('experiment.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                    </div>
                </h1>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>General experiment information</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <th>ID:</th>
                                <td>{{ $experiment->id  }}</td>
                            </tr>
                            <tr>
                                <th>Name:</th>
                                <td>{{ $experiment->name  }}</td>
                            </tr>
                            <tr>
                                <th>Mapping</th>
                                <td>{{$experiment->mapping->name}}</td>
                            </tr>
                            <tr>
                                <th>XML</th>
                                <td>{{$experiment->getXml()}}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <a class="btn  btn-default" href="{{route('experiment.edit', $experiment->id)}}"><i class="glyphicon glyphicon-pencil"></i></a>

                        <div class="btn-group pull-right">
                            <a class="btn  btn-info" href="{{route('experiment.analyze', $experiment->id)}}"><i class="glyphicon glyphicon-eye-open"></i> analyze</a>
                        </div>
                    </div>
                </div>



            @if(!empty($experiment->getAnalysis()))
                    <div class="panel panel-default">
                        <div class="panel-heading"><h4>Analysis</h4></div>
                        <div class="panel-body">

                            <table class="table">
                                <tr>
                                    <th>General information</th>
                                    <td>{{ dump($experiment->getAnalysis()['general'])  }}</td>
                                </tr>
                                <tr>
                                    <th>Nodes</th>
                                    <td>{{ dump($experiment->getAnalysis()['nodes'])  }}</td>
                                </tr>
                                <tr>
                                    <th>Results</th>
                                    <td>
                                        In this XML there are {{ count($experiment->getAnalysis()['results'])  }} results.<br>
                                        Example:
                                        {{dump(array_shift($experiment->getAnalysis()['results']))}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Scan results</th>
                                    <td>
                                        In this XML there are {{count($experiment->getAnalysis()['scan_results'])}} scan results.<br>
                                        Example:
                                        {{dump(array_shift($experiment->getAnalysis()['scan_results']))}}
                                    </td>
                                </tr>
                                <tr>
                                    <th>Possible metrics</th>
                                    <td>
                                        Possible metrics found in results<br>
                                        Example:
                                        {{dump($experiment->getAnalysis()['metrics'])}}
                                    </td>
                                </tr>
                            </table>

                        </div>
                    </div>
                @endif

                <hr class="m-b-60 m-t-60">

                <div class="text-center">
                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$experiment->name}}</b>?" data-confirm-title="Delete Experiment" href="{{route('experiment.destroy', $experiment->id)}}"><i class="glyphicon glyphicon-trash"></i> delete experiment</a>
                </div>

            </div>
        </div>
    </div>

@stop