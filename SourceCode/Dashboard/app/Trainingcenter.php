<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Trainingcenter extends Model
{
    protected $table = 'trainingcenter';

    public function trainingcenter() {

        return $this->orderBy('id', 'ASC')->get();      
    }
}
