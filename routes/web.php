<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthorController;
use App\Http\Controllers\PhraseController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/ppp',[AuthorController::class,'lolo']);
Route::get('/uuu',[AuthorController::class,'frasesdeuno']);

Route::get('/', function () {
    return view('welcome');
});
Route::get('/frasesdeuno/{id}',[AuthorController::class,'frasesdeuno']);
Route::get('/frases/{id}',[AuthorController::class,'popo']);
Route::resource('authors', AuthorController::class);
Route::resource('phrases', PhraseController::class);
Route::resource('categories', CategoryController::class);


