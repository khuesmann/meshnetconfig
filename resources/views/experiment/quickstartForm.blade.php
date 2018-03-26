<div class="form-group {!! hasError('xml_file', $errors) !!}">
    <label class="control-label" for="xml_fileInput">
        XML file
    </label>
    <input name="xml_file" type="file" class="form-control">
    <span class="help-block">{{$errors->first('xml_file')}}</span>
</div>

<div class="form-group {!! hasError('ext_id', $errors) !!}">
    <label class="control-label" for="ext_idInput">
        External ID
    </label>
    <input name="ext_id" type="text" class="form-control">
    <span class="help-block">{{$errors->first('ext_id')}}</span>
</div>

<div class="form-group {!! hasError('config', $errors) !!}">
    <label class="control-label" for="config">
        Load config from existing experiment
    </label>
    <select class="form-control" name="config">
        <option value="">Load config from ...</option>
        @foreach($configuredExperiments as $experiment)
            <option value="{{$experiment->id}}">{{$experiment->name}}</option>
        @endforeach
    </select>
    <span class="help-block">{{$errors->first('config')}}</span>
</div>

<div class="form-group">
    <button type="submit" class="btn  btn-success">Go</button>
</div>