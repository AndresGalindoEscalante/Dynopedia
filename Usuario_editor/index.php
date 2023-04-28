<?php
require_once('../Database.php');
$db = new Database;
$result = $db->getAll("usuario_editor");
?>


<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <style>
    @import url(../style.css);
    @import url(../indice.css);
  </style>
</head>

<body>
<aside>
        <ul>
          <a href="../index.php">
            <li>Índice</li>
          </a>
        </ul>
  </aside>
  <table>
    <tr>
      <th>Id</th>
      <th>Nombre</th>
      <th>Apellido</th>
      <th>Correo</th>
      <th>Contraseña</th>
      <th>Administrador _id</th>
    </tr>
    <?php
    while ($row = $result->fetch()) {
      echo "<tr>";
      echo "<td>" . $row["id"] . "</td>";
      echo "<td>" . $row["nombre"] . "</td>";
      echo "<td>" . $row["apellido"] . "</td>";
      echo "<td>" . $row["correo"] . "</td>";
      echo "<td>" . $row["contrasena"] . "</td>";
      echo "<td>" . $row["administrador_id"] . "</td>";
      echo "<td>";
      echo " <a href='create.php'><button class'insertar'>Insertar</button></a>";
      echo " <a href='../Delete.php?id=".$row["id"]."&pagina=Usuario_editor/index.php&tabla=usuario_editor'><button class='borrar'>Borrar</button></a>";
      echo "</td>";
      echo "</tr>";
    }
    ?>
  </table>
  
</body>

</html>