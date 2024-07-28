<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Patch_User_Activity extends Model
{
    protected $table = 'patch_user_activities';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
        'patch_id',
        'activity_id',
        'user_activity'
    ];
}
