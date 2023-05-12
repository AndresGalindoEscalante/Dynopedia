<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $apellido = $_POST['apellido'];
    $correo = $_POST['correo'];
    $contrasena = $_POST['contrasena'];
    $administrador_id = $_POST['administrador_id'];

    $insert = new Insert();
    $resultado = $insert->insertar($nombre, $apellido, $correo, $contrasena, $administrador_id);
    echo $resultado;
    header('Location: index.php');
}
?>

<html>

<head>
    <title>Insertar Usuario has Editor</title>
    <style>
    @import url(../FormularioStyle.css);
    /* Importar El fontawesome para la flecha de backeo */
    </style>
</head>

<body>
    <h1>Insertar Usuario has Editor</h1>
    <form method="POST" action="">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre"><br>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido"><br>

        <label for="correo">Correo:</label>
        <input type="text" name="correo"><br>

        <label for="contrasena">Contraseña:</label>
        <input type="text" name="contrasena"><br>

        <label for="administrador_id">ID del Administrador:</label>
        <input type="text" name="administrador_id"><br>

        <div class="enlace">
            <i class="fas fa-arrow-left" onclick="history.back()"></i>
        </div>

        <input type="submit" value="Insertar">
    </form>
</body>

</html>