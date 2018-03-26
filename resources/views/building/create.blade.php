@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Create Building
                    <a class="btn  btn-default pull-right" href="{{route('building.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>
                <div class="well">
                    <form action="{{route('building.store')}}" method="post">
                        {!! csrf_field() !!}
                        @include('building.form', ['building' => new \App\Models\Building\Building()])
                        <div class="form-group">
                            <button type="submit" class="btn  btn-success">Create</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop