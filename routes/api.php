<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group(['prefix' => 'fetch'], function() {
    Route::get('buildings', [
        'as' => '.buildings',
        'uses' => 'BuildingController@fetch'
    ]);
    Route::get('experiments/', [
        'as' => '.experiments',
        'uses' => 'ExperimentController@fetchAll'
    ]);
    Route::get('experiment/{experiment}', [
        'as' => '.experiment',
        'uses' => 'ExperimentController@fetch'
    ]);
    Route::get('config/{experiment}', [
        'as' => '.config',
        'uses' => 'ExperimentController@fetchConfig'
    ]);
});

Route::group(['prefix' => 'save'], function() {
    Route::post('config/{experiment}', [
        'as' => '.config',
        'uses' => 'ExperimentController@saveData'
    ]);
});