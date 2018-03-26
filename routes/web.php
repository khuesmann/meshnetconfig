<?php

$proxy_url    = getenv('PROXY_URL');
$proxy_schema = getenv('PROXY_SCHEMA');

if (!empty($proxy_url)) {
    URL::forceRootUrl($proxy_url);
}

if (!empty($proxy_schema)) {
    URL::forceSchema($proxy_schema);
}

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| This file is where you may define all of the routes that are handled
| by your application. Just tell Laravel the URIs it should respond
| to using a Closure or controller method. Build something great!
|
*/

Route::get('/', function() { return redirect(route('experiment.index')); });

Route::group(['as' => 'building.', 'prefix' => 'building'], function () {
    Route::get('/', [
        'as' => 'index',
        'uses' => 'BuildingController@index'
    ]);
    Route::post('/', [
        'as' => 'store',
        'uses' => 'BuildingController@store'
    ]);
    Route::get('create', [
        'as' => 'create',
        'uses' => 'BuildingController@create'
    ]);
    Route::get('{building}', [
        'as' => 'show',
        'uses' => 'BuildingController@show'
    ]);
    Route::get('{building}/edit', [
        'as' => 'edit',
        'uses' => 'BuildingController@edit'
    ]);
    Route::post('{building}', [
        'as' => 'update',
        'uses' => 'BuildingController@update'
    ]);
    Route::get('destroy/{building}', [
        'as' => 'destroy',
        'uses' => 'BuildingController@destroy'
    ]);
});

Route::group(['as' => 'floor.', 'prefix' => 'floor'], function () {
    Route::post('/', [
        'as' => 'store',
        'uses' => 'FloorController@store'
    ]);
    Route::get('create/{building}', [
        'as' => 'create',
        'uses' => 'FloorController@create'
    ]);
    Route::get('{floor}', [
        'as' => 'show',
        'uses' => 'FloorController@show'
    ]);
    Route::get('{floor}/edit', [
        'as' => 'edit',
        'uses' => 'FloorController@edit'
    ]);
    Route::post('{floor}', [
        'as' => 'update',
        'uses' => 'FloorController@update'
    ]);
    Route::get('destroy/{floor}', [
        'as' => 'destroy',
        'uses' => 'FloorController@destroy'
    ]);
    Route::get('clone/{floor}', [
        'as' => 'clone',
        'uses' => 'FloorController@cloneFloor'
    ]);
});

Route::group(['as' => 'room.', 'prefix' => 'room'], function () {
    Route::post('/', [
        'as' => 'store',
        'uses' => 'RoomController@store'
    ]);
    Route::get('create/{floor}', [
        'as' => 'create',
        'uses' => 'RoomController@create'
    ]);
    Route::get('{room}', [
        'as' => 'show',
        'uses' => 'RoomController@show'
    ]);
    Route::get('{room}/edit', [
        'as' => 'edit',
        'uses' => 'RoomController@edit'
    ]);
    Route::post('{room}', [
        'as' => 'update',
        'uses' => 'RoomController@update'
    ]);
    Route::get('destroy/{room}', [
        'as' => 'destroy',
        'uses' => 'RoomController@destroy'
    ]);
});

Route::group(['as' => 'mapping.', 'prefix' => 'mapping'], function () {
    Route::get('/', [
        'as' => 'index',
        'uses' => 'MappingController@index'
    ]);
    Route::post('/', [
        'as' => 'store',
        'uses' => 'MappingController@store'
    ]);
    Route::get('create', [
        'as' => 'create',
        'uses' => 'MappingController@create'
    ]);
    Route::get('{mapping}/edit', [
        'as' => 'edit',
        'uses' => 'MappingController@edit'
    ]);
    Route::post('{mapping}', [
        'as' => 'update',
        'uses' => 'MappingController@update'
    ]);
    Route::get('destroy/{mapping}', [
        'as' => 'destroy',
        'uses' => 'MappingController@destroy'
    ]);
    Route::get('activate/{mapping}/{state?}', [
        'as' => 'activate',
        'uses' => 'MappingController@activate'
    ]);
});

Route::group(['as' => 'experiment.', 'prefix' => 'experiment'], function () {
    Route::get('/', [
        'as' => 'index',
        'uses' => 'ExperimentController@index'
    ]);
    Route::post('/', [
        'as' => 'store',
        'uses' => 'ExperimentController@store'
    ]);
    Route::post('storeQuick', [
        'as' => 'storeQuick',
        'uses' => 'ExperimentController@storeQuick'
    ]);
    Route::get('create', [
        'as' => 'create',
        'uses' => 'ExperimentController@create'
    ]);
    Route::get('quickStart', [
        'as' => 'quickStart',
        'uses' => 'ExperimentController@quickStart'
    ]);
    Route::get('{experiment}', [
        'as' => 'show',
        'uses' => 'ExperimentController@show'
    ]);
    Route::get('{experiment}/edit', [
        'as' => 'edit',
        'uses' => 'ExperimentController@edit'
    ]);
    Route::post('{experiment}', [
        'as' => 'update',
        'uses' => 'ExperimentController@update'
    ]);
    Route::get('destroy/{experiment}', [
        'as' => 'destroy',
        'uses' => 'ExperimentController@destroy'
    ]);
    Route::get('analyze/{experiment}', [
        'as' => 'analyze',
        'uses' => 'ExperimentController@analyze'
    ]);
    Route::get('data/{experiment}', [
        'as' => 'data',
        'uses' => 'ExperimentController@data'
    ]);
    Route::post('data/{experiment}', [
        'as' => 'dataPost',
        'uses' => 'ExperimentController@saveData'
    ]);
    Route::get('loadConfig/{experiment}/{experimentId}', [
        'as' => 'loadConfig',
        'uses' => 'ExperimentController@loadConfig'
    ]);
    Route::get('load/{experiment}', [
        'as' => 'load',
        'uses' => 'ExperimentController@load'
    ]);
});