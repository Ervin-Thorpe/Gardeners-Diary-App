@extends('layouts.master')

@section('content')
<link rel="stylesheet" href='{{ URL::asset("css/garden-layout.css") }}' />
<div class="container">
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-1 navbtnbar">
            <a href="{{ url('/') }}" class="navigation-link">
                <div id="garden-layout-navigation-container" class="active-nav-btn-container">
                    <img src="/images/garden_icon_active.png" id="garden-layout-navigation"/>
                    <div class="active-navigation-btn-text">Garden</div>
                </div>
            </a>
            <a href="{{ url('/activities') }}" class="navigation-link">
                <div id="garden-diary-navigation-container" class="inactive-nav-btn-container">
                    <img src="/images/activities_icon_inactive.png" id="garden-diary-navigation"/>
                    <div class="inactive-navigation-btn-text">Activities</div>
                </div>
            </a>
            <a href="{{ url('/my-plants') }}" class="navigation-link">
                <div id="plants-navigation-container" class="inactive-nav-btn-container">
                    <img src="/images/plants_icon_inactive.png" id="plants-navigation"/>
                    <div class="inactive-navigation-btn-text">My Plants</div>
                </div>
            </a>
            <a href="{{ url('/diary') }}" class="navigation-link">
                <div id="activities-navigation-container" class="inactive-nav-btn-container">
                    <img src="/images/diary_icon_inactive.png" id="activities-navigation"/>
                    <div class="inactive-navigation-btn-text">Diary</div>
                </div>
            </a>
            <a href="{{ url('/help') }}" class="navigation-link">
                <div id="help-navigation-container" class="inactive-nav-btn-container">
                    <img src="/images/help_icon_inactive.png" id="help-navigation"/>
                    <div class="inactive-navigation-btn-text">Help</div>
                </div>
            </a>
        </div>
        <div class="col-xs-7 col-sm-7 col-md-8 mainbar">
            <div class="right-panel-container">
                <div class="right-panel-top-container">
                    <div id="garden-layout-top-left-container">
                        <div class="right-panel-top-title">My Garden</div>
                    </div>
                </div>
                <div class="right-panel-bottom-container">
                    <div id="garden-layout-canvas">
                        <canvas id="c_GardenEditor"></canvas>
                    </div>
                    <div id="loading-garden-layout">
                        <h3>Loading Garden. Please Wait...</h3>
                        <div id="progress-bar"></div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-3 sidebar">
            <div id="garden-layout-left-panel" class="left-panel">
                <div class="left-panel-title-container">
                    <div id="tile-type" class="left-panel-title">
                        Editing Tools
                    </div>
                </div>
                <div class="left-panel-btn-container centered edit-off-btn-group">
                    <div class="edit-mode-group">
                        <input type="button" id="edit-off-btn" class="norm-btn btn-primary" onclick="unlockPatches()" value="Turn Edit Mode On">
                    </div>
                </div>
                <div class="left-panel-btn-container centered edit-on-btn-group">
                    <div class="edit-mode-group">
                        <input type="button" class="norm-btn btn-primary" onclick ="lockPatches()" value="Turn Edit Mode Off">
                    </div>
                    <hr>
                    <div id="add-tile-group" class="centered">
                        <input type="button" class="norm-btn btn-default" value="Add Patch Tile" id="inline-btn-3">
                        <input type="button" class="norm-btn btn-default" value="Add Walk Path Tile" id="inline-btn-6">
                        <input type="button" class="norm-btn btn-default" value="Add Water Tile" id="inline-btn-7">
                        <input type="button" class="norm-btn btn-default" value="Add Grass Tile" id="inline-btn-8">
                    </div>
                    <hr>
                    <div id="modify-tile-group" class="centered">
                        <input type="button" class="norm-btn btn-default" value="Send Tile Backwards" id="inline-btn-9">
                        <input type="button" class="norm-btn btn-default" value="Deselect Tile" id="inline-btn-11">  
                    </div>
                    <hr>
                    <div id="remove-tile">
                        <input type="button" class="norm-btn btn-danger" value="Remove Tile" id="inline-btn">
                    </div>
                    <hr>
                </div>
            </div>
            <div class="left-panel edit-on-btn-group">
                <div id="rename-tile-group" class="centered">
                    <div id="tile-name" class="left-panel-subtitle left-panel-title-container">
                        Tile Name
                    </div>
                    <input type="button" class="norm-btn btn-primary" value="Rename Tile" id="inline-btn-12">
                    <input type="text" class="norm-btn hide" id="rename-tile-input">
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popup" data-popup="popup-1">
    <div class="popup-inner">
        <div id="popup-remove-tile-title" class="popup-title"></div><br/>
        <b><div id="popup-remove-tile-desc" class="popup-desc"></div></b><br/>
        <div class="popup-btn-group">
            <button class="norm-btn btn-danger popup-yes" id="popup-remove-tile-yes">Yes</button>
            <button data-popup-remove-tile-close="popup-1" class="norm-btn btn-primary popup-no" id="popup-remove-tile-no">No</button>
        </div>
        <a class="popup-close" data-popup-remove-tile-close="popup-1" href="#">x</a>
    </div>
</div>
<input type="hidden" data-popup-remove-tile-open="popup-1">

<input type="hidden" data-popup-add-activity-open="popup-2">

<script src='{{ URL::asset("js/app/canvas-module.js") }}'></script>
<script src='{{ URL::asset("js/app/edit-mode.js") }}'></script>
<script src='{{ URL::asset("js/app/garden_canvas.js") }}'></script>

@endsection