@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    All XML Mappings

                    <a class="btn  btn-default pull-right" href="{{route('mapping.create')}}"><i class="glyphicon glyphicon-plus"></i> Create mapping</a>
                </h1>

                <table class="table">
                    <tr>
                        <th>Name</th>
                        <th>&nbsp;</th>
                    </tr>

                    @forelse($mappings as $mapping)
                        <tr>
                            <td>{{$mapping->name}}</td>
                            <td>
                                <div class="btn-group pull-right">
                                    @if( ! $mapping->is_active)
                                        <a class="btn  btn-default"><i class="glyphicon glyphicon-unchecked"></i></a>
                                    @else
                                        <a class="btn  btn-info" href="{{route('mapping.activate', ["mapping" => $mapping->id, "state" => false])}}"><i class="glyphicon glyphicon-check"></i></a>
                                    @endif
                                    <a class="btn  btn-danger" href="{{route('mapping.destroy', $mapping->id)}}"><i class="glyphicon glyphicon-trash"></i></a>
                                    <a class="btn  btn-success" href="{{route('mapping.edit', $mapping->id)}}"><i class="glyphicon glyphicon-edit"></i></a>
                                </div>
                            </td>
                        </tr>
                    @empty
                        <tr>
                            <td colspan="3">No entries yet</td>
                        </tr>
                    @endforelse
                </table>

            </div>
        </div>
    </div>

@stop