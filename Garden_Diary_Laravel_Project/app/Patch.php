<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Patch extends Model
{
    protected $table = 'patches';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
    	'name',
        'patch_num'
    ];
}
