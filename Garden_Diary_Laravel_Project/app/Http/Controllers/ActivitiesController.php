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

class ActivitiesController extends BaseController
{
    // Returns the user to the activity view
    function getGardenDiary()
    {
        return $this->userPatchActivities();
    }

    // adds a new patch activity and returns to the activity view
    function postGardenDiaryUserActivityUpdate(Request $request)
    {
        // request and 1 to suggest true to user activity
        $this->updatePatchActivity($request, 1);
        return $this->userPatchActivities();
    }

    // deletes selected patch and returns to activity view
    function postGardenDiaryUserActivityDelete(Request $request)
    {
        $this->removePatchActivity($request);
        return $this->userPatchActivities();
    }

    // starts selected patch and returns to activity view
    function postGardenDiaryUserActivityStart(Request $request)
    {
        $this->startActivePatchActivity($request);
        return $this->userPatchActivities();
    }

    // completes selected patch and returns to activity view
    function postGardenDiaryUserActivityComplete(Request $request)
    {
        $this->completePatchActivity($request);
        return $this->userPatchActivities();
    }
    // resets selected patch and returns to activity view
    function postGardenDiaryUserActivityReset(Request $request)
    {
        $this->resetPatchActivity($request);
        return $this->userPatchActivities();
    }

    // stops selected patch and returns to activity view
    function postGardenDiaryUserActivityStop(Request $request)
    {
        $this->stopPatchActivity($request);
        return $this->userPatchActivities();
    }

    // all the variables needed for the activity view
    private function userPatchActivities()
    {
        $usersPlants = $this->getUsersPlants();
        $usersPlantActivities = $this->getUsersPlantActivities();
        $usersPatches = $this->getUsersPatches();
        $inactivePatchNames = $this->getActivities(0);
        $upcomingPatchNames = $this->getActivities(1);
        $todaysPatchNames = $this->getActivities(2);
        $overduePatchNames = $this->getActivities(3);
        $noActivitiesPatchNames = $this->patchesNoActivities();

        return view('activities')
            ->with('usersPlants', $usersPlants)
            ->with('usersPlantActivities', $usersPlantActivities)
            ->with('usersPatches', $usersPatches)
            ->with('inactivePatchNames', $inactivePatchNames)
            ->with('upcomingPatchNames', $upcomingPatchNames)
            ->with('todaysPatchNames', $todaysPatchNames)
            ->with('overduePatchNames', $overduePatchNames)
            ->with('noActivitiesPatchNames', $noActivitiesPatchNames);
    }

    /**
    * Get the Users Plants
    *
    * Returns all of the users plants
    *
    * @return Type: UsersPlant | Name: usersPlant
    */
    private function getUsersPlants()
    {
        $userid = Auth::user()->id;

        $usersPlantMatch = ['user_id' => $userid];
        $usersPlants = UsersPlant::where($usersPlantMatch)->get();

        return $usersPlants;
    }

    /**
    * Get the Users Plant Activities
    *
    * Returns all of the users plant activities
    *
    * @return Type: Users_Plants_Activity | Name: usersPlantActivities
    */
    private function getUsersPlantActivities()
    {
        $userid = Auth::user()->id;

        $usersPlantActivityMatch = ['user_id' => $userid];
        $usersPlantActivities = Users_Plants_Activity::where($usersPlantActivityMatch)->get();

        return $usersPlantActivities;
    }

    /**
    * Get the Users Patches
    *
    * Returns all of the users patches
    *
    * @return Type: Patch | Name: usersPatches
    */
    private function getUsersPatches()
    {
        $userid = Auth::user()->id;

        $usersPatchMatch = ['user_id' => $userid];
        $usersPatches = Patch::where($usersPatchMatch)->orderBy('name')->get();

        return $usersPatches;
    }

