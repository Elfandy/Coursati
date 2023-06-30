<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;

use Auth;

use App\Http\Controllers\Controller;
use Illuminate\Auth\AuthenticationException;




    class UserController extends Controller
{

    public function index()
    {
        return User::latest()->get();
    }


    public function register(Request $request)
    {
        $plainPassword=$request->password;
        $password=bcrypt($request->password);
        
        $request->request->add(['password' => $password]);
 
        // create the user account 
        $created=User::create($request->all());

        $request->request->add(['password' => $plainPassword]);

       return 'account created';
    }
    

    public function update(Request $request){
        $user =Auth::user();

        $user->name = $request['name'];
        $user->email = $request['email'];
        $password=bcrypt($request->password);  
        $user->avatar = $request['avatar'];
        $user->gender = $request['gender'];
        $user->personalID = $request['personalID'];
        $user->phonenumber = $request['phonenumber'];

        $user->birthdate = $request['birthdate'];

        $user->save();

        return [
             'account' => 'updated'
        ];
    }
    public function destroy(User $user,Request $request)
    {

        $id=User::where('id',$request->id)->value('state');
        if($id==0){
          $user->where('id',$request->id)->update(['state'=>1]);
          return 'success';
        }else $user->where('id',$request->id)->update(['state'=>0]);
        return 'success';
    }
    


    

}   