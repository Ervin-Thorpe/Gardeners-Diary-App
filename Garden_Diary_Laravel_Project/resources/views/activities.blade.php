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
                <div id="garden-diary-navigation-container" class="active-nav-btn-container">
                    <img src="/images/activities_icon_active.png" id="garden-diary-navigation"/>
                    <div class="active-navigation-btn-text">Activities</div>
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
            <div id="garden-diary-right-panel" class="right-panel-container">
                <div class="right-panel-top-container">
                    <div id="garden-diary-top-left-container">
                        <div class="right-panel-top-title"><span>My Activities: Todays Activities</span></div> 
                    </div>
                    <div id="garden-diary-top-right-container">
                    </div>
                </div>
                <div class="right-panel-bottom-container">
                    <div id="activities-desc-container" class="main-container-overflow">
                        <table class="activities-table">
                            <tbody>
                                 @foreach($todaysPatchNames as $todaysPatchName)
                                    <tr class="todays-activities all-activities">
                                        <td colspan="4"class="table-activity-data-desc">
                                            <h4><b>Patch Name:</b>{{ ' '.ucfirst(str_limit($todaysPatchName['patch_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Plant Name:</b>{{ ' '.ucfirst(str_limit($todaysPatchName['plant_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Todays Activity:</b>{{ ' '.ucfirst(str_limit($todaysPatchName['activity_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Deadline Date:</b>{{ ' '.$todaysPatchName['activity_deadline'] }}</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="activity-btn-container">
                                                {!! Form::open(array('url' => '/activities/user-activity-delete', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('x' ,[
                                                    'class' => "btn btn-danger"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $todaysPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-stop', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Stop' ,[
                                                    'class' => "btn btn-warning"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $todaysPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-reset', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Reset' ,[
                                                    'class' => "btn btn-info"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $todaysPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-complete', 'class' => 'activity-btn-container')) !!}
                                                {!! Form::submit('Completed' ,[
                                                    'class' => "btn btn-success"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $todaysPatchName['patch_id']) !!}
                                                {!! Form::hidden('patchName', $todaysPatchName['patch_name']) !!}
                                                {!! Form::hidden('plantName', $todaysPatchName['plant_name']) !!}
                                                {!! Form::hidden('activityName', $todaysPatchName['activity_name']) !!}
                                                {!! Form::close() !!}
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                                @foreach($upcomingPatchNames as $upcomingPatchName)
                                    <tr class="upcoming-activities all-activities">
                                        <td colspan="4"class="table-activity-data-desc">
                                            <h4><b>Patch Name:</b>{{ ' '.ucfirst(str_limit($upcomingPatchName['patch_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Plant Name:</b>{{ ' '.ucfirst(str_limit($upcomingPatchName['plant_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Upcoming Activity:</b>{{ ' '.ucfirst(str_limit($upcomingPatchName['activity_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Deadline Date:</b>{{ ' '.$upcomingPatchName['activity_deadline'] }}</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="activity-btn-container">
                                                {!! Form::open(array('url' => '/activities/user-activity-delete', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('x' ,[
                                                    'class' => "btn btn-danger"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $upcomingPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-stop', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Stop' ,[
                                                    'class' => "btn btn-warning"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $upcomingPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-reset', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Reset' ,[
                                                    'class' => "btn btn-info"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $upcomingPatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-complete', 'class' => 'activity-btn-container')) !!}
                                                {!! Form::submit('Completed' ,[
                                                    'class' => "btn btn-success"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $upcomingPatchName['patch_id']) !!}
                                                {!! Form::hidden('patchName', $upcomingPatchName['patch_name']) !!}
                                                {!! Form::hidden('plantName', $upcomingPatchName['plant_name']) !!}
                                                {!! Form::hidden('activityName', $upcomingPatchName['activity_name']) !!}
                                                {!! Form::close() !!}
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                                @foreach($overduePatchNames as $overduePatchName)
                                    <tr class="overdue-activities all-activities">
                                        <td colspan="4"class="table-activity-data-desc">
                                            <h4><b>Patch Name:</b>{{ ' '.ucfirst(str_limit($overduePatchName['patch_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Plant Name:</b>{{ ' '.ucfirst(str_limit($overduePatchName['plant_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Overdue Activity:</b>{{ ' '.ucfirst(str_limit($overduePatchName['activity_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Deadline Date:</b>{{ ' '.$overduePatchName['activity_deadline'] }}</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="activity-btn-container">
                                                {!! Form::open(array('url' => '/activities/user-activity-delete', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('x' ,[
                                                    'class' => "btn btn-danger"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $overduePatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-stop', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Stop' ,[
                                                    'class' => "btn btn-warning"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $overduePatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-reset', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('Reset' ,[
                                                    'class' => "btn btn-info"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $overduePatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-complete', 'class' => 'activity-btn-container')) !!}
                                                {!! Form::submit('Completed' ,[
                                                    'class' => "btn btn-success"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $overduePatchName['patch_id']) !!}
                                                {!! Form::hidden('patchName', $overduePatchName['patch_name']) !!}
                                                {!! Form::hidden('plantName', $overduePatchName['plant_name']) !!}
                                                {!! Form::hidden('activityName', $overduePatchName['activity_name']) !!}
                                                {!! Form::close() !!}
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                                @foreach($inactivePatchNames as $inactivePatchName)
                                    <tr class="inactive-activities all-activities">
                                        <td colspan="4"class="table-activity-data-desc">
                                            <h4><b>Patch Name:</b>{{ ' '.ucfirst(str_limit($inactivePatchName['patch_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Plant Name:</b>{{ ' '.ucfirst(str_limit($inactivePatchName['plant_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Inactive Activity:</b>{{ ' '.ucfirst(str_limit($inactivePatchName['activity_name'], $limit = 20, $end = '...')) }}</h4>
                                            <h4><b>Deadline Date:</b> No deadline date</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="activity-btn-container">
                                                {!! Form::open(array('url' => '/activities/user-activity-delete', 'class' => 'activity-btn-container activity-btn-seperator')) !!}
                                                {!! Form::submit('x' ,[
                                                    'class' => "btn btn-danger"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $inactivePatchName['patch_id']) !!}
                                                {!! Form::close() !!}

                                                {!! Form::open(array('url' => '/activities/activity-start', 'class' => 'activity-btn-container')) !!}
                                                {!! Form::submit('Start' ,[
                                                    'class' => "btn btn-success"
                                                ]) !!}
                                                {!! Form::hidden('patchActivityId', $inactivePatchName['patch_id']) !!}
                                                {!! Form::close() !!}
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                                @foreach($noActivitiesPatchNames as $noActivitiesPatchName)
                                <tr class="no-activities">
                                    <td colspan="2"class="table-activity-data-desc">
                                        <h4><b>Patch Name:</b>{{ ' '.$noActivitiesPatchName['patch_name'] }}</h4>
                                        <h4><b>No Activity:</b> Patch has no activities</h4>
                                    </td>
                                    <td class="table-activity-data">
                                        <div class="activity-btn-container">
                                            <button type="button" class="btn btn-success add-new-activity-btn">Add New Activity</button>
                                            {!! Form::hidden('patchNum', $noActivitiesPatchName['patch_num']) !!}
                                        </div>
                                    </td>
                                </tr>
                                @endforeach
                                @foreach($usersPatches as $usersPatch)
                                    <tr class="your-patches">
                                        <td class="table-activity-data-desc">
                                                <h4><b>Patch Name:</b>{{' '.ucfirst($usersPatch->name) }}</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="btn-group activity-btn-container">
                                                <div class="btn-group activity-btn-container">
                                                    <button type="button" class="btn btn-success add-new-activity-btn">Add New Activity</button>
                                                    {!! Form::hidden('patchNum', $usersPatch->patch_num) !!}
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table> 
                    </div>
                </div>
            </div>
        </div>
        <div class="col-xs-4 col-sm-4 col-md-3 sidebar">
            <div id="garden-diary-left-panel" class="left-panel">
                <div class="left-panel-title-container">
                    <div class="left-panel-title">
                        Patch Activities
                    </div>
                </div>
                <div class="left-panel-activities-container" class="left-panel-btn-container centered">
                    <div id="activities-btn-group" class="centered">
                        <b><button type="button" class="norm-btn btn-primary" id="todays-activities-btn">Today's Activities</button></b>
                        <hr>
                        <button type="button" class="norm-btn btn-default" id="all-activities-btn">All Activities</button>
                        <button type="button" class="norm-btn btn-default" id="upcoming-activities-btn">Upcoming Activities</button>
                        <button type="button" class="norm-btn btn-default" id="inactive-activities-btn">Inactive Activities</button>
                        <button type="button" class="norm-btn btn-default" id="no-activities-btn">Patches with no Activities</button>
                        <hr>
                        <b><button type="button" class="norm-btn btn-danger" id="overdue-activities-btn">Overdue Activities</button></b> 
                        <hr>
                        <b><button type="button" class="norm-btn btn-primary" id="your-patches-btn">Your Patches</button></b> 
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="popup" data-popup="popup-2">
    <div class="popup-inner">
        <div id="popup-desc-wrapper">
            
            <div id="popup-allotment">
                <div id="popup-allotment-title">
                    Plants and Activities
                </div>
                <div class="popup-allotment-btn-group">
                    <table class="popup-your-plants">
                        <tbody>
                            @foreach($usersPlants as $usersPlant)
                                @foreach($usersPlantActivities as $usersPlantActivity)
                                    @if($usersPlant->id == $usersPlantActivity->users_plant_id)
                                        <tr class="popup-your-plants-row">
                                            <td class="float-left popup-your-plants-data-label">{!! Form::open(array('url' => '/activities/user-activity-update')) !!}
                                            {!! Form::label(ucfirst($usersPlant->name).': '.ucfirst($usersPlantActivity->name)) !!}
                                            </td>
                                            <td class="float-right popup-your-plants-data-btn">
                                            {!! Form::submit('Add Activity' ,[
                                                'class' => "btn btn-success",
                                                'id' => $usersPlant->id.'-your-plant-btn'
                                            ]) !!}
                                            </td>
                                            {!! Form::hidden('patchNum', 0 ,[
                                                'class' => "selected-patch-num"
                                            ]) !!}
                                            {!! Form::hidden('usersPlantActivity', $usersPlantActivity) !!}
                                            {!! Form::close() !!}
                                        </tr>
                                    @endif
                                @endforeach
                            @endforeach
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        <div class="popup-btn-group">
            <button data-popup-add-activity-close="popup-2" class="norm-btn btn-primary popup-no" id="popup-add-activity-no">Close Popup</button>
        </div>
        <a class="popup-close" data-popup-add-activity-close="popup-2" href="#">x</a>
    </div>
</div>
<input type="hidden" data-popup-remove-tile-open="popup-1">

<input type="hidden" data-popup-add-activity-open="popup-2">
<script src='{{ URL::asset("js/app/patch-activities.js") }}'></script>
@endsection