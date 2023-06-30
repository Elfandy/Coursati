<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ad extends Model
{
    use HasFactory;
    protected $table = 'ads';

    protected $fillable = [
        'title','description','startDate','endDate','id',
        'link','moderatorID','state','created_at','image','updated_at'
    ];
}
