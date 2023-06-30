<?php

  

namespace App\Models;

  

use Illuminate\Database\Eloquent\Factories\HasFactory;

use Illuminate\Database\Eloquent\Model;

  

class taggers extends Model

{

    use HasFactory;

    protected $table = 'tag';

    protected $fillable = [
        'nameAR', 'nameEN','state','moderatorID'
    ];

}