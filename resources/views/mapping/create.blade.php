@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Create Mapping

                    <a class="btn  btn-default pull-right" href="{{route('mapping.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>

                <form action="{{route('mapping.store')}}" method="post">
                    {!! csrf_field() !!}
                    @include('mapping.form', ['mapping' => new \App\Models\Mapping()])
                    <div class="form-group">
                        <button type="submit" class="btn  btn-success">Create</button>
                    </div>
                </form>


            </div>
        </div>
    </div>

@stop