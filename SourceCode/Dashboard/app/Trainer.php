<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use DB;

class Trainer extends Model
{
    protected $table = 'trainers';

public function trainer(Request $request) {

    return $this->orderBy('id', 'ASC')->where('tc',$request->tc)->get();      
}

protected $fillable = [
  
];

public function insertTrainer(request $request){

    $name = $request['name'];
    $major = $request['major'];
    $rating = $request['rating'];
    $description = $request['description'];
    $tc = $request['tc'];

    $data=array('name'=>$name,"major"=>$major,"rating"=>$rating,"description"=>$description,"TC"=>$tc);
    DB::table('trainers')->insert($data);

    
    return [
        'trainer'=>'added to your training center!'
    ];

}



}