    /**
    * Get Patch Activities
    *
    * Returns the all of the Patch Activities under the Activity Type that has been selected
    * Activity Type 0: Inactive Patch Activities,
    * Activity Type 1: Upcoming Patch Activities,
    * Activity Type 2: Todays Patch Activities,
    * Activity Type 3: Overdue Patch Activities
    *
    * @param Type: int | Name: activityType. 
    * @return Type: array | Name: usersActivityData
    */
    private function getActivities($activityType)
    {
        $userid = Auth::user()->id;

        $patchUserActivitiesArray = array();
        $activityDeadlineDatesArray = array();

        $patchUserActivitiesMatch = ['user_id' => $userid];
        $patchUserActivities = Patch_User_Activity::where($patchUserActivitiesMatch)->get();

        // activityType 0 is for creating inactive patch activities
        if($activityType == 0)
        {
            foreach($patchUserActivities as $patchUserActivity)
            {   
                // checks if the activity is an active activity
                $activePatchActivityMatch = ['patch_activity_id' => $patchUserActivity->id, 'user_id' => $userid];
                // if it doesn't exist, then create a new active activity
                $activePatchActivity = Active_Patch_Activity::firstOrNew($activePatchActivityMatch);

                // if it does not exist, then it's an inactive activity
                if(!$activePatchActivity->exists)
                {
                    // get the patch activity
                    $patchUserActivitiesTypeMatch = ['user_id' => $userid, 'id' => $activePatchActivity->patch_activity_id];
                    $patchUserActivitiesType = Patch_User_Activity::where($patchUserActivitiesTypeMatch)->get();

                    // add it to an array
                    array_push($patchUserActivitiesArray, $patchUserActivitiesType);
                }
            }
        }
        // else it's an active activity
        else
        {
            foreach($patchUserActivities as $patchUserActivity)
            {
                // checks if the activity is an active activity
                $activePatchActivityMatch = ['patch_activity_id' => $patchUserActivity->id, 'user_id' => $userid];
                // if it doesn't exist, then create a new active activity
                $activePatchActivity = Active_Patch_Activity::firstOrNew($activePatchActivityMatch);

                // if it does exist, then create a new active activity. If it doesn't, then don't and removes duplicates
                if($activePatchActivity->exists)
                {
                    $numOfDays = 0;
                    $usersPlantActivityMatch = ['id' => $patchUserActivity->activity_id, 'user_id' => $userid];

                    // if it's a user activity create, set the num of days as the activities days
                    if($patchUserActivity->user_activity == 1)
                    {
                        $usersPlantActivity = Users_Plants_Activity::firstOrNew($usersPlantActivityMatch);

                        if($usersPlantActivity->exists)
                        {
                            $numOfDays = $usersPlantActivity->days;
                        }
                    }

                    // get the date the activity was started
                    $activityStartDate = $activePatchActivity->activity_start_date;
                    // get current date
                    $currentDate = strtotime(date("Y-m-d"));
                    // set activity deadline date by activity start date + number of days
                    $originalActivityDeadlineDate = Date("Y-m-d", strtotime($activityStartDate.' + '.$numOfDays.' days'));
                    // set activity deadline to a time format to allow for calculation for actual date
                    $activityDeadlineCalc = strtotime($originalActivityDeadlineDate);
                    // set activity deadline to a d-m-Y format
                    $activityDeadlineDate = date("d-m-Y", strtotime($originalActivityDeadlineDate));;

                    if($activityType == 1)
                    {
                        // if the current date is less than the activity deadline date then it's an upcoming activity
                        if($currentDate < $activityDeadlineCalc)
                        {
                            $patchUserActivitiesTypeMatch = ['user_id' => $userid, 'id' => $patchUserActivity->id];
                            $patchUserActivitiesType = Patch_User_Activity::where($patchUserActivitiesTypeMatch)->get();

                            // push activity for upcoming activities into array
                            array_push($patchUserActivitiesArray, $patchUserActivitiesType);
                            // push activity deadline date into array
                            array_push($activityDeadlineDatesArray, $activityDeadlineDate);
                        }
                    }
                    else if($activityType == 2)
                    {
                        // if the current date is same as activity deadline date, then it's a today's activity
                        if($currentDate == $activityDeadlineCalc)
                        {
                            $patchUserActivitiesTypeMatch = ['user_id' => $userid, 'id' => $patchUserActivity->id];
                            $patchUserActivitiesType = Patch_User_Activity::where($patchUserActivitiesTypeMatch)->get();

                            // push activity for todays activities into array
                            array_push($patchUserActivitiesArray, $patchUserActivitiesType);
                            // push activity deadline date into array
                            array_push($activityDeadlineDatesArray, $activityDeadlineDate);
                        }
                    }
                    else if($activityType == 3)
                    {
                        // if the current date is greater than the activity deadline date then it's an overdue activity
                        if($currentDate > $activityDeadlineCalc)
                        {
                            $patchUserActivitiesTypeMatch = ['user_id' => $userid, 'id' => $patchUserActivity->id];
                            $patchUserActivitiesType = Patch_User_Activity::where($patchUserActivitiesTypeMatch)->get();

                            // push activity for overdue activities into array
                            array_push($patchUserActivitiesArray, $patchUserActivitiesType);
                            // push activity deadline date into array
                            array_push($activityDeadlineDatesArray, $activityDeadlineDate);
                        }
                    }
                }
            }
        }
        
        // array with all of the details for an activity (patch id, patch name, activity name, plant name, deadline)
        $usersActivityData = array();
        // array that will hold all of the arrays with details for an activity
        $usersActivityDatas = array();

        // if there are patch activities are they're not empty
        if($patchUserActivitiesArray != "[]")
        {
            $incrementNum = 0;
            // for each patch activity
            foreach($patchUserActivitiesArray as $usersPatchUserActivity)
            {
                // set patch name
                $matchUsersPatchName = ['user_id' => $userid, 'patch_num' => $usersPatchUserActivity[0]->patch_id];
                $usersActivityData['patch_name'] = Patch::where($matchUsersPatchName)->firstOrFail()->name;

                // set activity name
                $matchUsersActivityName = ['user_id' => $userid, 'id' => $usersPatchUserActivity[0]->activity_id];
                $usersPlant = Users_Plants_Activity::where($matchUsersActivityName)->firstOrFail();
                $usersPlantID = $usersPlant->users_plant_id;
                $usersActivityData['activity_name'] = $usersPlant->name;

                // set plant name
                $matchUsersPlantName = ['user_id' => $userid, 'id' => $usersPlantID];
                $usersActivityData['plant_name'] = UsersPlant::where($matchUsersPlantName)->firstOrFail()->name;

                // set patch id
                $matchPatchId = ['user_id' => $userid, 'patch_id' => $usersPatchUserActivity[0]->patch_id, 'activity_id' => $usersPatchUserActivity[0]->activity_id];
                $usersActivityData['patch_id'] = Patch_User_Activity::where($matchPatchId)->firstOrFail()->id;

                // set activity deadline if one exists
                if(!empty($activityDeadlineDatesArray))
                {
                    $usersActivityData['activity_deadline'] = $activityDeadlineDatesArray[$incrementNum];
                }

                $incrementNum++;
                // add the array containing all details for an activity in the activityDatas array
                array_push($usersActivityDatas, $usersActivityData);
            }
        }
        // return array with all of the arrays of activities with details
        return $usersActivityDatas;
    }

