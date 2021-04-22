<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
	use HasFactory;
	protected $table = 'categories';
	protected $fillable = [
		'descri'
	];

	public function phrases() {
           return $this->hasMany(Phrase::class);
    }
    
    public function authors() {
          return $this->belongsToMany(Author::class,'phrases');
    }
}
