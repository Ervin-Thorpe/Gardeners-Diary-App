@extends('layouts.master')

@section('content')
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
                <div id="activities-navigation-container" class="active-nav-btn-container">
                    <img src="/images/diary_icon_active.png" id="activities-navigation"/>
                    <div class="active-navigation-btn-text">Diary</div>
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
                    <div class="right-panel-top-title"><span>My Diary</span></div>
                </div>
                <div class="right-panel-bottom-container main-container-overflow">
                    <table class="activities-table">
                        <tbody>
                            @foreach($completedActivities as $completedActivity)
                                <tr class="activity-row">
                                    <td colspan="4"class="table-activity-data-desc">
                                        <h4><b>Patch Name:</b>{{ ' '.ucfirst($completedActivity->patch_name) }}</h4>
                                        <h4><b>Plant Name:</b>{{ ' '.ucfirst($completedActivity->plant_name) }}</h4>
                                        <h4><b>Activity Name:</b>{{ ' '.ucfirst($completedActivity->activity_name) }}</h4>
                                        <h4><b>Completion Date:</b>{{ ' '.Carbon\Carbon::parse($completedActivity->completion_date)->format('d-m-Y') }}</h4>
                                    </td>
                                    <td class="table-activity-data">
                                        <div class="activity-btn-container">
                                            {!! Form::open(array('url' => '/diary/completed-activities/garden', 'class' => 'activity-btn-container')) !!}
                                            {!! Form::submit('Check Garden' ,[
                                                'class' => "btn btn-success"
                                            ]) !!}
                                            {!! Form::hidden('activityId', $completedActivity->id) !!}
                                            {!! Form::close() !!}
                                        </div>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-3 sidebar">
            <div id="garden-diary-left-panel" class="left-panel">
                <div class="left-panel-title-container">
                    <div class="left-panel-title">
                        Enter Date
                    </div>
                </div>
                <div class="left-panel-activities-container" class="left-panel-btn-container centered">
                    <div class="activity-date-picker centered">
                        <div id="activity-date-picker-title">Select the date below</div>
                        <hr>
                        {!! Form::open(array('url' => '/diary/completed-activities')) !!}
                        <div id="datepicker-container">
                            {!! Form::text('activitiesDate', '', array('id' => 'datepicker')) !!}
                        </div>
                        <hr>
                        {!! Form::submit('Search',[
                            'class' => "norm-btn btn-success"
                        ]) !!}
                        {!! Form::close() !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script src='{{ URL::asset("js/app/activities-history.js") }}'></script>
@endsection