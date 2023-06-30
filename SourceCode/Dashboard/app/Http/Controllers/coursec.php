<?php

namespace App\Http\Controllers;

use App\Models\coursem;
use Illuminate\Http\Request;

class coursec extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
       return coursem::get();
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
     * @param  \App\Models\coursem  $coursem
     * @return \Illuminate\Http\Response
     */
    public function show(coursem $coursem)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\coursem  $coursem
     * @return \Illuminate\Http\Response
     */
    public function edit(coursem $coursem)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\coursem  $coursem
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, coursem $coursem)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\coursem  $coursem
     * @return \Illuminate\Http\Response
     */
    public function destroy(coursem $coursem,Request $request)
    {
        if($request->ban_text!=''){
            $coursem->where('id',$request->id)->update(['state'=>2]);
            $coursem->where('id',$request->id)->update(['ban_text'=>$request->ban_text]);
            return 'success';
        }
        else
            return 'your ban text is empty'; 
    }
}
