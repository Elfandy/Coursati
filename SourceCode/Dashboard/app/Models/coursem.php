<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class coursem extends Model
{
    use HasFactory;
    protected $table = 'course';

    protected $fillable = [
        'active'
    ];

}
