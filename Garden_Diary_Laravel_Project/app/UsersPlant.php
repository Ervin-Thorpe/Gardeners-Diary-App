<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class UsersPlant extends Model
{
    protected $table = 'users_plants';
    public $timestamps = false;
    
    protected $fillable = [
        'user_id',
        'name', 
        'description'
    ];
}