    /**
    * Update Patch Activity
    *
    * Updates the selected Patch Activity under whether it's a user activity or not.
    * User Activity 0: User Activity is FALSE,
    * User Activity 1: User Activity is TRUE
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request. 
    * @param Type: int | Name: userActivity.  
    */
    private function updatePatchActivity(Request $request, $userActivity)
    {
        $userid = Auth::user()->id;

        $patchNumber = $request->patchNum;

        $usersPlantActivity = $request->usersPlantActivity;
        $usersPlantActivity = json_decode($usersPlantActivity, true);
        $activityNumber = $usersPlantActivity['id'];

        // check if activity exists
        $patchUserActivityCheck = Patch_User_Activity::firstOrNew([
            'user_id' => $userid,
            'patch_id' => $patchNumber,
            'activity_id' => $activityNumber,
            'user_activity' => $userActivity
        ]);

        // if it exists, we don't want to create a new activity
        if (!$patchUserActivityCheck->exists) {
            $newPatchUserActivity = new Patch_User_Activity;
            $newPatchUserActivity->user_id = $userid;
            $newPatchUserActivity->patch_id = $patchNumber;
            $newPatchUserActivity->activity_id = $activityNumber;
            $newPatchUserActivity->user_activity = $userActivity;
            $newPatchUserActivity->save();
        }
    }

    /**
    * Remove Patch Activity
    *
    * Removes the selected Patch Activity
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request.
    */
    private function removePatchActivity(Request $request)
    {
        $userid = Auth::user()->id;

        // finds the patch activity
        $patchUserActivityMatch = ['id' => $request->patchActivityId, 'user_id' => $userid];
        $patchUserActivity = Patch_User_Activity::where($patchUserActivityMatch)->first();

        // if it is not null and exists, delete it
        if($patchUserActivity != null)
        {
            $patchUserActivity->delete();
        }

        // finds for the active patch activities
        $activePatchActivityMatch = ['user_id' => $userid, 'patch_activity_id' => $request->patchActivityId];
        $activePatchActivity = Active_Patch_Activity::where($activePatchActivityMatch)->first();

        // if it is not null and exists, delete it
        if($activePatchActivity != null)
        {
            $activePatchActivity->delete();
        }
    }

    /**
    * Start Patch Activity
    *
    * Starts the selected patch activity from current date.
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request. 
    */
    private function startActivePatchActivity(Request $request)
    {
        $userid = Auth::user()->id;

        // finds the active activity
        $activePatchActivityCheck = Active_Patch_Activity::firstOrNew([
            'user_id' => $userid,
            'patch_activity_id' => $request->patchActivityId
        ]);

        // finds the patch activity
        $patchUserActivityMatch = ['id' => $request->patchActivityId, 'user_id' => $userid];
        $patchUserActivity = Patch_User_Activity::firstOrNew($patchUserActivityMatch);

        // if it doesn't exist as an active patch activity and is an existing patch activity, that means it's an inactive activity
        if (!$activePatchActivityCheck->exists && $patchUserActivity->exists) 
        {
            if($patchUserActivity->user_activity == 1)
            {
                // find the result for the plant activity
                $usersPlantActivityMatch = ['id' => $patchUserActivity->activity_id, 'user_id' => $userid];
                $usersPlantActivity = Users_Plants_Activity::where($usersPlantActivityMatch)->first();
                // set days as days from the plant activity
                $days = $usersPlantActivity->days;
                // format the start activity dead as Y-m-d for today
                $activityStartDate = Date('Y-m-d');

                //$activityStartDate = Date('Y-m-d', strtotime('+'.$days.' days'));

                //add this new instance of active_patch_activity
                $newActivePatchActivity = new Active_Patch_Activity;
                $newActivePatchActivity->user_id = $userid;
                $newActivePatchActivity->patch_activity_id = $request->patchActivityId;
                $newActivePatchActivity->activity_start_date = $activityStartDate;
                $newActivePatchActivity->save();
            }  
        }
    }

