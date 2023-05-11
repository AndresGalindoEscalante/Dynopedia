<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];

    $insert = new Insert();
    $resultado = $insert->insertar($nombre);
    echo $resultado;
}
?>

<html>
<head>
    <title>Insertar Familia</title>
    <style>
        @import url(../FormularioStyle.css);
    </style>
</head>
<body>
    <h1>Insertar Familia</h1>
    <form method="POST" action="">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre"><br>

        <input type="submit" value="Insertar">
    </form>
</body>
</html>