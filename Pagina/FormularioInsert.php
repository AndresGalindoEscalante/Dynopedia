<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $fechaCreacion = $_POST['fechaCreacion'];
    $tipo = $_POST['tipo'];
    $administrador_id = $_POST['administrador_id'];


    $insert = new Insert();
    $resultado = $insert->insertar($fechaCreacion, $tipo, $administrador_id);
    echo $resultado;
    header('Location: index.php');
}
?>

<html>

<head>
    <title>Insertar Pagina</title>
    <style>
        @import url(../FormularioStyle.css);
        /* Importar El fontawesome para la flecha de backeo */
    </style>
</head>

<body>
    <h1>Insertar Pagina</h1>
    <form method="POST" action="">
        <label for="fechaCreacion">Fecha de Creacion:</label>
        <input type="text" name="fechaCreacion"><br>

        <label for="tipo">Tipo:</label>
        <input type="text" name="tipo"><br>

        <label for="administrador_id">Administrador ID:</label>
        <input type="text" name="administrador_id"><br>

        <div class="enlace">
            <i class="fas fa-arrow-left" onclick="history.back()"></i>
        </div>

        <input type="submit" value="Insertar">
    </form>
</body>

</html>