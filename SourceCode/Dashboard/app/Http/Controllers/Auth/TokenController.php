<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Http\Request;
use App\Models\User;


class TokenController extends Controller
{
    public function store(Request $request)
    {
        $this->validate($request, [
            'email' => 'required|email',
            'password' => 'required',
        ]);
        $name=$request->deviceID;
        if (!auth()->attempt($request->only('email', 'password'))) {
            throw new AuthenticationException();
        }
        
        if(auth()->user()->state==1){
        return [
            'token' => auth()->user()->createToken($request->deviceID)->plainTextToken
        ];}

        else if (auth()->user()->state==0)
        {return [
            'message'=>'0'
        ];}
    }

    public function destroy(Request $request)
    {

        auth()->user()->tokens()->where('userid', $request->user()->id)->delete();
        return 'logged out';
    }


     






}
