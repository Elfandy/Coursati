<?php

namespace App\Http\Controllers;

use App\Models\tcrequest;
use Illuminate\Http\Request;
use DB;
class tcrequests extends Controller
{
    /**     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return tcrequest::latest()->where('dashActive',1)->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request,tcrequest $tcreq)
    {
              
        if($request->acc==1){

        $req = tcrequest::find($request->id);
        $data=array('name'=>$req->name,
        "image"=>$req->image,"logo"=>$req->logo,"tags"=>$req->tags,
        "openTime"=>$req->openTime,"closeTime"=>$req->closeTime,"description"=>$req->description,
        "locName"=>$req->locName,
        "email"=>$req->email,
        "website"=>$req->website,"facebook"=>$req->facebook,"whatsapp"=>$req->whatsapp,
        "phonenumber"=>$req->phonenumber,"email"=>$req->email,"longitude"=>$req->longitude,"latitude"=>$req->latitude,"userID"=>$req->userID,"state"=>1);
        DB::table('trainingcenter')->insert($data);

        $tcreq->where('id',$request->id)->update(['dashActive'=>0]);

        return 'success';
    }
        else
         { 

            //$tcreq->where('id',$request->id)->update(['dashActive'=>0]);

            $tcreq->where('id',$request->id)->delete();

            return 'success';

         }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        
        $id=$request->id;
        $data =  DB::table('requests')->where('id',$id)->get();
        // DB::table('trainingcenter')->insert(array_merge($request->all(), ['active'=>1]));
        // return [
        //     'tc'=>'added',
        // ];
            return $data;

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\tcrequest  $tcrequest
     * @return \Illuminate\Http\Response
     */
    public function show(tcrequest $tcrequest)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\tcrequest  $tcrequest
     * @return \Illuminate\Http\Response
     */
    public function edit(tcrequest $tcrequest)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\tcrequest  $tcrequest
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, tcrequest $tcrequest)
    {
            // راااك تنسا ال TCID FROM THE APP >> tcID = app.get(id)

           if($request->acc==1){

          $req = tcrequest::find($request->id);
        $data=array('name'=>$req->name,
        "image"=>$req->image,"logo"=>$req->logo,"tags"=>$req->tags,
        "openTime"=>$req->openTime,"closeTime"=>$req->closeTime,"description"=>$req->description,
        "locName"=>$req->locName,
        "email"=>$req->email,
        "website"=>$req->website,"facebook"=>$req->facebook,"whatsapp"=>$req->whatsapp,"phonenumber"=>$req->phonenumber,"email"=>$req->email,
        "longitude"=>$req->longitude,"latitude"=>$req->latitude,"state"=>1);
    
    
        DB::table('trainingcenter')->where('id',$req->tcID)->update($data);
        $tcrequest->where('id',$request->id)->update(['dashActive'=>0]);

        return 'success 1';
            }
        else
         { 
            $tcrequest->where('id',$request->id)->delete();
            return 'success';

         }
      

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\tcrequest  $tcrequest
     * @return \Illuminate\Http\Response
     */
    public function destroy(tcrequest $tcrequest)
    {
        //
    }
}
