<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// activities page
Route::post('/activities', 'ActivitiesController@postGardenDiary')->middleware('authenticated');
Route::get('/activities', 'ActivitiesController@getGardenDiary')->middleware('authenticated');
Route::post('/activities/user-activity-update', 'ActivitiesController@postGardenDiaryUserActivityUpdate')->middleware('authenticated');
Route::post('/activities/user-activity-delete', 'ActivitiesController@postGardenDiaryUserActivityDelete')->middleware('authenticated');
Route::post('/activities/activity-stop', 'ActivitiesController@postGardenDiaryUserActivityStop')->middleware('authenticated');
Route::post('/activities/activity-complete', 'ActivitiesController@postGardenDiaryUserActivityComplete')->middleware('authenticated');
Route::post('/activities/activity-reset', 'ActivitiesController@postGardenDiaryUserActivityReset')->middleware('authenticated');
Route::post('/activities/activity-start', 'ActivitiesController@postGardenDiaryUserActivityStart')->middleware('authenticated');

// garden page
Route::post('/', 'PagesController@postGardenLayout')->middleware('authenticated');
Route::get('/', 'PagesController@getGardenLayout')->middleware('authenticated');
Route::get('/home', 'HomeController@index');
Route::get('/', 'HomeController@index');
Route::post('/layout/save', 'GardenLayoutController@storeGardenLayout')->middleware('authenticated');
Route::post('/layout/load', 'GardenLayoutController@loadGardenLayout')->middleware('authenticated');

// diary page
Route::get('/diary', 'PagesController@getActivitiesHistory')->middleware('authenticated');
Route::post('/diary', 'PagesController@postActivitiesHistory')->middleware('authenticated');
Route::post('/diary/completed-activities', 'DiaryController@postPastCompletedActivities')->middleware('authenticated');
Route::post('/diary/completed-activities/garden', 'DiaryController@postPastGardenLayout')->middleware('authenticated');

// my plants page
Route::resource('/my-plants', 'UsersPlantController');

// help page
Route::get('/help', 'PagesController@getHelp')->middleware('authenticated');

// authentication
Auth::routes();








