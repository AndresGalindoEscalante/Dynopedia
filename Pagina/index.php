<?php
require_once('../Database.php');
$db = new Database;
$result = $db->getAll("pagina");
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
      <th>Fecha_creacion</th>
      <th>Tipo</th>
      <th>Administrador_id</th>
    </tr>
    <?php
    while ($row = $result->fetch()) {
      echo "<tr>";
      echo "<td>" . $row["id"] . "</td>";
      echo "<td>" . $row["fecha_creacion"] . "</td>";
      echo "<td>" . $row["tipo"] . "</td>";
      echo "<td>" . $row["administrador_id"] . "</td>";
      echo "<td>";
      echo " <a href='../Delete.php?id=" . $row["id"] . "&pagina=Pagina/index.php&tabla=pagina'><button class'borrar'>Borrar</button></a>";
      echo "</td>";
      echo "</tr>";
    }
    ?>
    <tr>
      <td colspan=7>
        <a href='FormularioInsert.php'><button class='insertar'>Insertar</button></a>
      </td>
    </tr>

  </table>
</body>

</html>