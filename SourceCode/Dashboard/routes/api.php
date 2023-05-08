<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::group(['middleware' => 'auth:sanctum'], function () {


    Route::post('/update', 'App\Http\Controllers\UserController@update');

    //  يطلب بيانات المستخدم APP /     TOKEN ارسال
    Route::get('/user', function (Request $request) {
        return $request->user();


  
    });




    //LOGOUT
    Route::delete('/auth/token/logout', [\App\Http\Controllers\Auth\TokenController::class, 'destroy']);
});

//LOGIN
Route::post('/auth/token', [\App\Http\Controllers\Auth\TokenController::class, 'store']);

// أنشاء مستخدم جديد
Route::post('/register', 'App\Http\Controllers\UserController@register'); 





//Route::delete('/auth/token/logout', [\App\Http\Controllers\Auth\TokenController::class, 'destroy']);


//  TABLES جلب بيانات من 
Route::get('/course', [App\Course::class, 'Course']);
Route::get('/tc', [App\trainingcenter::class, 'trainingcenter']);
Route::get('/trainers', [App\trainer::class, 'trainer']);
Route::get('/tags',[App\tag::class, 'tag']);


//Route::post('/regeister', [\App\Http\Controllers\Controller::class, 'register']);
