@extends('layouts.master')

@section('content')
<script>
 

$(document).ready(function(){
    $("#add-row").click(function(){
var rows = $('.activities').length+1;

        var markup = '<tr class="activities"><td><input type="text" maxlength="30" name="activityName[]" class="form-control" placeholder="Activity Name"></td><td><textarea name="activityDescription[]" rows="4" class="form-control" placeholder="Activity Description"></textarea></td><td><input placeholder="Days" class="form-control" name="activityDays[]" type="text"></td></tr>';
        $('tbody:last').append(markup);

        // counter++;

       $("#theCount").append(counter);
    });
});

$(document).ready(function(){
    $("#remove-row").click(function(){
        $('table tr.activities:last').remove();
    });
});

</script>

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
                <div id="plants-navigation-container" class="active-nav-btn-container">
                    <img src="/images/plants_icon_active.png" id="plants-navigation"/>
                    <div class="active-navigation-btn-text">My Plants</div>
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
        <div class="right-panel-container col-xs-10 col-sm-10 col-md-11 col-md-offset-1 mainbar">
            <div class="right-panel-top-container">
                <div class="right-panel-top-title">Create New Plant</div>
            </div>
            <div class="panel-body">
                <div id="activities-desc-container" class="main-container-overflow">
                    {!! Form::open(array('route' => 'my-plants.store')) !!}
                        <div class="form-group">
                            {!! Form::label('name', 'Enter Plant Name')!!}
                            {!! Form::text('name', null, array('class' => 'form-control user-plant-max-width', 'maxlength' => 30)) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('description', 'Enter Plant Description')!!}
                            {!! Form::textarea('description', null, ['class' => 'form-control user-plant-max-width']) !!}
                        </div>
                        <table class="table table-bordered">
                            <tr style="border: 1px solid white; background-color:rgba(77, 132, 0, 1); color:white;"><th>Activity Name</th><th>Activity Description</th><th>Days</th></tr>
                            <tbody>
                                <tr class="activities">
                                    <td><input placeholder="Activity Name" class="form-control" name="activityName[]" type="text" maxlength="30"></td>
                                    <td><textarea placeholder="Activity Description" class="form-control user-plant-activity-description-textarea" rows="4" name="activityDescription[]" cols="50"></textarea></td>
                                    <td><input placeholder="Days" class="form-control" name="activityDays[]" type="text"></td>
                                </tr>
                            </tbody>
                        </table>
                        <div class="form-group">
                            <button type="button" class="btn btn-success" id="add-row"> + Add New Activity</button>
                            <button type="button" class="btn btn-danger" id="remove-row"> X Delete Last Activity</button>
                        </div>
                        <div class="form-group center-btn-container">
                            {!! Form::submit('Create', ['class'=>'btn btn-primary center-btn']) !!}
                        </div>
                    {!! Form::close() !!}
                </div>
                <br>
                @if($errors->any())
                    <ul class="alert alert-danger">
                        @if($errors->has('name') || $errors->has('description'))
                            @if($errors->has('name'))
                                <li><b>Plant Name</b> is required and must be <b>30 characters</b> or less</li>
                            @endif
                            @if($errors->has('description'))
                                <li><b>Plant Description</b> is required</li>
                            @endif
                        @else
                            <li><b>Activity Name</b> must be <b>30 characters</b> or less</li>
                            <li><b>Days</b> must be an <b>integer</b> between <b>1 and 365</b> and <b>number of days is required</b></li>
                        @endif
                    </ul>
                @endif
            </div>      
        </div>
    </div>
</div>
<div class="popup" data-popup="popup-1">
    <div class="popup-inner">
        <div id="popup-title"></div><br/>
        <b><div id="popup-desc"></div></b><br/>
        <div id="popup-btn-group">
            <button class="norm-btn btn-danger" id="popup-yes">Yes</button>
            <button data-popup-close="popup-1" class="norm-btn btn-primary" id="popup-no">No</button>
        <div>
        <a class="popup-close" data-popup-close="popup-1" href="#">x</a>
    </div>
</div>
<input type="hidden" data-popup-open="popup-1">
@endsection