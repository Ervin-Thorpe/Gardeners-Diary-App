<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;

use App\User;
use App\Users_Plants_Activity;
use App\UsersPlant;
use App\Patch;
use App\Patch_User_Activity;
use App\Active_Patch_Activity;
use App\Completed_Activity;
use App\Garden_layout;

use Auth;
use DateTime;

class PagesController extends BaseController
{
    function getDiary()
    {
        return view('prototype');
    }

    function getHome()
    {
        return view('home');
    }

    function getHelp()
    {
        return view('help.help');
    }

    function postGardenLayout(Request $request)
    {
        return view('garden');
    }

    function getActivitiesHistory()
    {
        return view('diary');
    }

    function postActivitiesHistory(Request $request)
    {
        return view('diary');
    }

    function getGardenLayout()
    {
        return view('garden');
    }
}

?>