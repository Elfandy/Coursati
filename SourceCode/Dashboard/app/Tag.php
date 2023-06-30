<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Tag extends Model
{
    protected $table = 'tag';

public function tag() {

    return $this->orderBy('id', 'ASC')->where('active','1')->get();      
}


}