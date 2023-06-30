<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\taggersC;
use App\Http\Controllers\tcrequests;

use App\Http\Controllers\mods;
use App\Http\Controllers\follwersC;



use App\Http\Controllers\tcs;

use App\Http\Controllers\ads;

use App\Http\Controllers\coursec;

use App\Http\Controllers\UserController;







Route::group(['middleware' => 'auth:sanctum'], function () {
        // تحديث بيانات المستخدم
    Route::post('/user/update', 'App\Http\Controllers\UserController@update');
    //  يطلب بيانات المستخدم APP /     TOKEN ارسال
    Route::post('/user', function (Request $request) {
        return $request->user();
    });
    //LOGOUT
    Route::delete('/auth/logout', [\App\Http\Controllers\Auth\TokenController::class, 'destroy']);
});



//LOGIN
Route::post('/auth/token', [\App\Http\Controllers\Auth\TokenController::class, 'store']);
// أنشاء مستخدم جديد
Route::post('/register', 'App\Http\Controllers\UserController@register'); 


//moderators
Route::post('/d/modLogIn', [mods::class, 'store']);
Route::post('/d/modSignIn', [mods::class, 'create']); 
Route::post('/d/try', [mods::class, 'show']); 





//Route::delete('/auth/token/logout', [\App\Http\Controllers\Auth\TokenController::class, 'destroy']);


//  TABLES جلب بيانات من 
Route::post('/trainers', [App\trainer::class, 'trainer']);
Route::get('/tags','App\Http\Controllers\taggersC@appindex');
Route::get('/map', [App\trainingcenter::class, 'maps']);


//Route::post('/regeister', [\App\Http\Controllers\Controller::class, 'register']);
//Route::post('/trainers/new', [\App\Trainer::class, 'insertTrainer'] ); 


//search
Route::post('/Search', [App\trainingcenter::class, 'search']);
//TRAINING CENTER CONTROLLERS
//home page
Route::get('/TrainingCenters', [App\trainingcenter::class, 'trainingcenter']);
//main page info
Route::post('/TrainingCenterInfo', [App\trainingcenter::class, 'showtc']);



Route::post('/tc/add', [App\trainingcenter::class, 'add']);
Route::post('/tc/update', [App\trainingcenter::class, 'updater']);
//branchs
Route::post('/tc/addB', [App\trainingcenter::class, 'addB']);
Route::post('/tc/updateB', [App\trainingcenter::class, 'updaterB']);


//notification panal
Route::post('/tc/noti', [App\trainingcenter::class, 'noti']);

//update a new rate
Route::post('/tc/rate', [App\trainingcenter::class, 'rate']);
Route::post('/tc/updateRate', [App\trainingcenter::class, 'updateRate']);
Route::post('/tc/deleteRate', [App\trainingcenter::class, 'deleteRate']);

Route::post('/tc/mycourses', [App\trainingcenter::class, 'mycourses']);
Route::post('/tc/mytc', [App\trainingcenter::class, 'mytc']);
Route::post('/tc/mytc/info', [App\trainingcenter::class, 'mytcinfo']);



//COURSES CONTROLLER 
//done
Route::get('/Courses/NewCourses', [App\Course::class, 'Course']);
Route::get('/Courses/popularCourses', [App\Course::class, 'popular']);
Route::post('/CourseInfo', [App\Course::class, 'showc']);
Route::post('/course/add', [App\Course::class, 'add']);
//not done
Route::delete('/course/delete', [App\Course::class, 'delete']);


//ads for app
Route::get('/ads', [ads::class, 'dashads']);
Route::get('/latestads', [ads::class, 'lasteightads']);


//followers
Route::post('/myfav', [follwersC::class, 'index']);
Route::post('/follow', [follwersC::class, 'create']);
Route::post('/unfollow', [follwersC::class, 'destroy']);











//DASHBOARD API


//REQUESTS

Route::get('/d/requests', [tcrequests::class, 'index']);
Route::post('/d/requests/add', [tcrequests::class, 'create']);
Route::post('/d/requests/update', [tcrequests::class, 'update']);


//course 
Route::get('/d/courses', [coursec::class, 'index']);
Route::post('/d/courses/state', [coursec::class, 'destroy']);



//training center
Route::get('/d/tc', [tcs::class, 'index']);
Route::post('/d/tc/state', [tcs::class, 'destroy']);


//mods
Route::get('/d/mods', [mods::class, 'index']);
Route::post('/d/mods/add', [mods::class, 'create']);
Route::post('/d/mods/update', [mods::class, 'update']);
Route::post('/d/mods/state', [mods::class, 'destroy']);

//ads
Route::get('/d/ads', [ads::class, 'index']);
Route::post('/d/ads/add', [ads::class, 'store']);
Route::post('/d/ads/update', [ads::class, 'update']);
Route::post('/d/ads/state', [ads::class, 'destroy']);
Route::post('/d/ads/delete', [ads::class, 'edit']);


//tags
Route::get('/d/tags', [taggersC::class, 'index']);
Route::post('/d/tags/add', [taggersC::class, 'store']);
Route::post('/d/tags/update', [taggersC::class, 'update']);
Route::post('/d/tags/state', [taggersC::class, 'destroy']);


//counter
Route::get('/total/tc', [mods::class, 'tcTotal']);
Route::get('/total/users', [mods::class, 'uTotal']);
Route::get('/total/courses', [mods::class,'cTotal']);

//users
Route::get('/d/users', [UserController::class, 'index']);;
Route::post('/d/users/state', [USerController::class, 'destroy']);


