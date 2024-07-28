<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Garden_Layout extends Model
{
    protected $table = 'garden_layouts';
    public $timestamps = false;

    protected $fillable = [
        'user_id',
    	'canvas_JSON'
    ];
}
