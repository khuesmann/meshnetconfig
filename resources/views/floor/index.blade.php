@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    All Floors

                    <a class="btn  btn-default pull-right" href="{{route('floor.create')}}"><i class="glyphicon glyphicon-plus"></i> Create floor</a>
                </h1>

                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th># Floors</th>
                        <th>&nbsp;</th>
                    </tr>

                    @foreach($floors as $floor)
                        <tr>
                            <td>{{$floor->name}}</td>
                            <td>{{$floor->floors->count()}}</td>
                            <td>
                                <div class="btn-group pull-right">
                                    @if( ! $floor->is_active)
                                        <a class="btn  btn-default"><i class="glyphicon glyphicon-unchecked"></i></a>
                                    @else
                                        <a class="btn  btn-info"><i class="glyphicon glyphicon-check"></i></a>
                                    @endif
                                    <a class="btn  btn-success" href="{{route('floor.show', $floor->id)}}"><i class="glyphicon glyphicon-edit"></i></a>
                                </div>
                            </td>
                        </tr>
                    @endforeach
                </table>

            </div>
        </div>
    </div>

@stop