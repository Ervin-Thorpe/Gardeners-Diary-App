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
        <div class="col-xs-10 col-sm-10 col-md-11 mainbar">
            <div class="right-panel-container">
                <div class="right-panel-top-container">
                    <div class="right-panel-top-title">My Plants</div>
                </div>
                <div class="right-panel-bottom-container">
                    <div id="activities-desc-container" class="main-container-overflow">
                        <table class="activities-table">
                            <tbody>
                                @foreach($usersPlants as $usersPlant)
                                    <tr>
                                        <td colspan="1"class="table-activity-data-desc">
                                            <h4>{{ $usersPlant->name }}</h4>
                                        </td>
                                        <td class="table-activity-data">
                                            <div class="activity-btn-container">
                                                {!! Form::open(array('route'=>['my-plants.destroy', $usersPlant->id], 'method'=>'DELETE')) !!}
                                                <div class="float-left">{{ link_to_route('my-plants.show', 'More Info', [$usersPlant->id], ['class' => "btn btn-info"]) }} </div>
                                                <div class="plant-btn-seperator float-left">{{ link_to_route('my-plants.edit', 'Edit', [$usersPlant->id], ['class' => "btn btn-primary"]) }} </div>
                                                <div class="plant-btn-seperator float-left">{!! Form::submit('Delete', ['class'=>'btn btn-danger']) !!} </div>
                                                {!! Form::close() !!}
                                            </div>
                                        </td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                        <hr>
                        <div class="center-btn-container"> {{ link_to_route('my-plants.create', 'Add New Plant', null, ['class' => "btn btn-success"]) }} </div>
                    </div>
                </div>
            </div>
            @if(Session::has('message'))
                <div class="alert alert-success"> {{ Session::get('message')}} </div>
            @endif
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