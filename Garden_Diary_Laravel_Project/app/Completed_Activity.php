<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Completed_Activity extends Model
{
    protected $table = 'completed_activities';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'garden_layout_JSON',
        'plant_name',
        'patch_name',
        'activity_name',
        'completion_date'
    ];
}
