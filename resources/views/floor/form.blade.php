<div class="row">
    <div class="col-sm-4">
        <div class="form-group {!! hasError('name', $errors) !!}">
            <label class="control-label" for="floorName">
                Name
            </label>
            <input class="form-control" type="text" value="{{old('name', $floor->name)}}" name="name" id="floorName">
            <span class="help-block">{{$errors->first('name')}}</span>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group {!! hasError('level', $errors) !!}">
            <label class="control-label" for="level">
                Level
            </label>
            <input class="form-control" type="text" value="{{old('level', $floor->level)}}" name="level" id="level">
            <span class="help-block">{{$errors->first('level')}}</span>
        </div>
    </div>
    <div class="col-sm-4">
        <div class="form-group {!! hasError('height', $errors) !!}">
            <label class="control-label" for="height">
                Room height (meters)
            </label>
            <input class="form-control" type="text" value="{{old('height', $floor->height)}}" name="height" id="height">
            <span class="help-block">{{$errors->first('height')}}</span>
        </div>
    </div>
</div>