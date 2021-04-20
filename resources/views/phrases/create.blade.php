<!DOCTYPE html>
<html>
<head>
	<title>Introducción formularios web</title>
	<meta charset="utf-8"/>
	<meta name="description" content="Un formulario sirve para enviar datos a otra página que los recoge para usarlos o almacenarlos."/>

	<style>
         *{box-sizing:border-box;}

form{
	width:300px;
	padding:16px;
	border-radius:10px;
	margin:auto;
	background-color:#ccc;
}

form label{
	width:72px;
	font-weight:bold;
	display:inline-block;
}

form input[type="text"],
form input[type="email"]{
	width:180px;
	padding:3px 10px;
	border:1px solid #f6f6f6;
	border-radius:3px;
	background-color:#f6f6f6;
	margin:8px 0;
	display:inline-block;
}

form input[type="submit"]{
	width:100%;
	padding:8px 16px;
	margin-top:32px;
	border:1px solid #000;
	border-radius:5px;
	display:block;
	color:#fff;
	background-color:#000;
} 

form input[type="submit"]:hover{
	cursor:pointer;
}

textarea{
	width:100%;
	height:100px;
	border:1px solid #f6f6f6;
	border-radius:3px;
	background-color:#f6f6f6;			
	margin:8px 0;
	/*resize: vertical | horizontal | none | both*/
	resize:none;
	display:block;
}


	</style>

</head>
<body>

<form action="{{ route('phrases.store') }}" target="" method="post" name="formDatosFrase">
        @csrf
	<label for="author_id">ID Autor de la frase</label>
	<input type="text" name="author_id" id="author_id" placeholder="id del author" required />

	<label for="category_id">ID Categoría de la frase</label>
	<input type="text" name="category_id" id="category_id" placeholder="id de la categoría" required/>

	<label for="frase">La Frase</label>
	<textarea name="text" for="frase" placeholder="texto de la nueva frase" maxlength="300"></textarea>
	
	<input type="submit" name="enviar" value="enviar datos"/>
</form>

</body>
</html>
