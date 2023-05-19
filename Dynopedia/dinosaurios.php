<?php
require_once('../Database.php');
$db = new Database;
$result = $db->getAll("dinosaurios_pagina");
?>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import "style.css";
        @import "tierlist.css";
        aside {
            height: 300px;
        }

        main {
            gap: 5vw;
            flex-wrap: wrap;
        }

        img {
            height: 20vh;
            width: 20vw;
        }
    </style>
</head>

<body>
    <header>
        <div class="cabecera">
            <img src="img/logo.png" id="logo">
            <ul class="listaNav">
                <a href="index.html">
                    <li>Inicio</li>
                </a>
                <a href="formulario.php">
                    <li>Iniciar Sesión</li>
                </a>
                <a href="admin.html">
                    <li>Administración</li>
                </a>
            </ul>
        </div>
    </header>
    <aside>
        <ul>
            <li><a href="dinosaurio.html">Clasificación</a>
                <ul>
                    <a href="dinosaurio.html#linkSaurisquios">
                        <li> Saurisquios</li>
                    </a>
                    <a href="dinosaurio.html#linkOrnitrisquios">
                        <li>Ornitrisquios</li>
                    </a>
                </ul>
            </li>

            <li>Era
                <ul>
                    <a href="era.html#cretacico">
                        <li>Cretácico</li>
                    </a>
                    <a href="era.html#jurasico">
                        <li>Jurásico</li>
                    </a>
                    <a href="era.html#triasico">
                        <li>Triásico</li>
                    </a>
                </ul>
            </li>
            <li>Naturaleza
                <ul>
                    <a href="naturaleza.html#habita">
                        <li>Habitas</li>
                    </a>
                    <a href="naturaleza.html#alimentacion">
                        <li>Alimentación</li>
                    </a>
                    <a href="naturaleza.html#crecimiento">
                        <li>Crecimiento y esperenza de vida</li>
                    </a>
                </ul>
            </li>
            <a href="tierlist.html">
                <li>Tier list</li>
            </a>
            <a href="recetas.html#receta">
                <li>Recetas </li>
            </a>
            <a href="dinosaurios.php">
                <li>Dinosaurios</li>
            </a>
        </ul>
    </aside>
    <main class="contenido">
        <?php
        while ($row = $result->fetch()) {

            echo "<div>";
            echo "<img src='img/" . $row["imagen"] . "'></img>";
            echo "<h3> Nombre: " . $row["nombre"] . "</h3>";
            echo "<p> Era: " . $row["era"] . "</p>";
            echo "<p> Familia: " . $row["familia"] . "</p>";
            echo "<p> Region: " . $row["region"] . "</p>";
            echo "</div>";
        }
        ?>
    </main>
</body>

</html>