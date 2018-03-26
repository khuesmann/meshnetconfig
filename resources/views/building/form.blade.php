<div class="form-group {!! hasError('name', $errors) !!}">
    <label class="control-label" for="buildingName">
        Name
    </label>
    <input class="form-control" type="text" value="{{old('name', $building->name)}}" name="name" id="buildingName">
    <span class="help-block">{{$errors->first('name')}}</span>
</div>

<div class="form-group {!! hasError('is_active', $errors) !!}">
    <label class="control-label" for="buildinIsActive">
        Is active ?
    </label>
    <div>
        <input {!! isChecked(old('is_active', $building->is_active), 1) !!}  type="radio" value="1" name="is_active" id="buildinIsActive"> Yes <br>
        <input {!! isChecked(old('is_active', $building->is_active), 0) !!} type="radio" value="0" name="is_active" id="buildinIsActive"> No <br>
    </div>
    <span class="help-block">{{$errors->first('is_active')}}</span>
</div>

<div class="form-group {!! hasError('scale_by', $errors) !!}">
    <label class="control-label">
        Scale by
    </label>
    <div>
    @foreach(\App\Models\Building\Building::SCALE_TYPE_ENUM as $scaleTypeValue => $scaleTypeName)
            <input {!! isChecked(old('scale_by', $building->scale_by), $scaleTypeValue) !!}  type="radio" value="{{$scaleTypeValue}}" name="scale_by"> {{$scaleTypeName}} <br>
        @endforeach
{{--        <input {!! isChecked(old('scale_by', $building->scale_by), 'gps') !!} type="radio" value="0" name="scale_by"> GPS <br>--}}
{{--        <input {!! isChecked(old('scale_by', $building->scale_by), 'lwh') !!} type="radio" value="0" name="scale_by" > Length/Width/Height <br>--}}
    </div>
    <span class="help-block">{{$errors->first('scale_by')}}</span>
</div>

<div class="row">
    <div class="col-sm-12">
        <h3>GPS information</h3>
    </div>
    <div class="col-sm-9">
        <div class="row">
            <div class="col-md-6">
                <div class="form-group {!! hasError('latitude', $errors) !!}">
                    <label class="control-label" for="latitude">
                        GPS1 latitude
                    </label>
                    <input class="form-control" type="text" value="{{old('latitude', $building->latitude)}}" name="latitude" id="latitude">
                    <span class="help-block">{{$errors->first('latitude')}}</span>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group {!! hasError('longitude', $errors) !!}">
                    <label class="control-label" for="longitude">
                        GPS1 longitude
                    </label>
                    <input class="form-control" type="text" value="{{old('longitude', $building->longitude)}}" name="longitude" id="longitude">
                    <span class="help-block">{{$errors->first('longitude')}}</span>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group {!! hasError('latitude2', $errors) !!}">
                    <label class="control-label" for="latitude2">
                        GPS2 latitude
                    </label>
                    <input class="form-control" type="text" value="{{old('latitude2', $building->latitude2)}}" name="latitude2" id="latitude2">
                    <span class="help-block">{{$errors->first('latitude2')}}</span>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group {!! hasError('longitude2', $errors) !!}">
                    <label class="control-label" for="longitude2">
                        GPS2 longitude
                    </label>
                    <input class="form-control" type="text" value="{{old('longitude2', $building->longitude2)}}" name="longitude2" id="longitude2">
                    <span class="help-block">{{$errors->first('longitude2')}}</span>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group {!! hasError('latitude3', $errors) !!}">
                    <label class="control-label" for="latitude3">
                        GPS3 latitude
                    </label>
                    <input class="form-control" type="text" value="{{old('latitude3', $building->latitude3)}}" name="latitude3" id="latitude3">
                    <span class="help-block">{{$errors->first('latitude3')}}</span>
                </div>
            </div>
            <div class="col-md-6">
                <div class="form-group {!! hasError('longitude3', $errors) !!}">
                    <label class="control-label" for="longitude3">
                        GPS3 longitude
                    </label>
                    <input class="form-control" type="text" value="{{old('longitude3', $building->longitude3)}}" name="longitude3" id="longitude3">
                    <span class="help-block">{{$errors->first('longitude3')}}</span>
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-3">
        <img src="/img/building_gps.jpg" class="img-responsive">
        <p class="text-right">Image source: <a href="https://www.openstreetmap.de" target="_blank">OpenStreetMap</a></p>
        <p>
            <b>Rules:</b> <br>
            z(GPS1) < z(GPS2) <br>
            x(GPS2) < x(GPS3)
        </p>
        <p>
            <small>
                <ul>
                    <li>z-value of <i>GPS1</i> has to be smaller than z-value of <i>GPS2</i></li>
                    <li>x-value of <i>GPS2</i> has to be smaller than x-value of <i>GPS3</i></li>
                    <li><i>GPS2</i> has to be 'between' <i>GPS1</i> and <i>GPS2</i></li>
                    <li>You can use <a href="https://maps.google.com" target="_blank">Maps</a> to find out desired latitude/longitude</li>
                </ul>
            </small>
        </p>
    </div>
</div>