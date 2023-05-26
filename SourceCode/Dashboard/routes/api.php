<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;



Route::group(['middleware' => 'auth:sanctum'], function () {
        // تحديث بيانات المستخدم
    Route::post('/user/update', 'App\Http\Controllers\UserController@update');
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
Route::get('/trainers', [App\trainer::class, 'trainer']);
Route::get('/tags',[App\tag::class, 'tag']);


//Route::post('/regeister', [\App\Http\Controllers\Controller::class, 'register']);
//Route::post('/trainers/new', [\App\Trainer::class, 'insertTrainer'] ); 


//TRAINING CENTER CONTROLLERS
//home page
Route::get('/tc', [App\trainingcenter::class, 'trainingcenter']);
Route::post('/search', [App\trainingcenter::class, 'search']);


Route::post('/tc/add', [App\trainingcenter::class, 'add']);
Route::post('/tc/update', [App\trainingcenter::class, 'updater']);
//notification panal
Route::post('/tc/noti', [App\trainingcenter::class, 'noti']);
//المراكز التريبية اللتي تم إضافتها مؤخراً
Route::post('/tc/pending', [App\trainingcenter::class, 'pending']);
//update a new rate
Route::post('/tc/rate', [App\trainingcenter::class, 'rate']);








//COURSES CONTROLLER
Route::get('/course', [App\Course::class, 'Course']);
Route::post('/course/add', [App\Course::class, 'add']);
Route::delete('/course/delete', [App\Course::class, 'delete']);


