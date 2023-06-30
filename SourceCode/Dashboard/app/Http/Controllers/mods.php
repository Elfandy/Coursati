<?php

namespace App\Http\Controllers;

use App\Models\mod;
use Illuminate\Http\Request;
use DB;

use Illuminate\Support\Facades\Hash;
use App\Http\Controllers\Controller;







class mods extends Controller
{

    
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return  mod::where('id','!=',0)->get();
  
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {

       // return $request->all();
        $password=bcrypt($request->password);
        
        $request->request->add(['password' => $password]);
 
        // create the mod account 
        try{
        $created=mod::create($request->all());
        }
        catch(\Exception $e)
        
        {return $e;}

       return 
            'account created';
       
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

   

    public function store(Request $request)
    {
        $name=$request->name;
        $password=$request->password;
        $found=mod::where('name',$name)->get();
        if($found!='[]'){
        $hashedpass=$found->value('password');
        if(Hash::check($password, $hashedpass)==1)
            {
                if($found->value('state')==1){
                    return $found;
                }else return 'failed';
            }else{return 'failed';}
        }
        else return 'failed';
    }
       
    /**
     * Display the specified resource.
     *
     * @param  \App\Models\mod  $mod
     * @return \Illuminate\Http\Response
     */
    public function show(mod $mod,Request $request)
    {

        $found=mod::where('name', $request->name)->get();

        return $found;

    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\mod  $mod
     * @return \Illuminate\Http\Response
     */
    public function edit(mod $mod)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\mod  $mod
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, mod $mod)
    {
       
       // return $request->all();
       $password=bcrypt($request->password);
        
       $request->request->add(['password' => $password]);

       // create the mod account 
       try{
        mod::where('id', $request->id)
      ->update(['name' => $request->name,'password'=>$password]);
       }
       catch(\Exception $e)
       
       {return 'name already taken';}

      return 'account updated';
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Models\mod  $mod
     * @return \Illuminate\Http\Response
     */
    public function destroy(mod $mod,Request $request)
    {

      $id=mod::where('id',$request->id)->value('state');
      if($id==0){
        $mod->where('id',$request->id)->update(['state'=>1]);
        return 'mod enabled ';

      }else $mod->where('id',$request->id)->update(['state'=>0]);
      return 'mod disabled';
      
   }
   public function tcTotal(){
      
    $tc = DB::table('trainingcenter')->where('state','1')->count();

       return [
           'total'=>$tc,
       ];
}
public function uTotal(){

   $users = DB::table('users')->where('state','1')->count();

       return [
           'total'=>$users,
       ];
}
public function cTotal(){
  
 $course = DB::table('course')->count();

       return [
           'total'=>$course,
       ];
}
}
