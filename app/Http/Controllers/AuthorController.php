<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;
use App\Models\Phrase;
use App\Models\Category;

class AuthorController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	    $ar = Author::all();
	    $textos = array();
	    foreach($ar as $autor) {
		    $frases = Phrase::all()->where('author_id','=',$autor->id);
	       //
		    $aa = [];
		    foreach($frases as $una) {
			$id = $una->category_id;
			$descri = Category::find($id)->descri;
			$aa[] = array('text' => $una->text, 'cat' => $descri, 'id' => $id);
		    }
		    $textos[$autor->id] = $aa;
               //	

               /*
                    $t = "";
		    foreach($frases as $una) {
		    $descri = Category::find($una->category_id)->descri;
		    // Category::find(Phrase::where(['author_id' => 4])->first()->category_id)->descri;
		  //  <a href="{{ route('authors.show', $uno->id) }}">mostrar</a>
	            $t .= "<br>". $una->text . "   <small>(" . $descri . ")</small></br>";
		    }
		    $textos[$autor->id] = $t;   */
	    }
            return view('authors.index', ['todos' => $ar, 'frases' => $textos]);
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
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function popo($id) {
	    $tit = Category::find($id)->descri;
	    $frases = Phrase::where(["category_id" => $id])->get();
            $mostrar = "<h2>Frases categoría: $tit</h2>";
	    foreach($frases as $unafrase) {
		    $mostrar .= "<p> $unafrase->text </p>";
	    }
	    return $mostrar;

    }
    public function show($id) {
	    //
    }
    public function frasesdeuno($id)
    {
	$aut = Author::find($id);
	if($aut === null) {
		return view('authors.unoNoExiste', ['id' => $id]);
	}
	$frases = Author::find($id)->phrases()->get();
	if(count($frases) == 0) {
		return view('authors.noTieneFrases', ['id' => $id]);
	}
  
	/*
	$aut = Author::find($id);
        if($aut === null) {
		return view('unoNoExiste', ['id' => $id]);
	}
	$frases = Phrase::all()->where('author_id','=',$aut->id);
        if($frases === null) {
          return view('unoNoExiste', ['id' => $id]);
        }
	*/
	return view('authors.frasesDeUno', ['frases' => $frases, 'aut' => $aut->name]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
