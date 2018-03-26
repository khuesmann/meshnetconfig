@extends('layout.layout')

@section('content')

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h1>
                    Building <i>{{$building->name}}</i>
                    <a class="btn  btn-default pull-right" href="{{route('building.index')}}"><i class="glyphicon glyphicon-arrow-left"></i> back</a>
                </h1>
                <div class="row">
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>General building information</h4>
                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <th>Building name</th>
                                        <td>{{ $building->name  }}</td>
                                    </tr>
                                    <tr>
                                        <th>Building length / width / height <small>(meters)</small></th>
                                        <td>{{ $building->getGPSLength()  }} / {{ $building->getGPSWidth()  }} / {{ $building->getHeight()  }}</td>
                                    </tr>
                                    <tr>
                                        <th>ConstructedBuilding length / width / height <small>(meters)</small></th>
                                        <td>{{ $building->getLength()  }} / {{ $building->getWidth()  }} / {{ $building->getHeight()  }}</td>
                                    </tr>
                                    <tr>
                                        <th>Building GPS</th>
                                        <td>
                                            {{ $building->latitude  }}, {{ $building->longitude  }} <br>
                                            {{ $building->latitude2  }}, {{ $building->longitude2  }} <br>
                                            {{ $building->latitude3  }}, {{ $building->longitude3  }}
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Scaled by</th>
                                        <td>
                                            {{ \App\Models\Building\Building::SCALE_TYPE_ENUM[$building->scale_by] }} <br>
                                            <small>scale facors: {{$building->getScaleFactorLength()}} x {{$building->getScaleFactorWidth()}} x 3</small>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                            <div class="panel-footer">
                                <a class="btn  btn-default" href="{{route('building.edit', $building->id)}}"><i class="glyphicon glyphicon-pencil"></i> Edit  building</a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4>Floors</h4>
                            </div>
                            <div class="panel-body">
                                <table class="table">
                                    <tr>
                                        <th>Floor name</th>
                                        <th>Floor number</th>
                                        <th># Rooms</th>
                                        <th>&nbsp;</th>
                                    </tr>
                                    @forelse($building->floors as $floor)
                                        <tr>
                                            <td>{{$floor->name}}</td>
                                            <td>{{$floor->level}}</td>
                                            <td>{{$floor->rooms->count()}}</td>
                                            <td>
                                                <div class="btn-group pull-right">
                                                    <a title="Clone" data-toggle="tooltip" class="btn  btn-default" href="{{route('floor.clone', $floor->id)}}"><i class="glyphicon glyphicon-copy"></i></a>
                                                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$floor->name}}</b>?" data-confirm-title="Delete Floor" href="{{route('floor.destroy', $floor->id)}}"><i class="glyphicon glyphicon-trash"></i></a>
                                                    <a href="{{route('floor.show', $floor->id)}}" class="btn  btn-success"><i class="glyphicon glyphicon-edit"></i></a>
                                                </div>
                                            </td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="4">no floors added yet</td>
                                        </tr>
                                    @endforelse
                                </table>
                            </div>
                            <div class="panel-footer">
                                <a class="btn  btn-default" href="{{route('floor.create', $building->id)}}"><i class="glyphicon glyphicon-plus"></i> Add Floor</a>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="m-b-60 m-t-60">
                <div class="text-center">
                    <a class="btn  btn-danger confirmer" data-confirm-content="Do you really want to delete <b>{{$building->name}}</b>?" data-confirm-title="Delete Building" href="{{route('building.destroy', $building->id)}}"><i class="glyphicon glyphicon-trash"></i> delete building</a>
                </div>
            </div>
        </div>
    </div>

@stop