    /**
    * Complete Patch Activity
    *
    * The selected patch activity is completed and SET TO INACTIVE
    * It is also added to the Completed Activities table along with the Garden Layout
    * for the Diary of the application.
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request. 
    */
    private function completePatchActivity(Request $request)
    {
        $userid = Auth::user()->id;

        // get active patch activity
        $activePatchActivityMatch = ['user_id' => $userid, 'patch_activity_id' => $request->patchActivityId];
        $activePatchActivity = Active_Patch_Activity::where($activePatchActivityMatch)->first();

        // if it is not null and exists
        if($activePatchActivity != null)
        {
            // get the current garden layout for the user
            $gardenLayouts = Garden_Layout::where(['user_id' => $userid])->first();

            // create a new instance of completed_activity with the garden_layout_JSON saved
            $newCompletedActivity = new Completed_Activity;
            $newCompletedActivity->user_id = $userid;
            $newCompletedActivity->garden_layout_JSON = $gardenLayouts->canvas_JSON;
            $newCompletedActivity->plant_name = $request->plantName;
            $newCompletedActivity->patch_name = $request->patchName;
            $newCompletedActivity->activity_name = $request->activityName;
            $newCompletedActivity->completion_date = date("Y-m-d");
            $newCompletedActivity->save();

            // delete the active patch so it becomes inactive
            $activePatchActivity->delete();
        }
    }

    /**
    * Reset Patch Activity
    *
    * Resets the selected patch activity deadline to START FROM THE CURRENT DATE
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request. 
    */
    private function resetPatchActivity(Request $request)
    {
        $userid = Auth::user()->id;

        // get active patch activity
        $activePatchActivityMatch = ['user_id' => $userid, 'patch_activity_id' => $request->patchActivityId];
        $activePatchActivity = Active_Patch_Activity::where($activePatchActivityMatch)->first();

        // if its not null and exists
        if($activePatchActivity != null)
        {
            // update the activity start date with the current date in the format of Y-m-d
            $activePatchActivity->update(array(
                'activity_start_date' => date("Y-m-d")
            ));
        }
    }

    /**
    * Stop Patch Activity
    *
    * Stops the selected Patch Activity by making it an INACTIVE PATCH ACTIVITY
    *
    * @param Type: \Illuminate\Http\Request Request | Name: request. 
    */
    private function stopPatchActivity(Request $request)
    {
        $userid = Auth::user()->id;

        // get active patch activity
        $activePatchActivityMatch = ['user_id' => $userid, 'patch_activity_id' => $request->patchActivityId];
        $activePatchActivity = Active_Patch_Activity::where($activePatchActivityMatch)->first();

        // if its not null and exists, delete the active patch activity
        if($activePatchActivity != null)
        {
            $activePatchActivity->delete();
        }
    }

    /**
    * Patches No Activities
    *
    * Returns the patches with NO ACTIVITIES
    *
    * @return Type: array | Name: patchesNoActivities
    */
    private function patchesNoActivities()
    {
        $userid = Auth::user()->id;

        $patchesNoActivities = array();
        $patchesNoActivity = array();

        // get all patches in the order by their names
        $patchesMatch = ['user_id' => $userid];
        $patches = Patch::where($patchesMatch)->orderBy('name')->get();

        foreach($patches as $patch)
        {
            // find patch activity
            $patchUserActivityMatch = ['user_id' => $userid, 'patch_id' => $patch->patch_num];
            $patchUserActivity = Patch_User_Activity::firstOrNew($patchUserActivityMatch);
            
            // if it exists, append it to the patchesNoActivity array
            if(!$patchUserActivity->exists)
            {
                $patchesNoActivity['patch_name'] = $patch->name;
                $patchesNoActivity['patch_num'] = $patch->patch_num;
                // append that patchesNoActivity to patchesNoActivities array
                array_push($patchesNoActivities, $patchesNoActivity);
            }
        }

        return $patchesNoActivities;
    }
}

?>