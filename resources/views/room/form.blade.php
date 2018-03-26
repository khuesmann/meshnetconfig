<div class="row">
    <div class="col-sm-12">
        <div class="form-group {!! hasError('name', $errors) !!}">
            <label class="control-label" for="roomName">
                Name
            </label>
            <input class="form-control" type="text" value="{{old('name', $room->name)}}" name="name" id="roomName">
            <span class="help-block">{{$errors->first('name')}}</span>
        </div>
    </div>
    <div class="col-sm-12"><h3>Grid</h3></div>
    <div class="col-sm-6">
        <div class="form-group {!! hasError('grid_start_x', $errors) !!}">
            <label class="control-label" for="grid_start_x">
                Start position <b>x</b>
            </label>
            <input class="form-control" type="text" value="{{old('grid_start_x', $room->grid_start_x)}}" name="grid_start_x" id="grid_start_x">
            <span class="help-block">{{$errors->first('grid_start_x')}}</span>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group {!! hasError('grid_start_z', $errors) !!}">
            <label class="control-label" for="grid_start_z">
                Start position <b>z</b>
            </label>
            <input class="form-control" type="text" value="{{old('grid_start_z', $room->grid_start_z)}}" name="grid_start_z" id="grid_start_z">
            <span class="help-block">{{$errors->first('grid_start_z')}}</span>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group {!! hasError('grid_stop_x', $errors) !!}">
            <label class="control-label" for="grid_stop_x">
                Stop position <b>x</b>
            </label>
            <input class="form-control" type="text" value="{{old('grid_stop_x', $room->grid_stop_x)}}" name="grid_stop_x" id="grid_stop_x">
            <span class="help-block">{{$errors->first('grid_stop_x')}}</span>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="form-group {!! hasError('grid_stop_z', $errors) !!}">
            <label class="control-label" for="grid_stop_z">
                Stop position <b>z</b>
            </label>
            <input class="form-control" type="text" value="{{old('grid_stop_z', $room->grid_stop_z)}}" name="grid_stop_z" id="grid_stop_z">
            <span class="help-block">{{$errors->first('grid_stop_z')}}</span>
        </div>
    </div>
    <div class="col-sm-12"><h3>Color</h3></div>
    <div class="col-sm-3">
        <div class="form-group {!! hasError('color_r', $errors) !!}">
            <label class="control-label" for="color_r">
                Red
            </label>
            <input class="form-control" type="text" value="{{old('color_r', $room->color_r)}}" name="color_r" id="color_r">
            <span class="help-block">{{$errors->first('color_r')}}</span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group {!! hasError('color_g', $errors) !!}">
            <label class="control-label" for="color_g">
                Green
            </label>
            <input class="form-control" type="text" value="{{old('color_g', $room->color_g)}}" name="color_g" id="color_g">
            <span class="help-block">{{$errors->first('color_g')}}</span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group {!! hasError('color_b', $errors) !!}">
            <label class="control-label" for="color_b">
                Blue
            </label>
            <input class="form-control" type="text" value="{{old('color_b', $room->color_b)}}" name="color_b" id="color_b">
            <span class="help-block">{{$errors->first('color_b')}}</span>
        </div>
    </div>
    <div class="col-sm-3">
        <div class="form-group {!! hasError('color_a', $errors) !!}">
            <label class="control-label" for="color_a">
                Alpha
            </label>
            <input class="form-control" type="text" value="{{old('color_a', $room->color_a)}}" name="color_a" id="color_a">
            <span class="help-block">{{$errors->first('color_a')}}</span>
        </div>
    </div>
</div>



