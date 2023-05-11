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

        if (!auth()->attempt($request->only('email', 'password'))) {
            throw new AuthenticationException();
        }
        
        return [
            'token' => auth()->user()->createToken($request->user()->id)->plainTextToken
        
        ];
    }

    public function destroy(Request $request)
    {
        auth()->user()->tokens()->where('id', $request->user()->id)->delete();

        $ok='logged out';
        return [
             'account' => $ok
        ];
    }


     






}
