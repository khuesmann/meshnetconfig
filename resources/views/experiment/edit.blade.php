@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Edit experiments <i>{{$experiment->name}}</i>

                    <a class="btn  btn-default pull-right" href="{{route('experiment.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>

                </h1>
                <div class="well">
                    <form action="{{route('experiment.update', $experiment->id)}}" enctype="multipart/form-data" method="post">
                        {!! csrf_field() !!}
                        @include('experiment.form')
                        <div class="form-group">
                            <button type="submit" class="btn  btn-success">Update</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

@stop