@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Experiment QuickStart
                </h1>
                <h4>You only have to insert your XML-Experiment, everything else will be set automatically.</h4>
                <form action="{{route('experiment.storeQuick')}}" method="post" enctype="multipart/form-data">
                    {!! csrf_field() !!}
                    @include('experiment.quickstartForm')
                </form>
            </div>
        </div>
    </div>

@stop