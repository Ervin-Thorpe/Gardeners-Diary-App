<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\UsersPlant;
use App\Users_Plants_Activity;
use App\Http\Requests\UsersPlantRequest;
use App\User;
use App\Patch_User_Activity;

use Auth;

class UsersPlantController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }

        $userid = Auth::user()->id;
        
        $usersPlants = UsersPlant::where('user_id', '=', $userid)->get();

        return view('usersplants.index')
            ->with('usersPlants', $usersPlants);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('usersplants.create');
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(UsersPlantRequest $request)
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }

        // this has to be created once to use this one instance of this model
        $usersPlant = new UsersPlant;

        $this->insertNewPlant($request, $usersPlant);
        $this->insertNewPlantActivities($request, $usersPlant);
        
        return redirect()
            ->route('my-plants.store')
            ->with('message', 'Your new plant has been added successfully');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }

        $userid = Auth::user()->id;
        $usersPlantMatch = ['id' => $id, 'user_id' => $userid];
        $usersPlant = UsersPlant::where($usersPlantMatch)->first();

        if($usersPlant != null)
        {
            $usersPlantActivityMatch = ['users_plant_id' => $usersPlant->id];
            $usersPlantActivities = Users_Plants_Activity::where($usersPlantActivityMatch)->get();

            return view('usersplants.show')
                ->with('usersPlant', $usersPlant)
                ->with('usersPlantActivities', $usersPlantActivities);
        }
        else
        {
            $userid = Auth::user()->id;
            $usersPlants = UsersPlant::where('user_id', '=', $userid)->get();

            return view('usersplants.index')
                ->with('usersPlants', $usersPlants);
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }

        $userid = Auth::user()->id;

        $matchUsersPlant = ['id' => $id, 'user_id' => $userid];
        $matchUsersPlantActivities = ['users_plant_id' => $id, 'user_id' => $userid];

        $usersPlant = UsersPlant::where($matchUsersPlant)->first();
        $usersPlantActivities = Users_Plants_Activity::where($matchUsersPlantActivities)->get();

        if($usersPlant != null)
        {
            return view('usersplants.edit')
                ->with('usersPlant', $usersPlant)
                ->with('usersPlantActivities', $usersPlantActivities);
        }
        else
        {
            $userid = Auth::user()->id;
            $usersPlants = UsersPlant::where('user_id', '=', $userid)->get();

            return view('usersplants.index')
                ->with('usersPlants', $usersPlants);
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(UsersPlantRequest $request, $id)
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }

        $this->updatePlantActivities($request, $id);
        $this->updatePlant($request, $id);

        return redirect()
            ->route('my-plants.index')
            ->with('message', 'Your plant has been updated successfully');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if(Auth::user() == null)
        {
            return view('auth.login');
        }
        
        $userid = Auth::user()->id;

        $usersPlantMatch = ['id' => $id, 'user_id' => $userid];
        $usersPlant = UsersPlant::where($usersPlantMatch)->firstOrFail();
        
        $usersPlantActivitiesMatch = ['users_plant_id' => $id, 'user_id' => $userid];
        $usersPlantActivities = Users_Plants_Activity::where($usersPlantActivitiesMatch)->get();

        if($usersPlantActivities != null)
        {
            foreach($usersPlantActivities as $usersPlantActivity)
            {
                $patchUserActivityMatch = ['activity_id' => $usersPlantActivity->id, 'user_id' => $userid];
                $patchUserActivity = Patch_User_Activity::where($patchUserActivityMatch)->first();

                if($patchUserActivity != null)
                {
                    $patchUserActivity->delete();
                }
                
                $usersPlantActivity->delete();
            }
        }

        $usersPlant->delete();

        return redirect()
            ->route('my-plants.index')
            ->with('message', 'Your plant has been removed successfully');
    }

    private function checkInputString($input, $inputName)
    {
        if($input != "")
        {
            return $input;
        }
        return "No ".$inputName." given";
    }

    private function updatePlantActivities($request, $id)
    {
        // get user id
        $userid = Auth::user()->id;

        // array to use to match to the correct data
        $matchUsersPlantActivities = ['users_plant_id' => $id, 'user_id' => $userid];
        // set variable to the Users_Plants_Activity where it matches the array
        $usersPlantActivities = Users_Plants_Activity::where($matchUsersPlantActivities)->get();

        // initially, number of activities will be 0
        $numOfActivities = 0;

        // get the number of activities that were added
        for ($i = 0; $i <= sizeof($request->activityName)-1; $i++) 
        {
            if($request->activityDays[$i] != '')
            {
                $numOfActivities++;
            }
        }

        // If size hasn't changed, just update values. If it has, remove old activities and add new values;
        if(sizeof($usersPlantActivities) == $numOfActivities)
        {
            for ($i = 0; $i <= sizeof($usersPlantActivities)-1; $i++) 
            {
                // update the model with the new values
                $usersPlantActivities[$i]->update(array(
                    'name' => $this->checkInputString($request->activityName[$i], "name"),
                    'description' => $this->checkInputString($request->activityDescription[$i], "description"),
                    'days' => $request->activityDays[$i]
                ));
            }
        }
        else
        {
            // delete all activities that exist for this plant
            foreach($usersPlantActivities as $usersPlantActivity)
            {
                $usersPlantActivity->delete();
            }
            
            // add new activities for this plant
            for ($i = 0; $i <= sizeof($request->activityName)-1; $i++) 
            {
                $updatedUsersPlantsActivity = new Users_Plants_Activity;
                $updatedUsersPlantsActivity->users_plant_id = $id;
                $updatedUsersPlantsActivity->user_id = $userid;
                $updatedUsersPlantsActivity->name = $this->checkInputString($request->activityName[$i], "name");
                $updatedUsersPlantsActivity->description = $this->checkInputString($request->activityDescription[$i], "description");
                $updatedUsersPlantsActivity->days = $request->activityDays[$i];
                $updatedUsersPlantsActivity->save();
            }
        }
    }

    private function updatePlant($request, $id)
    {
        // get user id
        $userid = Auth::user()->id;
        // array to use to match to the correct data
        $matchUsersPlant = ['id' => $id, 'user_id' => $userid];
        // set variable to the UsersPlant where it matches the array
        $usersPlant = UsersPlant::where($matchUsersPlant)->firstOrFail();

        // update model with new data
        $usersPlant->update(array(
            'name' => $request->name,
            'description' => $request->description
        ));
    }

    private function insertNewPlantActivities($request, $usersPlant)
    {
        // get user id
        $userid = Auth::user()->id; 
        // get userplant id
        $usersPlantId = $usersPlant->id;
        // initially, number of activities will be 0
        $numOfActivities = 0;

        // for each activity that was added, store details into the seperate arrays
        for ($i = 0; $i <= sizeof($request->activityName)-1; $i++) 
        {
            if($request->activityDays[$i] != '')
            {
                // store names into name array
                $name[] = $this->checkInputString($request->activityName[$i], "name");
                // store description into description array
                $description[] = $this->checkInputString($request->activityDescription[$i], "description");
                // store days into days array
                $days[] = $request->activityDays[$i];
                // increment number of activities
                $numOfActivities++;
            }
        }

        // depending on the number of activities, create a new model and insert the activities details
        // and save it onto the database
        for ($i = 0; $i < $numOfActivities; $i++) 
        {
            $usersPlantsActivity = new Users_Plants_Activity;
            $usersPlantsActivity->users_plant_id = $usersPlantId;
            $usersPlantsActivity->user_id = $userid;
            $usersPlantsActivity->name = $name[$i];
            $usersPlantsActivity->description = $description[$i];
            $usersPlantsActivity->days = $days[$i];
            $usersPlantsActivity->save();
        }
    }

    private function insertNewPlant($request, $usersPlant)
    {
        // get user id
        $userid = Auth::user()->id;
        // save the new userplant onto the database
        $usersPlant->user_id = $userid;
        $usersPlant->name = $request->name;
        $usersPlant->description = $request->description;
        $usersPlant->save();  
    }
}
