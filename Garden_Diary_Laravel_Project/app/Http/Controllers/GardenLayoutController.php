<?php

namespace App\Http\Controllers;

use Illuminate\Routing\Controller as BaseController;
use Illuminate\Http\Request;

use App\Garden;
use App\User;
use App\Garden_Layout;
use App\Patch_User_Activity;
use App\Patch;
use App\Active_Patch_Activity;

use Auth;

class GardenLayoutController extends BaseController
{
    function storeGardenLayout(Request $request)
    {
        // sets canvasData
        $canvasData = $request->input('canvasData');
        // sets patchData
        $patchData = $request->input('patchData');
        $userid = Auth::user()->id;

        // finds garden layout for user
        $matchGardenLayout = ['user_id' => $userid];
        $gardenLayout = Garden_Layout::where($matchGardenLayout)->get();

        // if the garden layout is not empty then update the garden layout
        if($gardenLayout != '[]')
        {
            $gardenLayout[0]->update(array(
                'user_id' => $userid,
                'canvas_JSON' => $canvasData
            ));

            $msg = "Garden Layout has been saved";
        }
        // if garden layout is empty, it's a new garden layout
        else
        {
            // create new garden layout
            $newGardenLayout = new Garden_Layout();
            $newGardenLayout->user_id = $userid;
            $newGardenLayout->canvas_JSON = $canvasData;
            $newGardenLayout->save();

            $msg = "New Garden Layout has been saved";
        }

        $matchPatch = ['user_id' => $userid];

        // get all patches from user
        $patches = Patch::where($matchPatch)->get();

        // if patches is not null, remove all patches
        if($patches != null)
        {   
            foreach($patches as $patch)
            {
                $patch->delete();
            }
        }

        // update patches with a new set of patches (recreates patches)
        for($i = 0; $i<sizeof($patchData); $i++)
        {
            $patchName = $patchData[$i]['patchName'];
            
            if (strlen($patchName) > 30)
            {
                $patchName = substr($patchName, 0, 27) . '...';
            }

            $newPatch = new Patch();
            $newPatch->user_id = $userid;
            $newPatch->name = $patchName;
            $newPatch->patch_num = $patchData[$i]['patchNum'];
            $newPatch->save();
        }

        // get all patch activities
        $patchUserActivities = Patch_User_Activity::where(['user_id' => $userid])->get();

        foreach($patchUserActivities as $patchUserActivity)
        {
            // find patch
            $patchMatch = ['user_id' => $userid, 'patch_num' => $patchUserActivity->patch_id];
            $patch = Patch::firstOrNew($patchMatch);

            // if it does not exist, the patch has been removed
            if(!$patch->exists)
            {
                // find active patch activity
                $activePatchActivityMatch = ['user_id' => $userid, 'patch_activity_id' => $patchUserActivity->id];
                $activePatchActivity = Active_Patch_Activity::firstOrNew($activePatchActivityMatch);

                // if it exists, it should be removed as the patch has been removed
                if($activePatchActivity->exists)
                {
                    $activePatchActivity->delete();
                }
                
                // remove all activities that exist for this patch
                $patchUserActivity->delete();
            }
        }

        // Set JSON Response array (status = success | error)
        $response = array (
            'status' => 'success',
            'msg' => $msg,
            'canvas' => $canvasData
        );

        return $response;
    }

    function loadGardenLayout(Request $request)
    {
        $userid = Auth::user()->id;

        $matchGardenLayout = ['user_id' => $userid];
        $gardenLayout = Garden_Layout::where($matchGardenLayout)->get();

        if($gardenLayout != '[]')
        {
            // Set JSON Response array (status = success | error)
            // returnss garden JSON
            $response = array (
                'status' => 'success',
                'msg' => $gardenLayout[0]->canvas_JSON,
            );
        }
        else
        {
            // Set JSON Response array (status = success | error)
            // returns nothing - no garden
            $response = array (
                'status' => 'success',
                'msg' => '',
            );
        }

        return $response;
    }
}

?>

