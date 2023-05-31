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


    //show tc info 
    public function showtc(request $request)
    {
        $userID= $request['userID'];
        $id= $request['id'];

        $tcinfo = DB::table('trainingcenter')->where('id',$id)->get();

        $tags= DB::table('trainingcenter')->where('id',$id)->value('tags');
        $arraytags = array_map('intval', explode(',', $tags));
        $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('tag')->where('id','like','%'.$tag.'%') 
                                              ->select(array('id','nameAR','NameEN'))->get());
        }
        $ratecount = DB::table('raters')->where('tcID',$id)->count();
        $ratesum = DB::table('raters')->where('tcID',$id)->sum('rating');
        $check = DB::table('raters')->where('tcID',$id)->where('userID',$userID)->get();

        

        if($ratecount==0){
            $tcrate=0;
        }else{$tcrate=$ratesum/$ratecount;}

        if($check=='[]'){$allowtorate='yes';}
        else{$allowtorate='no';}

        return [
            'info'=>$tcinfo[0],
            'tags'=>$x,
            'rate'=>[
            'rate'=>number_format($tcrate, 1, '.', ','),
            'rate count'=>$ratecount,
           'allowToRate'=>$allowtorate
            ]

        ];
    }

    //your pending
    public function pending(Request $request) {   
        $userID= $request['userID'];
        return $this->orderBy('id', 'ASC')->where('active','0')->where('userID',$userID)->get();   
    }
    //rating Mangement 
    public function rate(Request $request) {   

        $rating= $request['rating'];
        $userID= $request['userID'];
        $tcID= $request['tcID'];

        $check = DB::table('raters')->where('userID',$userID)->where('tcID',$tcID)->get();

        if($check=='[]'){
            $data=array('userID'=>$userID,"tcID"=>$tcID,"rating"=>$rating);
            DB::table('raters')->insert($data);
            return 'added';
            
        }else {
            return 'you can not rate/already rated this tc';
        }  
    }
    public function updateRate(Request $request) {   

        $rating= $request['rating'];
        $userID= $request['userID'];
        $tcID= $request['tcID'];
        $data=array('userID'=>$userID,"tcID"=>$tcID,"rating"=>$rating);

        DB::table('raters')->where('userID',$userID)->where('tcID',$tcID)->update($data);
        return 'updated';
    }
    public function deleteRate(Request $request) {   

        $userID= $request['userID'];
        $tcID= $request['tcID'];
        DB::table('raters')->where('userID',$userID)->where('tcID',$tcID)->delete();
        return 'deleted';
    }

    //search functionality 
     public function search(Request $request) {   
        $type= $request['Type'];
        $search= $request['Search'];
        $tags= $request['Tags'];
       $arraytags = array_map('intval', explode(',', $tags));
      
       // $tags = [1,2];
        if($type=='training center')
        {
           if($tags==null){
            return ['listTC'=>DB::table('trainingcenter')->orderBy('created_at', 'DESC')
                                                ->where('name','like','%'.$search.'%')
                                                ->select(array('id','name','image'))->get()
           ];

           }
           else{
            $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('trainingcenter')->where('tags','like','%'.$tag.'%') 
                                              ->where('name','like','%'.$search.'%')
                                              ->select(array('id','name','image'))
                                              ->orderBy('created_at', 'DESC')->get());
        } 
        $x = $x -> unique();
        return ['listTC'=>$x ->values()->all()];
    }      
        }
             else if($type=='course')
        
             if($tags==null){
                return ['listCourse'=>DB::table('course')->orderBy('created_at', 'DESC')
                                                    ->where('name','like','%'.$search.'%')
                                                    ->select(array('id','name','image'))->get()];
    
               }
               else{
                $x = collect();
            foreach($arraytags as $tag){
                 $x = $x ->concat( DB::table('course')->where('tags','like','%'.$tag.'%') 
                                                  ->where('name','like','%'.$search.'%')
                                                  ->select(array('id','name','image'))
                                                  ->orderBy('created_at', 'DESC')->get());
            } 
            $x = $x -> unique();
            return ['listCourse'=>$x ->values()->all()];
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
