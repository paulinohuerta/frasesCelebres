<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Phrase extends Model
{
	use HasFactory;
	protected $table = 'phrases';
        protected $fillable = [
                'text',
                'category_id',
                'author_id'
	];

        public function author() {
           return $this->belongsTo(Author::class);
	}

        public function category() {
           return $this->belongsTo(Category::class);
        }
}
