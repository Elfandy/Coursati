<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use DB;


class Course extends Model
{
    protected $table = 'Course';

    public function course() {

        return $this->orderBy('created_at', 'DESC')->get();      
    }

    public function add(request $request)
    {

    $active = '0';

    
    $name = $request['name'];
    $image = $request['image'];
    $courseID = $request['courseID'];
    $tags = $request['tags'];
    $period= $request['period'];
    $startDate = $request['startDate'];
    $discreption = $request['discreption'];
    
    $price = $request['price'];
    $duration = $request['duration'];
    $rating = $request['rating'];
    $TC = $request['TC'];
    $Trainer = $request['Trainer'];

    //filled from the app
    //none


    //fillable
    $data=array('name'=>$name,"image"=>$image,"courseID"=>$courseID,"tags"=>$tags,"startDate"=>$startDate,"discreption"=>$discreption,"price"=>$price,"duration"=>$duration
    ,"rating"=>$rating,"TC"=>$TC,"Trainer"=>$Trainer,"active"=>$active,"period"=>$period);


    DB::table('course')->insert($data);

    $ok ='added';
    return [
        'course'=>$ok
    ];
    }
    




}

