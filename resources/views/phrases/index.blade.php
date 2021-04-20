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
<p>Nuevo registro: <a href="{{ route('phrases.create') }}">ALTA</a></p>
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
    <th>Id</th>
    <th>Texto</th>
    <th>Otros</th>
  </tr>
  @foreach ($frases as $una)
   <tr>
     <td> {{ $una['id'] }} </td>
     <td> {{ $una['text'] }} </td>
     <td> {{ $una['cat'] }}&nbsp;&nbsp;&nbsp;<small><a href="{{ url('frasesdeuno',$una['aut_id']) }}">{{$una['aut']}}</a></small> </td>
   </tr>
  @endforeach
</table>
</body>
</html>
