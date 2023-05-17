<?php
require_once("../Database.php");
$id = $_GET['id'];
$valores = [$_POST['nombre'], $_POST['era'], $_POST['pagina_id'], $_POST['familias_id'], $_POST['zonas_id'], $_POST['imagen']];
$sql = "UPDATE dinosaurios SET nombre = '$valores[0]', era = '$valores[1]' ,pagina_id=$valores[2],familias_id=$valores[3]  ,zonas_id=$valores[4] ,imagen='$valores[5] ' WHERE id = $id;";
$db = new Database();
echo $sql;
$db->modificacion($sql);
header('Location: index.php ');
