@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Room <i>{{$room->name}}</i> <small>(Floor: {{$room->floor->name}}, Building: {{$room->floor->building->name}})</small>
                    <a class="btn  btn-default pull-right" href="{{route('floor.show', $room->floor->id)}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        <h4>General room information</h4>
                    </div>
                    <div class="panel-body">
                        <table class="table">
                            <tr>
                                <th>Name</th>
                                <td>{{ $room->name  }} </td>
                            </tr>
                            <tr>
                                <th>Grid start (x,z)</th>
                                <td>{{$room->grid_start_x}}, {{$room->grid_start_z}}</td>
                            </tr>
                            <tr>
                                <th>Grid stop (x,z)</th>
                                <td>{{$room->grid_stop_x}}, {{$room->grid_stop_z}}</td>
                            </tr>
                            <tr>
                                <th>Color (r,g,b,a)</th>
                                <td>{{$room->color_r}}, {{$room->color_g}}, {{$room->color_b}}, {{$room->color_a}}</td>
                            </tr>
                        </table>
                    </div>
                    <div class="panel-footer">
                        <a class="btn  btn-default" href="{{route('room.edit', $room->id)}}"><i class="glyphicon glyphicon-pencil"></i> Edit room</a>
                    </div>
                </div>

                <hr class="m-b-60 m-t-60">

                <div class="text-center">
                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$room->name}}</b>?" data-confirm-title="Delete Room" href="{{route('room.destroy', $room->id)}}"><i class="glyphicon glyphicon-trash"></i> delete room</a>
                </div>

            </div>
        </div>
    </div>

@stop