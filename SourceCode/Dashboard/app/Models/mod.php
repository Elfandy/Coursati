<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;



class mod extends model
{
    use  HasFactory;

    protected $table = 'moderator';


    protected $fillable = [
        'name','password', 'state',
           'created_at'
    ];

    protected $hidden = [
       'password'
        
    ];
}


