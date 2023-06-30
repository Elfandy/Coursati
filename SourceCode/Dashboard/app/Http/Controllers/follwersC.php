<?php

namespace App\Http\Controllers;

use App\Models\followers;
use App\Models\tcs;
use DB;

use Illuminate\Http\Request;

class follwersC extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $req)
    {
    
       $myfav = followers::where('userID',$req->userID)->pluck('tcID')->toArray();
       $x = collect();
      foreach($myfav as $go)
{
    $x=$x->concat( DB::table('trainingcenter')->where('id', $go)->get());
}

    
  
    return $x ->values()->all();
}

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $req)
    {
        $userData = array('userID' => $req->userID, 'tcID' => $req->tcID);
        followers::create($userData);
        return 'ok';
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\followers  $followers
     * @return \Illuminate\Http\Response
     */
    public function show(followers $followers)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\followers  $followers
     * @return \Illuminate\Http\Response
     */
    public function edit(followers $followers)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\followers  $followers
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, followers $followers)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\followers  $followers
     * @return \Illuminate\Http\Response
     */
    public function destroy(Request $req)
    {
        followers::where('userID',$req->userID)
        ->where('tcID',$req->tcID)->delete();
        return 'ok';
    }
}
