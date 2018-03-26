@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    All Buildings

                    <a class="btn  btn-default pull-right" href="{{route('building.create')}}"><i class="glyphicon glyphicon-plus"></i> Create building</a>
                </h1>

                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th># Floors</th>
                        <th>&nbsp;</th>
                    </tr>

                    @forelse($buildings as $building)
                        <tr>
                            <td>{{$building->name}}</td>
                            <td>{{$building->floors->count()}}</td>
                            <td>
                                <div class="btn-group pull-right">
                                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$building->name}}</b>?" data-confirm-title="Delete Building" href="{{route('building.destroy', $building->id)}}"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a class="btn  btn-success" href="{{route('building.show', $building->id)}}"><i class="glyphicon glyphicon-edit"></i></a>
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