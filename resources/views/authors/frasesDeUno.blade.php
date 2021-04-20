<html>
<body>
<h2>Frases de {{ $aut }}
@foreach($frases as $una)
     <p><i>Texto: </i> {{ $una->text }}</p>
@endforeach
</body>
<html>
