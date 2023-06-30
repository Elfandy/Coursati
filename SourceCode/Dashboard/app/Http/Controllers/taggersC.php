<?php

namespace App\Http\Controllers;

use App\Models\taggers;
use Illuminate\Http\Request;

class taggersC extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
      return taggers::latest()->get();
  
    }
    public function appindex()
    {
      return taggers::latest()->where('state',1)->get();
  
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
        taggers::create($request->all());
    }
   
    /**
     * Display the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function show(taggers $product)
    {
       
    }
   
    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function edit(taggers $tag)
    {
       
    }
  
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, taggers $tag)
    {
        $tag->where('id',$request->id)->update($request->all());
        return 'tag updated';
    }
  
    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Product  $product
     * @return \Illuminate\Http\Response
     */
    public function destroy(taggers $tag,Request $request)
     {
        
      $id=taggers::where('id',$request->id)->value('state');
      if($id==0){
        $tag->where('id',$request->id)->update(['state'=>1]);
        return 'success';
      }else $tag->where('id',$request->id)->update(['state'=>0]);
      return 'success';
    }
    public function put(taggers $product)
    {
                   
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
   
}
