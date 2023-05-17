<?php
require_once("../Database.php");
$id = $_GET['id'];
$db = new Database();
$admin = $db->getElementById("administrador", $id);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url(../FormularioStyle.css);
        /* Importar El fontawesome para la flecha de backeo */
    </style>
</head>

<body>
    <h1>Actualizar Administrador</h1>
    <form method="POST" action="Update.php?id=<?php echo $id?>">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre" value="<?php echo $admin['nombre'] ?>"><br>

        <label for="apellido">Apellido:</label>
        <input type="text" name="apellido" value="<?php echo $admin['apellido'] ?>"><br>

        <label for="correo">Correo:</label>
        <input type="text" name="correo" value="<?php echo $admin['correo'] ?>"><br>

        <label for="contrasena">Contraseña:</label>
        <input type="text" name="contrasena" value="<?php echo $admin['contraseña'] ?>"><br>

        <div class="enlace">
            <i class="fas fa-arrow-left" onclick="history.back()"></i>
        </div>

        <input type="submit" value="Actualizar">
    </form>
</body>

</html>