<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Trainer extends Model
{
    protected $table = 'trainers';

public function trainer() {

    return $this->orderBy('id', 'ASC')->get();      
}}