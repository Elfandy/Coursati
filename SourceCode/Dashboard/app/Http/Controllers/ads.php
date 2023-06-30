<?php

namespace App\Http\Controllers;

use App\Models\ad;
use Illuminate\Http\Request;

use Carbon;

class ads extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return ad::get();
  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)

    {  
     $imageName = $request->file->getClientOriginalName();
    $request->file->storeAs('public/ads', $imageName);      
     ad::create(array_merge($request->all(), ['image' => 'ads/'.''.$imageName]));
        return 'ad created';

    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\ad  $ad
     * @return \Illuminate\Http\Response
     */
    public function show(ad $ad)
    {
        
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\ad  $ad
     * @return \Illuminate\Http\Response
     */
    public function edit(ad $ad,Request $request)
    {
        ad::where('id',$request->id)->delete();
        return 'ad deleted'; 
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\ad  $ad
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, ad $ad)
    {
           
        $imageName = $request->image->getClientOriginalName();
        $request->image->storeAs('public/ads', $imageName);      
        ad::whereId($request->id)->update(array_merge($request->all(), ['image' => 'ads/'.''.$imageName]));
         return 'ad updated';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\ad  $ad  
     * @return \Illuminate\Http\Response
     */
    public function destroy(ad $ad,Request $request)
    {
        $id=ad::where('id',$request->id)->value('state');
        if($id==0){
          $ad->where('id',$request->id)->update(['state'=>1]);
        }else $ad->where('id',$request->id)->update(['state'=>0]);
        return ['success'];
   }

   public function dashads()
   {
       return ad::where('state',1)->select('id','title','image','description','link')->get();
  }
  public function lasteightads()
  {

      
      $lastest = ad::where('state',1)->whereDate('startDate', '<', now())->whereDate('endDate', '>', now())->select('startDate','endDate','id','title','image','description','link')->orderBy('created_at', 'DESC')->take(5)->get();

      if($lastest->isEmpty()){

        return ad::where('state',3)->get();

      }else 
      return $lastest;
 }



}
