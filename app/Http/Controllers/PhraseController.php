<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Author;
use App\Models\Phrase;
use App\Models\Category;

class PhraseController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
	$ar = Phrase::all();
        $F = [];
	foreach($ar as $una) {
		$A = [];
		$A['cat'] = Category::find($una->category_id)->descri;
		$A['aut'] = Author::find($una->author_id)->name;
		$A['aut_id'] = $una->author_id;
		$A['text'] = $una->text;
		$A['id'] = $una->id;
		$F[] = $A;
        }
        return view('phrases.index', ['frases' => $F]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        return view('phrases.create',);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $request->validate([ 'text' => 'required', 'author_id' => 'required', 'category_id' => 'required' ]);

        Phrase::create($request->all());

        return redirect()->route('phrases.index')
            ->with('success', 'Phrase creada con éxito.');

    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
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
