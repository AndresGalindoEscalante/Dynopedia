<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $nivel = $_POST['nivel'];

    $insert = new Insert();
    $resultado = $insert->insertar($nombre, $nivel);
    echo $resultado;
    header('Location: index.php');
}
?>

<html>

<head>
    <title>Insertar Administrador</title>
    <style>
        @import url(../FormularioStyle.css);
        /* Importar El fontawesome para la flecha de backeo */
    </style>
</head>

<body>
    <h1>Insertar Administrador</h1>
    <form method="POST" action="">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre"><br>

        <label for="era">Nivel:</label>
        <input type="text" name="nivel"><br>

        <div class="enlace">
            <i class="fas fa-arrow-left" onclick="history.back()"></i>
        </div>

        <input type="submit" value="Insertar">
    </form>
</body>

</html>