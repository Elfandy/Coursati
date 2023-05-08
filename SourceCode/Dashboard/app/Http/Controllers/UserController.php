<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

use Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;




    class UserController extends Controller
{
    public function register(Request $request)
    {
        $plainPassword=$request->password;
        $password=bcrypt($request->password);
        $request->request->add(['password' => $password]);
 
        // create the user account 
        $created=User::create($request->all());
        $request->request->add(['password' => $plainPassword]);

        
        $ok='created';
       return [
            'account' => $ok
       ];

    }
    

    public function update(Request $request){
        


        $user =Auth::user();
        $user->name = $request['name'];
        $user->email = $request['email'];
        $user->gender = $request['gender'];

        $user->save();


        $ok='updated';
        return [
             'account' => $ok
        ];
    }
    


    

}   