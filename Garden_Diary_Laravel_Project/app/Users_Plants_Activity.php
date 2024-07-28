<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Users_Plants_Activity extends Model
{
    protected $table = 'users_plant_activities';
    public $timestamps = false;
    
    protected $fillable = [
        'users_plant_id',
        'user_id',
        'name', 
        'description',
        'days'
    ];
}
