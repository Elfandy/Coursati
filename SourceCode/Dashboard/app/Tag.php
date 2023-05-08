<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Tag extends Model
{
    protected $table = 'tags';

public function tag() {

    return $this->orderBy('id', 'ASC')->get();      
}
}