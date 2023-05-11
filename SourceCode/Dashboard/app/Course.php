<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Course extends Model
{
    protected $table = 'Course';

    public function course() {

        return $this->orderBy('id', 'ASC')->get();      
    }
}

