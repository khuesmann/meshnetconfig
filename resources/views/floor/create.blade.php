@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Create Floor for <i>{{$building->name}}</i>

                    <a class="btn  btn-default pull-right" href="{{route('building.show', $building->id)}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>
                <div class="well">
                    <form action="{{route('floor.store')}}" method="post">
                        {!! csrf_field() !!}
                        <input type="hidden" name="building_id" value="{{$building->id}}">
                        @include('floor.form', ['floor' => new \App\Models\Building\Floor()])
                        <div class="form-group">
                            <button type="submit" class="btn  btn-success">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop