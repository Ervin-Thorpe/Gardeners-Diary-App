<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;

use App\Garden;
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

class DiaryController extends BaseController
{
    public function postPastCompletedActivities(Request $request)
    {
        $userid = Auth::user()->id;
        $selectedDate = Date("Y-m-d", strtotime($request->activitiesDate));

        // get all completed activities
        $completedActivitiesMatch = ['user_id' => $userid, 'completion_date' => $selectedDate];
        $completedActivities = Completed_Activity::where($completedActivitiesMatch)->get();

        // return to view with all completed activities
        return view("diary-completed-activities")
            ->with('completedActivities', $completedActivities);
    }

    public function postPastGardenLayout(Request $request)
    {
        $userid = Auth::user()->id;

        // find completed activity
        $completedActivityMatch  = ['id' => $request->activityId, 'user_id' => $userid];
        $completedActivity = Completed_Activity::where($completedActivityMatch)->first();

        // set canvasJSON as the garden_layout_JSON from the completedActivity
        $canvasJson = $completedActivity->garden_layout_JSON;

        // return view with canvasJSON
        return view("diary-completed-activities-garden")
            ->with('canvasJson', $canvasJson);
    }
}

?>