<!DOCTYPE html>
<html>
<head>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
small {
    font-size: .7em
}      
</style>
</head>
<body>
<!--table, th, td {
  border: 1px solid black;
}
</style>
</head>
-->
<body>
<p>Nuevo registro: <a href="{{ route('authors.create') }}">ALTA</a></p>
@if ($message = Session::get('success'))
<!--        <div class="alert alert-success">
            <p></p>
        </div> 
  <p>Creado nuevo registro con éxito</p>
-->
  <p> {{ $message }}</p>
@endif
<table style="width:100%">
  <tr>
    <th>Nombre</th>
    <th>Fecha nacimiento</th>
    <th>Frases</th>
    <th>Acciones</th>
  </tr>
  @foreach ($todos as $uno)
   <tr>
     <td> {{ $uno->name }} </td>
     <td> {{ $uno->fnac }} </td>
       <td>
        @foreach ($frases[$uno->id] as $f)
	 <p>{{ $f['text'] }}&nbsp;&nbsp;&nbsp;<small><a href="{{ url('frases',$f['id']) }}">({{ $f['cat'] }})</a></small></p>
	@endforeach
       </td>
     <td>
       <form action="{{ route('authors.destroy', $uno->id) }}" method="POST">
            <a href="{{ route('authors.show', $uno->id) }}">mostrar</a>
            <a href="{{ route('authors.edit', $uno->id) }}">editar</a>
            @csrf
            @method('DELETE')
            <button type="submit" title="delete">eliminar</button>
       </form>
     </td>
   </tr>
  @endforeach
</table>
</body>
<html>

