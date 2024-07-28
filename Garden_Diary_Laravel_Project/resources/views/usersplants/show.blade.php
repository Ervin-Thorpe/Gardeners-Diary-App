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
                <div class="right-panel-top-title"> {{ $usersPlant->name }} </div>
            </div>
            <div class="panel-body view-plant-container main-container-overflow">
                <div id="activities-desc-container">
                    <table class="table table-bordered">
                        <tr style="border: 1px solid white; background-color:rgba(77, 132, 0, 1); color:white;"><th>Description of Plant</th></tr>
                        <tbody>
                            <tr id="user-plant-description-row">
                                <td id="user-plant-description-data-container"><div>{{ $usersPlant->description }}<div></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr>
                <br>
                <table name="activities[]" class="table table-bordered">
                    <tr style="border: 1px solid white; background-color:rgba(77, 132, 0, 1); color:white;"><th>Activity Name</th><th>Activity Description</th><th>Days</th></tr>
                    <tbody>
                        @foreach($usersPlantActivities as $usersPlantActivity)
                            <tr class="activities">
                                <td>{{ $usersPlantActivity->name }}</td>
                                <td class="user-activities-description-data-container"><div>{{ $usersPlantActivity->description }}</div></td>
                                <td>{{ $usersPlantActivity->days }}</td>
                            </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>      
        </div>
    </div>
</div>
@endsection