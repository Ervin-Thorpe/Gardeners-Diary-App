<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="csrf_token" content="{!! csrf_token() !!}"/>

    <link rel="stylesheet" href='{{ URL::asset("css/bootstrap.min.css") }}'/>
    <link rel="stylesheet" href="http://fonts.googleapis.com/css?family=Walter+Turncoat" />
    <link rel="stylesheet" href='{{ URL::asset("css/master.css") }}' />
    <link rel="stylesheet" href='{{ URL::asset("css/allotments-selection.css") }}' />
    <link rel="stylesheet" href='{{ URL::asset("css/diary.css") }}' />
    <link rel="stylesheet" href='{{ URL::asset("css/activities-history.css") }}' />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    
    <meta chartset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <!--script src='{{ URL::asset("js/minifiedjs/jquery-3.1.1.min.js") }}'></script-->
    <script src='{{ URL::asset("/js/app.js") }}'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src='{{ URL::asset("js/minifiedjs/fabric.min.js") }}'></script>

    <title>Gardener's Diary</title>

    <!-- Scripts -->
    <script>
        window.Laravel = <?php echo json_encode([
            'csrfToken' => csrf_token(),
        ]); ?>
    </script>
</head>
<body>
    <div id="app">
        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">

                    <!-- Collapsed Hamburger -->
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                        <span class="sr-only">Toggle Navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>

                    <!-- Branding Image -->
                    <a class="navbar-brand default-text-hover-color" href="{{ url('/') }}">
                        Gardener's Diary
                    </a>
                    <ul class="nav navbar-nav">
                        
                    </ul>
                </div>

                <div class="collapse navbar-collapse" id="app-navbar-collapse">
                    <!-- Left Side Of Navbar -->
                    <ul class="nav navbar-nav">
                        &nbsp;
                    </ul>

                    <!-- Right Side Of Navbar -->
                    <ul class="nav navbar-nav navbar-right">
                        <!-- Authentication Links -->
                        @if (Auth::guest())
                            <li><a class="default-text-hover-color" href="{{ url('/login') }}">Login</a></li>
                            <li><a class="default-text-hover-color" href="{{ url('/register') }}">Register</a></li>
                        @else
                            <li class="dropdown default-text-color">
                                <a href="#" class="dropdown-toggle default-text-hover-color" data-toggle="dropdown" role="button" aria-expanded="false">
                                    {{ Auth::user()->name }} <span class="caret"></span>
                                </a>

                                <ul class="dropdown-menu default-text-hover-color" role="menu">
                                    <li>
                                        <a href="{{ url('/logout') }}" class="dropdown default-text-color" onclick="event.preventDefault();
                                                     document.getElementById('logout-form').submit();">
                                            Logout
                                        </a>

                                        <form id="logout-form" action="{{ url('/logout') }}" method="POST" style="display: none;">
                                            {{ csrf_field() }}
                                        </form>
                                    </li>
                                </ul>
                            </li>
                        @endif
                    </ul>
                </div>
            </div>
        </nav>

        @yield('content')
    </div>

    <!-- Scripts -->
    <script>
        // global app configuration object
        var config = {
            routes: [
                { 
                    layoutSave: "{{ URL::to('/layout/save') }}" ,
                    layoutLoad: "{{ URL::to('/layout/load') }}" ,
                    gardenActivities: "{{ URL::to('/activities') }}",
                    pastLayoutLoad: "{{ URL::to('/diary/past-garden-layout') }}"
                }
            ]
        };
    </script>
    <script src='{{ URL::asset("js/app/popup-module.js") }}'></script>
    <script src='{{ URL::asset("js/app/pop-up.js") }}'></script>
</body>
</html>
