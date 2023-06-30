<?php

namespace App;
use DB;
use App\Models\tc;

use App\Models\tcrequest;

use App\Models\coursem;


use App\Models\User;

use Illuminate\Http\Request;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Collection;


class Trainingcenter extends Model
{
    protected $table = 'trainingcenter';

    public function trainingcenter() {

         $tc = $this->orderBy('id', 'ASC')->where('state','1')->get();      
        return [
            'tc'=>$tc
        ];
    }


    public function add(request $request)
    {
        if($request->userID==tcrequest::where('userID',$request->userID)->where('state',0)->where('dashactive',1)->where('branched_to',null)->value('userID'))
            {
return 'you can not add/ you already have a tc';
        }
        else{
                    $pass = User::find($request->userID);
                  
                    $pass->passportID=$request->passportID;
                    $pass->hasTC=1;

                    $pass->save();

                    $imageName = $request->image->getClientOriginalName();
                    $request->image->storeAs('public/tc/image', $imageName);  

                    $logoName = $request->logo->getClientOriginalName();
                    $request->logo->storeAs('public/tc/logo', $logoName);  

                  DB::table('requests')->insert(array_merge($request->except('passportID'), ['dashActive' => 1,'state'=>0,'image' => 'tc/image/'.''.$imageName,

                  'logo' => 'tc/logo/'.''.$logoName]));
                  return 'ok';
        }

       

    }

    // UPDATE TC
    public function updater(request $request)

    { 
      
        if($request->userID==tcrequest::where('userID',$request->userID)->where('state',1)->where('dashactive',1)->where('branched_to',null)->value('userID'))
        {
return 'you already have a tc on update list';
    }
    else{
                $imageName = $request->image->getClientOriginalName();
                $request->image->storeAs('public/tc/image', $imageName);  

                $logoName = $request->logo->getClientOriginalName();
                $request->logo->storeAs('public/tc/logo', $logoName);  

              DB::table('requests')->insert(array_merge($request->except('passportID'), ['dashActive' => 1,'state'=>1,'image' => 'tc/image/'.''.$imageName,

              'logo' => 'tc/logo/'.''.$logoName]));
              return 'ok';
    }
    }



    //branchs
    public function addB(request $request)
    {
                    //'branched_to'=>$request->tcID,

                    $imageName = $request->image->getClientOriginalName();
                    $request->image->storeAs('public/tc/image', $imageName);  
    
                    $tclogo=tc::where('id',$request->tcID)->value('logo');
                    DB::table('trainingcenter')->insert(array_merge($request->except('dashActive','tcID','passportID'),
                  
                  [
                  'state'=>0,'image' => 'tc/image/'.''.$imageName,
                  'logo' => $tclogo,
                  'branched_to'=>$request->tcID]));
                  return 'ok';
    }
       
       public function updaterB(request $request)
       {
                       //'branched_to'=>$request->tcID,
                     DB::table('requests')->insert(array_merge($request->except('passportID'), ['dashActive' => 1,'state'=>0,'image' => 'tc/image/'.''.$imageName,
                     'logo' => 'tc/logo/'.''.$logoName]));
                     return 'ok';
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
             $x = $x ->concat( DB::table('tag')->where('id',$tag)->where('state',1) 
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
        
        
foreach($tcinfo as $tc)
        $tc->tags = $x;
       
        $tc->rate=number_format($tcrate, 1, '.', ',');
            $tc->ratecount=$ratecount;
           $tc->allowtorate=$allowtorate;
        
//    $tcinfo = json_decode($tcJSon,false);

        return [
            'info'=>$tc
        ];
    }

    

     //my courses
     public function mycourses(Request $request) {   
        $tcID= $request['tcID'];
        $c = DB::table('course')->where('TC',$tcID)->select('id','name','image')->get();
        return [
            'mycourses'=>$c
        ];
    }

    //my tc
    public function mytc(Request $request) {   
        $userID= $request['userID'];

        $tc = tc::where('userID',$userID)->where('branched_to',null)->select('id','name','image','logo','locName')->get();

        $bracn=tc::where('userID',$userID)->value('id');
        $tcid=tc::where('branched_to',$bracn)->where('userID',$userID)->select('id','name','image','logo','locName')->get()->all();

      
        return [
            'mytc'=>$tc,
            'branchs'=>$tcid,
        ];
    }


    //my  t   c    info
    public function mytcinfo(Request $request) {   
      
        $idtc=$request->tcID;
        $tc = tc::where('id',$idtc)->get();
        $course=coursem::where('TC',$idtc)->get();
        $trainer = DB::table('trainers')->where('TC',$idtc)->get();
        $tags= DB::table('trainingcenter')->where('id',$idtc)->value('tags');
        $arraytags = array_map('intval', explode(',', $tags));
        
        
        $branchs=tc::where('branched_to',$idtc)->count();

        $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('tag')->where('id',$tag)->where('state',1) 
                                              ->select(array('id','nameAR','NameEN'))->get());
        }


        $ratecount = DB::table('raters')->where('tcID',$idtc)->count();
        $ratesum = DB::table('raters')->where('tcID',$idtc)->sum('rating');
 
    
        if($ratecount==0){
            $tcrate=0;
        }else{$tcrate=$ratesum/$ratecount;}

        
        
        foreach($tc as $tc1)
        $tc1->tags = $x;
        $tc1->branchcount=$branchs;

        $tc1->rate=number_format($tcrate, 1, '.', ',');
        $tc1->ratecount=$ratecount;
       
      
        return [
            'mytc'=>$tc,
            'courses'=>$course,
            'trainers'=>$trainer,
            
            


           // 'courses'=>$course
        ];
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
                                                ->where('state',1)
                                                ->select(array('id','name','image'))->get()
           ];

           }
           else{
            $x = collect();
        foreach($arraytags as $tag){
             $x = $x ->concat( DB::table('trainingcenter')->where('tags','like','%'.$tag.'%') 
                                              ->where('name','like','%'.$search.'%')
                                              ->where('state',1)
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
                                                    ->where('state',1)
                                                    ->select(array('id','name','image'))->get()];
    
               }
               else{
                $x = collect();
            foreach($arraytags as $tag){
                 $x = $x ->concat( DB::table('course')->where('tags','like','%'.$tag.'%') 
                                                  ->where('name','like','%'.$search.'%')
                                                  ->where('state',1)
                                                  ->select(array('id','name','image'))
                                                  ->orderBy('created_at', 'DESC')->get());
            } 
            $x = $x -> unique();
            return ['listCourse'=>$x ->values()->all()];
        }
    
        else {
            $courselist = DB::table('Course')->where('name','like','%'.$search.'%')                                                ->where('state',1)
            ->select(array('id','name','image'))->orderBy('created_at', 'DESC')->get();
            $Tclsit = DB::table('trainingcenter')->where('name','like','%'.$search.'%')                                                ->where('state',1)
            ->select(array('id','name','image'))->orderBy('created_at', 'DESC')->get();
            return [
                
                'listCourse'=>$courselist,
                'listTC'=>$Tclsit,


        ];}
         
        
    }


    public function maps() {

        $tc = tc::where('state','1')->select('id','name','longitude','latitude')->get();      
       return [
           'tc'=>$tc
       ];
   }

}