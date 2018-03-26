@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Floor <i>{{$floor->name}}</i> <small>(Building: {{$floor->building->name}})</small>

                    <a class="btn  btn-default pull-right" href="{{route('building.show', $floor->building->id)}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>

                </h1>

                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>General floor information</h4>
                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <th>Floor name:</th>
                                        <td>{{ $floor->name  }}</td>
                                    </tr>
                                    <tr>
                                        <th>Floor number:</th>
                                        <td>{{$floor->level}} </td>
                                    </tr>
                                    <tr>
                                        <th>Floor height:</th>
                                        <td>{{$floor->height}}</td>
                                    </tr>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <a class="btn  btn-default" href="{{route('floor.edit', $floor->id)}}"><i class="glyphicon glyphicon-pencil"></i> Edit floor</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>Rooms</h4>
                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <th>Room name</th>
                                        <th>Grid start (x, z)</th>
                                        <th>Grid stop (x, z)</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    @forelse($floor->rooms as $room)
                                        <tr>
                                            <td>{{$room->name}}</td>
                                            <td>{{$room->grid_start_x}}, {{$room->grid_start_z}}</td>
                                            <td>{{$room->grid_stop_x}}, {{$room->grid_stop_z}}</td>

                                            <td>
                                                <div class="btn-group pull-right">
                                                    <a class="btn btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$room->name}}</b>?" data-confirm-title="Delete Room" href="{{route('room.destroy', $room->id)}}"><i class="glyphicon glyphicon-trash"></i></a>
                                                    <a href="{{route('room.show', $room->id)}}" class="btn  btn-success"><i class="glyphicon glyphicon-edit"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="4">no entries yet</td>
                                        </tr>
                                    @endforelse
                                </table>
                            </div>
                            <div class="panel-footer">
                                <a class="btn  btn-default" href="{{route('room.create', $floor->id)}}"><i class="glyphicon glyphicon-plus"></i> Add room</a>
                            </div>
                        </div>
                    </div>
                </div>



                <hr class="m-b-60 m-t-60">

                <div class="text-center">
                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$floor->name}}</b>?" data-confirm-title="Delete Floor" href="{{route('floor.destroy', $floor->id)}}"><i class="glyphicon glyphicon-trash"></i> delete floor</a>
                </div>

            </div>
        </div>
    </div>

@stop