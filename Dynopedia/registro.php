<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST["nombre"];
    $apellido = $_POST["apellido"];
    $email = $_POST["email"];
    $contrasena = $_POST["contrasena"];

    $insert = new Insert();
    $insert->insertar($nombre, $apellido, $email, $contrasena);
    header('Location: formulario.php');
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" type="image/jpg" href="img/icono.ico" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro</title>
    <link rel="stylesheet" href="formulariostyle.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
</head>

<body>
    <header>
        <div class="cabecera">
            <img src="img/logo.png" id="logo">
            <ul class="listaNav">
                <a href="index.html">
                    <li>Inicio</li>
                </a>
                <a href="formulario.html">
                    <li>Iniciar Sesión</li>
                </a>
            </ul>
        </div>
    </header>

    <main>
        <form id="registro" method="POST">

            <!-- Apartado del nombre -->
            <label for="name">Nombre</label><br>
            <input type="name" name="nombre" id="nombre" placeholder="Nombre"><br>
            <h5 id="mensajeNom"></h5>

            <!-- Apartado del apellido -->
            <label for="apellido">Apellido</label>
            <input type="apellido" name="apellido" id="apellido" placeholder="Apellido"><br>
            <h5 id="mensajeAp"></h5>

            <!-- Apartado del email -->
            <label for="email">Email</label><br>
            <input type="email" name="email" id="email" placeholder="email" required><br>
            <h5 id="mensajeEm"></h5>

            <!-- Apartado de la contraseña -->
            <label for="asunto">Contraseña</label><br>
            <input type="password" name="contrasena" id="password" placeholder="Contraseña"><br>
            <h5 id="mensajePas"></h5>

            <!-- Apartado de la confirmacion de la contraseña -->
            <label for="asunto">Confirmar contraseña</label><br>
            <input type="password" name="password2" id="passwordConfirm" placeholder="Confirmar contraseña"><br>
            <h5 id="mensajePasC"></h5>

            <!-- Boton de enviar los datos -->
            <button type="submit" class="enviar">Enviar</button>

            <!-- Icono de flecha para atras -->
            <div class="enlace">
                <i class="fas fa-arrow-left" onclick="history.back()"></i>
            </div>


        </form>
    </main>
</body>
<script src="app.js"></script>

</html>