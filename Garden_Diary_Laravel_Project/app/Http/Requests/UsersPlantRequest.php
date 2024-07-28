<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UsersPlantRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        $rules = [];
        $numRowName = count($this->input('activityName')) - 1;
        $numRowDesc = count($this->input('activityDescription')) - 1;
        $numRowDays = count($this->input('activityDays')) - 1;
        //$numRowCreate = count($this->input('activity')) - 1;

        foreach(range(0, $numRowDays) as $index) {
            if($this->input('activityName')[$index] != '' || $this->input('activityDescription')[$index] != '')
            {
                $rules['activityName.' . $index] = 'max:30';
                $rules['activityDays.' . $index] = 'required|integer|between:1,365';
            }
            else
            {
                $rules['activityDays.' . $index] = 'integer|between:1,365';
            }
        }

        $rules['name'] = 'required|max:30';
        $rules['description'] = 'required';
        return $rules;
    }
}
