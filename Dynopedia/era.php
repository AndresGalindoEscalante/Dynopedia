<?php
// 1. Reanudo sesion
session_start();
if (isset($_SESSION['pepito'])) {
    // 2. Comprobar si tengo o no permisos (rol_id) para estar aqui
    if ($_SESSION['pepito']['rol'] == 1) {
        // Correcto compañeros
    } else if ($_SESSION['pepito']['rol'] == 2) {
        // header('Location: ../index.php');
    }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url(style.css);
    </style>
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
</head>

<body>
    <header>
    <div class="cabecera">
            <img src="img/logo.png" id="logo">
            <ul class="listaNav">
                <li>
                    <a href="#" class="nav-link" id="dropdownMenuLink">
                        <?php
                        if (isset($_SESSION['pepito'])) {
                            echo "<i class='fas fa-user-astronaut';'></i>";
                            echo "  ";
                            echo $_SESSION['pepito']['nombre'];
                        } ?>

                    </a>
                </li>
                <li>
                    <?php
                    if (isset($_SESSION['pepito'])) {
                        echo "<a href='index.php' class='nav-link'>";
                        echo "<i class='fas fa-home'></i>";
                        echo "  ";
                        echo "Inicio";
                        echo "</a>";
                    } ?>
                </li>
                <li>
                    <?php
                    if (!isset($_SESSION['pepito'])) {
                        echo "<a href='formulario.php' class='nav-link'><i class='fas fa-sign-in-alt'></i> Iniciar Sesión</a>";
                    } else if ($_SESSION['pepito']['rol'] == 2) {
                        echo "<a href='admin.html' class='nav-link'>";
                        echo "<i class='fas fa-user-cog';'></i>";
                        echo "  ";
                        echo "Administracion";
                        echo "</a>";
                    }

                    ?>

                </li>
            </ul>
        </div>
    </header>
    <nav>
    </nav>
    <h1>
        <p>La Dynopedia</p>
    </h1>
    <aside>
        <ul>
            <li><a href="clasificacion.php">Clasificación</a>
                <ul>
                    <a href="clasificacion.php#linkSaurisquios">
                        <li> Saurisquios</li>
                    </a>
                    <a href="clasificacion.php#linkOrnitrisquios">
                        <li>Ornitrisquios</li>
                    </a>
                </ul>
            </li>

            <li>Era
                <ul>
                    <a href="era.php#cretacico">
                        <li>Cretácico</li>
                    </a>
                    <a href="era.php#jurasico">
                        <li>Jurásico</li>
                    </a>
                    <a href="era.php#triasico">
                        <li>Triásico</li>
                    </a>
                </ul>
            </li>
            <li>Naturaleza
                <ul>
                    <a href="naturaleza.php#habita">
                        <li>Habitas</li>
                    </a>
                    <a href="naturaleza.php#alimentacion">
                        <li>Alimentación</li>
                    </a>
                    <a href="naturaleza.php#crecimiento">
                        <li>Crecimiento y esperenza de vida</li>
                    </a>
                </ul>
            </li>
            <a href="tierlist.php">
                <li>Tier list</li>
            </a>
            <a href="recetas.php#receta">
                <li>Recetas </li>
            </a>
            <a href="dinosaurios.php">
                <li>Dinosaurios</li>
            </a>

        </ul>
    </aside>
    <h2 id="cretacico">Cretácico</h2><br>
    <h2 id="jurasico">Jurásico</h2><br>
    <h2 id="triasico">Triásico</h2>
</body>

</html>