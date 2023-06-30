<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use App\Models\tc;
use App\Models\coursem;

use DB;


class Course extends Model
{
    protected $table = 'Course';

    public function course(tc $tc,coursem $course) {

            // $tc->where('id',$course);
        $c= $this->orderBy('created_at', 'DESC')->select('id','name','image','TC')->where('state',1)->get();
        for( $i =0 ; $i<$c->count(); $i++){
            $tc1 = tc::where('id',$c[$i]['TC'])->select('locName')->value('locName');
           $c[$i]['locName'] = $tc1;
        }
        return ['courses'=>$c,
        ]
        ;      
    }

    
    public function showc(Request $request) {
        $id = $request['id'];

        $cc =  DB::table('course')->where('id',$id)->get();

         $ccTrainer =  DB::table('course')->where('id',$id)->value('trainers');

        $ccTC = DB::table('trainingcenter')->select('name','locName','longitude','latitude','logo')->where('id',$cc ->value('TC'))->get();

        $trainer = DB::table('trainers')->where('id',$ccTrainer)->get();

        $tags= DB::table('course')->where('id',$id)->value('tags');
    
        $arraytags = array_map('intval', explode(',', $tags));

        $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('tag')->where('id',$tag)->where('state',1) 
                                              ->select(array('id','nameAR','NameEN'))->get());
        } 
            $rate =  DB::table('course')->where('id',$id)->value('rating');


        

            foreach($cc as $tc){
        $tc->tags = $x;
        $tc->trainer = $trainer;
        $tc->location = $ccTC;
        $tc->TCname= $ccTC[0]->name;
        $tc->TClogo= $ccTC[0]->logo;


            }

    
        return [
            'info'=>$cc
            //  'trainer'=>$trainer,
            //  'tags'=>$x         
    ];   
        


    }
        

 

    public function add(request $request)
    {

    $active = '0';


    //most important
    $tcID = $request['tcID'];


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
    $tcID = $request['tcID'];
    

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

