@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    All Rooms

                    <a class="btn  btn-default pull-right" href="{{route('room.create')}}"><i class="glyphicon glyphicon-plus"></i> Create room</a>
                </h1>

                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th># Rooms</th>
                        <th>&nbsp;</th>
                    </tr>

                    @foreach($rooms as $room)
                        <tr>
                            <td>{{$room->name}}</td>
                            <td>{{$room->rooms->count()}}</td>
                            <td>
                                <div class="btn-group pull-right">
                                    @if( ! $room->is_active)
                                        <a class="btn  btn-default"><i class="glyphicon glyphicon-unchecked"></i></a>
                                    @else
                                        <a class="btn  btn-info"><i class="glyphicon glyphicon-check"></i></a>
                                    @endif
                                    <a class="btn  btn-success" href="{{route('room.show', $room->id)}}"><i class="glyphicon glyphicon-edit"></i></a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </table>

            </div>
        </div>
    </div>

@stop