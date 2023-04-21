<?php
    require_once('../Database.php');
    require_once('../Delete.php');
    $db = new Database;
    $delete = new Delete();
    $result = $db->getAll("dinosaurios_pagina");
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>

    <?php
    while($row = $result->fetch()){

        echo "<div>";
        echo "<h3> Nombre: " . $row["nombre"] . "</h3>";
        echo "<p> Era: " . $row["era"] . "</p>";
        echo "<p> Familia" . $row["familia"] . "</p>";
        echo "<p> Region" . $row["region"] . "</p>";
        echo "</div>";

    }
    ?>
</body>
</html>