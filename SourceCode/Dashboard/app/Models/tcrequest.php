<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class tcrequest extends Model
{
    use HasFactory;
    protected $table = 'requests';

    protected $fillable = [
        'name', 'logo','image','created_at'
    ];
}
