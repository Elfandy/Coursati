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
    $id= $request['id'];
    $facebook = $request['facebook'];
    $whatsapp = $request['whatsapp'];
    $website = $request['website'];
    $email = $request['email'];
    $phonenumber = $request['phonenumber'];
    $TC = $request['TC'];
    $userID = $request['userID'];

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
    $id= $request['id'];
    $facebook = $request['facebook'];
    $whatsapp = $request['whatsapp'];
    $website = $request['website'];
    $email = $request['email'];
    $phonenumber = $request['phonenumber'];
    $TC = $request['TC'];
    $userID = $request['userID'];
    
    $data2=array('name'=>$name,"logo"=>$logo,"openTime"=>$openTime,"closeTime"=>$closeTime,"address"=>$address,"discreption"=>$discreption,"facebook"=>$facebook,"whatsapp"=>$whatsapp
    ,"website"=>$website,"email"=>$email,"phonenumber"=>$phonenumber,"TC"=>$TC,"userID"=>$userID,"active"=>$active);
   


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




}
