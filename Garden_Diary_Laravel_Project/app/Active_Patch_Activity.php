<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Active_Patch_Activity extends Model
{
    protected $table = 'active_patch_activities';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'patch_activity_id',
        'activity_start_date'
    ];
}
