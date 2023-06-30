<?php

namespace App\Http\Controllers;

use App\Models\tc;
use App\Models\taggers;

use DB;
use Illuminate\Http\Request;

class tcs extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return tc::latest()->get();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
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
     * @param  \App\Models\tc  $tc
     * @return \Illuminate\Http\Response
     */
    public function show(tc $tc)
    {
        $id = $tc->id;

        $tags= DB::table('trainingcenter')->where('id',$id)->value('tags');
        $arraytags = array_map('intval', explode(',', $tags));

        $x='';
        foreach($arraytags as $tag){
             $x = $x.' | '.DB::table('tag')->where('id','like','%'.$tag.'%')->value('nameAR');
        }

        $tra= DB::table('trainingcenter')->where('id',$id)->value('trainers');
        $arr = array_map('intval', explode(',', $tags));

        $z='';
        foreach($arr as $t){
             $z = $z.' | '.DB::table('trainers')->where('id','like','%'.$t.'%')->value('name');
        }
       
      return view('tc.show',['tc'=>$tc,'tagsN'=>$x,'trainers'=>$z]);    
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\tc  $tc
     * @return \Illuminate\Http\Response
     */
    public function edit(tc $tc)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\tc  $tc
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, tc $tc)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\tc  $tc
     * @return \Illuminate\Http\Response
     */
    public function destroy(tc $tc,Request $request)
    {
        $id=tc::where('id',$request->id)->value('state');
        if($id==0){
          $tc->where('id',$request->id)->update(['state'=>1]);
        }else $tc->where('id',$request->id)->update(['state'=>0]);
        return 'success';
    }
}
