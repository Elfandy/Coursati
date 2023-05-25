<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Http\Request;
use DB;


class Trainingcenter extends Model
{
    protected $table = 'trainingcenter';

    public function trainingcenter() {

        return $this->orderBy('id', 'ASC')->where('active','1')->get();      
    }


    public function add(request $request)
    {

    $active = '0';

    
    $name = $request['name'];
    $logo = $request['logo'];
    $openTime = $request['openTime'];
    $closeTime = $request['closeTime'];
    $address = $request['address'];
    $discreption = $request['discreption'];
    //$id= $request['id'];
    $facebook = $request['facebook'];
    $whatsapp = $request['whatsapp'];
    $website = $request['website'];
    $email = $request['email'];
    $phonenumber = $request['phonenumber'];
    $TC = $request['TC'];

    //filled from the app
    $userID = $request['userID'];


    //fillable
    $data=array('name'=>$name,"logo"=>$logo,"openTime"=>$openTime,"closeTime"=>$closeTime,"address"=>$address,"discreption"=>$discreption,"facebook"=>$facebook,"whatsapp"=>$whatsapp
    ,"website"=>$website,"email"=>$email,"phonenumber"=>$phonenumber,"TC"=>$TC,"userID"=>$userID,"active"=>$active);


    DB::table('trainingcenter')->insert($data);

    $ok ='added';
    return [
        'tc'=>$ok
    ];
    }
    



    // UPDATE TC
    public function updater(request $request)
    {

    $active = '0';


    $name = $request['name'];
    $logo = $request['logo'];
    $openTime = $request['openTime'];
    $closeTime = $request['closeTime'];
    $address = $request['address'];
    $discreption = $request['discreption'];
    //$id= $request['id'];
    $facebook = $request['facebook'];
    $whatsapp = $request['whatsapp'];
    $website = $request['website'];
    $email = $request['email'];
    $phonenumber = $request['phonenumber'];
    $TC = $request['TC'];
    
    $data2=array('name'=>$name,"logo"=>$logo,"openTime"=>$openTime,"closeTime"=>$closeTime,"address"=>$address,"discreption"=>$discreption,"facebook"=>$facebook,"whatsapp"=>$whatsapp
    ,"website"=>$website,"email"=>$email,"phonenumber"=>$phonenumber,"TC"=>$TC,"userID"=>$userID,"active"=>$active);
   //get tc id
    $id= $request['id'];
    
    DB::table('trainingcenter')->where('id',$id)->update($data2);

    $ok ='updated';
    return [
        'tc'=>$ok
    ];
    }

    //notificaiton
    public function noti(request $request)
    {
        $userID= $request['userID'];
        return  DB::table('trainingcenter')->where('userID',$userID)->value('notificaiton');
    }


    //pending
    public function pending(Request $request) {   
        $userID= $request['userID'];
        return $this->orderBy('id', 'ASC')->where('active','0')->where('userID',$userID)->get();   
    }

    public function rate(Request $request) {   

        $rate= $request['rate'];
        $id= $request['id'];

        $allrate=DB::table('trainingcenter')->where('id',$id)->value('allrating');
        $count=DB::table('trainingcenter')->where('id',$id)->value('ratingcount');

        
        $newratecount =$count + 1 ;
        
        $newRate=($allrate + $rate) / $newratecount;
     
        DB::table('trainingcenter')->where('id',$id)->update(array('rating'=>$newRate));
        DB::table('trainingcenter')->where('id',$id)->update(array('ratingcount'=>$newratecount));
        $newAllrating = $allrate+$rate;
        DB::table('trainingcenter')->where('id',$id)->update(array('allrating'=>$newAllrating));

        return 'done';
    }

    //search functionality 
     public function search(Request $request) {   
        $type= $request['type'];
        $search= $request['search'];
        $tags= $request['tags'];
       $arraytags = array_map('intval', explode(',', $tags));
      
       // $tags = [1,2];
        if($type=='training center')
        {
           if($tags==null){
            return DB::table('trainingcenter')->orderBy('created_at', 'DESC')
                                                ->where('name','like','%'.$search.'%')
                                                ->select(array('id','name','image','tags'))->get();

           }
           else{
            $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('trainingcenter')->where('tags','like','%'.$tag.'%') 
                                              ->where('name','like','%'.$search.'%')
                                              ->select(array('id','name','image','tags'))
                                              ->orderBy('created_at', 'DESC')->get());
        } 
        $x = $x -> unique();
        return $x ->values()->all();
    }      
        }
             else if($type=='course')
        
             if($tags==null){
                return DB::table('course')->orderBy('created_at', 'DESC')
                                                    ->where('name','like','%'.$search.'%')
                                                    ->select(array('id','name','image','tags'))->get();
    
               }
               else{
                $x = collect();
            foreach($arraytags as $tag){
                 $x = $x ->concat( DB::table('course')->where('tags','like','%'.$tag.'%') 
                                                  ->where('name','like','%'.$search.'%')
                                                  ->select(array('id','name','image','tags'))
                                                  ->orderBy('created_at', 'DESC')->get());
            } 
            $x = $x -> unique();
            return $x ->values()->all();
        }
    
        else {
            $courselist = DB::table('Course')->where('name','like','%'.$search.'%')->select(array('id','name','image'))->get();
            $Tclsit = DB::table('trainingcenter')->where('name','like','%'.$search.'%')->select(array('id','name','image'))->get();
            return [
                
                'listCourse'=>$courselist,
                'listTC'=>$Tclsit,


        ];}
         
        
    }



}
