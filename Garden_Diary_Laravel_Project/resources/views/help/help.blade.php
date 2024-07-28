@extends('layouts.master')

@section('content')
<link rel="stylesheet" href='{{ URL::asset("css/help.css") }}' />
<div class="container">
    <div class="row">
        <div class="col-xs-1 col-sm-1 col-md-1 navbtnbar">
            <a href="{{ url('/') }}" class="navigation-link">
                <div id="garden-layout-navigation-container" class="inactive-nav-btn-container">
                    <img src="/images/garden_icon_inactive.png" id="garden-layout-navigation"/>
                    <div class="inactive-navigation-btn-text">Garden</div>
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
                <div id="help-navigation-container" class="active-nav-btn-container">
                    <img src="/images/help_icon_active.png" id="help-navigation"/>
                    <div class="active-navigation-btn-text">Help</div>
                </div>
            </a>
        </div>
        <div class="col-xs-7 col-sm-7 col-md-8 mainbar">
            <div class="right-panel-container">
                <div class="right-panel-top-container">
                    <div id="garden-layout-top-left-container">
                        <div class="right-panel-top-title">Step to Step Video Guide on using the: Garden Feature</div>
                    </div>
                </div>
                <div class="right-panel-bottom-container">
                    <div id="garden-video-help">
                        <video class="video-help-guide" width="640" controls>
                            <source src='{{ URL::asset("videos/garden-guide.mp4") }}' type="video/mp4">
                            Your browser does not support HTML5 video.
                        </video>
                        <div class="garden-video-description-help">
                            <h4>Video Description</h4>
                            <hr>
                            <h5>This video guide focuses on how to use the <b>Garden</b> feature. It's a step by step guide on adding, moving, repositioning, resizing and renaming tiles.</h5>
                        </div>
                    </div>
                    <div id="activities-video-help">
                        <video class="video-help-guide" width="640" controls>
                            <source src='{{ URL::asset("videos/activities-guide.mp4") }}' type="video/mp4">
                            Your browser does not support HTML5 video.
                        </video>
                        <div class="garden-video-description-help">
                            <h4>Video Description</h4>
                            <hr>
                            <h5>This video guide focuses on how to use the <b>Activities</b> feature. It's a step by step guide on; adding an activity to a patch, starting this activity.</h5>
                        </div>
                    </div>
                    <div id="plants-video-help">
                        <video class="video-help-guide" width="640" controls>
                            <source src='{{ URL::asset("videos/plants-guide.mp4") }}' type="video/mp4">
                            Your browser does not support HTML5 video.
                        </video>
                        <div class="garden-video-description-help">
                            <h4>Video Description</h4>
                            <hr>
                            <h5>This video guide focuses on how to use the <b>Plants</b> feature. It's a step by step guide on; adding a new plant with activities, viewing the details of the new plant and its activities, editing the plant and its activities and deleting the plant.</h5>
                        </div>
                    </div>
                    <div id="diary-video-help">
                        <video class="video-help-guide" width="640" controls>
                            <source src='{{ URL::asset("videos/diary-guide.mp4") }}' type="video/mp4">
                            Your browser does not support HTML5 video.
                        </video>
                        <div class="garden-video-description-help">
                            <h4>Video Description</h4>
                            <hr>
                            <h5>This video guide focuses on how to use the <b>Diary</b> feature. It's a step by step guide on; searching for an past completed activity, viewing the details for this activity and viewing the garden when this activity was completed.</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-3 sidebar">
            <div id="garden-layout-left-panel" class="left-panel">
                <div class="left-panel-title-container">
                    <div id="tile-type" class="left-panel-title">
                        Other Video Guides
                    </div>
                </div>
                <div class="left-panel-btn-container centered">
                </div>
                <div class="left-panel-btn-container centered">
                    <div class="centered">
                        <button class="norm-btn btn-default" id="garden-help-btn">Garden Video Guide</button>
                        <button class="norm-btn btn-default" id="activities-help-btn">Activities Video Guide</button>
                        <button class="norm-btn btn-default" id="plants-help-btn">Plants Video Guide</button>
                        <button class="norm-btn btn-default" id="diary-help-btn">Diary Video Guide</button>
                    </div>
                    <hr>
                    <div>
                        <form method="get" action='{{ URL::asset("pdf/user-guide.pdf") }}'>
                            <button class="norm-btn btn-primary" id="user-guide-btn">View User Guide</button>
                        </form>
                    </div>
                    <hr>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='{{ URL::asset("js/app/help.js") }}'></script>
@endsection