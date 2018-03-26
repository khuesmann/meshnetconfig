<h2>General</h2>
<div class="form-group {!! hasError('name', $errors) !!}">
    <label class="control-label" for="buildingName">
        Name
    </label>
    <input class="form-control" type="text" value="{{old('name', $mapping->name)}}" name="name" id="buildingName">
    <span class="help-block">{{$errors->first('name')}}</span>
</div>

<div class="form-group {!! hasError('is_active', $errors) !!}">
    <label class="control-label" for="buildinIsActive">
        Is active ?
    </label>
    <div>
        <input {!! isChecked(old('is_active', $mapping->is_active), 1) !!}  type="radio" value="1" name="is_active" id="buildinIsActive"> Yes <br>
        <input {!! isChecked(old('is_active', $mapping->is_active), 0) !!} type="radio" value="0" name="is_active" id="buildinIsActive"> No <br>
    </div>
    <span class="help-block">{{$errors->first('is_active')}}</span>
</div>

<hr>
<h2>Mappings</h2>

<p>Please use the following JSON-Structure for XML-Mappings. XPath is used here. First you have to define the xpath to your desired XML-Tag (like UNIX pathing) and then define the needed variables. The "@" in front of the variable indicates an XML-tag attribute. For more infos please read <a href="http://www.w3schools.com/xsl/xpath_syntax.asp" target="_blank">this article</a> about XPath. </p>
<pre>{
  "xpath": "/experiment/general",
  "variables": {
    "abc": "name",
    "xyz": "@description"
  },
   "relations": {
   "action": "//path/to/relation[@id=##abc##]/action[@id=##xyz##]"
  }
}
</pre>

<div class="row">
    
    <div class="col-sm-12">
        
        <h3>Result mapping</h3>

        <div class="form-group {!! hasError('result_mapping', $errors) !!}">
            <label class="control-label" for="buildinIsActive">
                Is active ?
            </label>
            <div>
                <textarea rows="20" class="form-control" name="result_mapping" id="buildinIsActive">{{old('result_mapping', $mapping->result_mapping)}}</textarea>
            </div>
            <span class="help-block">{{$errors->first('result_mapping')}}</span>
        </div>
        
    </div>

    <div class="col-sm-12">

        <h3> Scan result mapping</h3>

        <div class="form-group {!! hasError('scan_result_mapping', $errors) !!}">
            <label class="control-label" for="buildinIsActive">
                Is active ?
            </label>
            <div>
                <textarea rows="20" class="form-control" name="scan_result_mapping" id="buildinIsActive">{{old('scan_result_mapping', $mapping->scan_result_mapping)}}</textarea>
            </div>
            <span class="help-block">{{$errors->first('scan_result_mapping')}}</span>
        </div>

    </div>

    <div class="col-sm-12">

        <h3> Node mapping</h3>

        <div class="form-group {!! hasError('node_mapping', $errors) !!}">
            <label class="control-label" for="buildinIsActive">
                Is active ?
            </label>
            <div>
                <textarea rows="20" class="form-control" name="node_mapping" id="buildinIsActive">{{old('node_mapping', $mapping->node_mapping)}}</textarea>
            </div>
            <span class="help-block">{{$errors->first('node_mapping')}}</span>
        </div>

    </div>

    <div class="col-sm-12">

        <h3> General information mapping</h3>

        <div class="form-group {!! hasError('general_info_mapping', $errors) !!}">
            <label class="control-label" for="buildinIsActive">
                Is active ?
            </label>
            <div>
                <textarea rows="20" class="form-control" name="general_info_mapping" id="buildinIsActive">{{old('general_info_mapping', $mapping->general_info_mapping)}}</textarea>
            </div>
            <span class="help-block">{{$errors->first('general_info_mapping')}}</span>
        </div>

    </div>
    
</div>

<hr>