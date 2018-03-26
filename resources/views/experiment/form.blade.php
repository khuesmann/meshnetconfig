<div class="form-group {!! hasError('name', $errors) !!}">
    <label class="control-label" for="buildingName">
        Name
    </label>
    <input class="form-control" type="text" value="{{old('name', $experiment->name)}}" name="name" id="buildingName">
    <span class="help-block">{{$errors->first('name')}}</span>
</div>

<div class="form-group {!! hasError('xml_file', $errors) !!}">
    <label class="control-label" for="buildinIsActive">
        XML file
    </label>
    <input name="xml_file" type="file" class="form-control">
    {{$experiment->getXml()}}
    <span class="help-block">{{$errors->first('xml_file')}}</span>
</div>

<div class="form-group {!! hasError('mapping_id', $errors) !!}">
    <label class="control-label" for="buildinIsActive">
        Mapping
    </label>
    <select class="form-control" name="mapping_id">
        <option value="">- choose -</option>
        @foreach($mappings as $mapping)
            <option {!! isSelected($mapping->id, $experiment->mapping_id) !!} value="{{$mapping->id}}">{{$mapping->name}}</option>
        @endforeach
    </select>
    <span class="help-block">{{$errors->first('mapping_id')}}</span>
</div>
