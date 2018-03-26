@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Edit room <i>{{$room->name}}</i>

                    <a class="btn  btn-default pull-right" href="{{route('room.show', $room->id)}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>

                </h1>

                <div class="well">
                    <form action="{{route('room.update', $room->id)}}" method="post">
                        {!! csrf_field() !!}
                        @include('room.form')
                        <div class="form-group">
                            <button type="submit" class="btn  btn-success">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop