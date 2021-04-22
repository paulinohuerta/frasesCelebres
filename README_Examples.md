> Phrases belonging to the category "perseverancia".

```php
$colec = Phrase::where('category_id',(Category::where('descri','perseverancia')->first()->id))->get()

foreach($colec as $one){
  echo $one->text,"\n\n";
}
```
Output:

    Estoy convencido de que la mitad de lo que separa a los emprendedores exitosos de los que no triunfan es la perseverancia

    La marca esencial que distingue a un hombre digno de llamarse así, es la perseverancia en las situaciones adversas y dificiles

    A veces hay que retroceder dos pasos para avanzar uno


> Author IDs associated with the various phrase categories.

```php
$ArCateg = Category::all()
foreach($ArCateg as $unaCateg){
  foreach(Phrase::where('category_id',$unaCateg->id)->get() as $unaFrase){
    echo '**',$unaCateg->descri,'(',$unaCateg->id,')','**',$unaFrase->author_id,"\n";
  }
  echo "\n\n";
}
```
Output:

    **muerte(1)**2
    **muerte(1)**3
    **muerte(1)**1


    **entusiasmo(2)**3
    **entusiasmo(2)**6
    **entusiasmo(2)**1


    **imaginación(3)**1
    **imaginación(3)**5
    **imaginación(3)**2
    
    ...
    ...
    
> Another way to achieve the same, using the "authors" dynamic relationship property; keep in mind that we have defined the "authors" method on our Author model.
```php
$ArCateg = Category::all()
foreach($ArCateg as $cat) {
  echo $cat->descri,"\n";
  foreach($cat->authors as $aut) {
    echo '(',$aut->id,')',$aut->name,"\n";
  }
  echo "\n";
}
```
> Categories of phrases associated with the author of id =  4.

```php
foreach(Author::find(4)->categorias->groupBy('id') as $k => $v) {
   echo '(',$k,')',Category::find($k)->descri,"\n";
} 
```
Output:

    (4)destino
    (6)perseverancia
    (9)bondad

> Categories of phrases associated with each author
```php
$AllAuthors = Author::all();
foreach($AllAuthors as $a) {
  echo '\\\\\\', $a->name, '////',"\n";
  foreach($a->categorias->groupBy('id') as $k => $v) {
    echo '(',$k,')',Category::find($k)->descri,"\n";
  }
  echo "\n\n";
}
```

> Authors associated with a specific category, we take the category of id = 4.

```php
foreach(Phrase::where('category_id',4)->get() as $p) {
  echo $p->author()->get()->first()->name,"\n";
}
```
Output:

    Albert Einstein
    Albert Einstein
    Napoleón Bonaparte
    Ludwig van Beethoven
    Ludwig van Beethoven

> The same, using the "authors" method of the Author Model, we add groupBy to obtain the different values.

```php
foreach(Category::find(4)->authors->groupBy('id') as $k => $v) {
   echo Author::find($k)->name,"\n";
}
```
Output:

    Albert Einstein
    Ludwig van Beethoven
    Napoleón Bonaparte
