<?php
require_once('../Database.php');
$db = new Database;
$result = $db->getAll("zonas");



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
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
      <th>Clima</th>
      <th>Region</th>
    </tr>
    <?php
    while ($row = $result->fetch()) {
      echo "<tr>";
      echo "<td>" . $row["id"] . "</td>";
      echo "<td>" . $row["clima"] . "</td>";
      echo "<td>" . $row["region"] . "</td>";
      echo "<td>";
      echo " <a href='../Delete.php?id=" . $row["id"] . "&pagina=Zonas/index.php&tabla=zonas'><button>Borrar</button></a>";
      echo "</td>";
      echo "</tr>";
    }
    ?>
  </table>
</body>

</html>