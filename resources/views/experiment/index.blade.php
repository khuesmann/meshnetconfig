@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    All XML Experiments

                    <a class="btn  btn-default pull-right" href="{{route('experiment.create')}}"><i class="glyphicon glyphicon-plus"></i> Create experiment</a>
                </h1>

                <table class="table">
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Created at</th>
                        <th>&nbsp;</th>
                    </tr>

                    @forelse($experiments as $experiment)
                        <tr>
                            <td>{{$experiment->id}}</td>
                            <td>{{$experiment->name}}</td>
                            <td>{{$experiment->created_at}}</td>
                            <td>
                                <div class="btn-group pull-right">
                                    <a class="btn btn-info" href="{{env('VIEWER_URL') . "?experimentId=" . $experiment->id}}"><i class="glyphicon glyphicon-sunglasses"></i> Show</a>
                                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$experiment->name}}</b>?" data-confirm-title="Delete Experiment" href="{{route('experiment.destroy', $experiment->id)}}"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a class="btn  btn-success" href="{{route('experiment.show', $experiment->id)}}"><i class="glyphicon glyphicon-edit"></i></a>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="3">No entries yet</td>
                        </tr>
                    @endforelse
                </table>

            </div>
        </div>
    </div>

@stop