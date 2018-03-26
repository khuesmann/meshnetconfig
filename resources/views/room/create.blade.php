@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Create Room for <i>{{$floor->name}}</i>
                    <a class="btn  btn-default pull-right" href="{{route('floor.show', $floor->id)}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>
            </div>
            <div class="col-sm-8">
                <div class="well">
                    <form action="{{route('room.store')}}" method="post">
                        {!! csrf_field() !!}
                        <input type="hidden" name="floor_id" value="{{$floor->id}}">
                        @include('room.form', ['room' => new \App\Models\Building\Room()])
                        <div class="form-group">
                            <button type="submit" class="btn  btn-success">Create</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-4" style="position: inherit;">
                    <room-manager createroute="{{route('room.store')}}" :floor="{{$floor}}"></room-manager>
            </div>
        </div>
    </div>

@stop