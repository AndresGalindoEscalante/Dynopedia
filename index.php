<?php

// 1. Reanudo sesion
session_start();

if(isset($_SESSION['pepito'])){
  // 2. Comprobar si tengo o no permisos (rol_id) para estar aqui
  if($_SESSION['pepito']['rol'] == 2){
    // Correcto compañeros
  }else if($_SESSION['pepito']['rol'] == 1){
    header('Location: Dynopedia/index.html');
  }
  // }else{
  //   header('Location: ../auth/login.php');
  // }
}
else{
  header('Location: Dynopedia/formulario.php');
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
    @import url(indice.css);
  </style>
</head>

<body>
  <h1><a href="Dynopedia/admin.html">Volver a la página web</a></h1>

  <aside>
    <h3>Índice</h3>

    <ul>
      <a href="Dinosaurios/index.php">
        <li>Dinosaurios</li>
      </a>
    </ul>

    <ul>
      <a href="Familias/index.php">
        <li>Familias</li>
      </a>
    </ul>

    <ul>
      <a href="Usuario/index.php">
        <li>Usuario</li>
      </a>
    </ul>

    <ul>
      <a href="Zonas/index.php">
        <li>Zonas</li>
      </a>
    </ul>
  </aside>
</body>

</html>