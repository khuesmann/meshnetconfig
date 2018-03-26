@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Edit mappings <i>{{$mapping->name}}</i>
                    <a class="btn  btn-default pull-right" href="{{route('mapping.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>
                <form action="{{route('mapping.update', $mapping->id)}}" method="post">
                    {!! csrf_field() !!}
                    @include('mapping.form')
                    <div class="form-group">
                        <button type="submit" class="btn  btn-success">Update</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

@stop