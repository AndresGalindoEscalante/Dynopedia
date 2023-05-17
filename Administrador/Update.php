<?php
    require_once("../Database.php");
    $id=$_GET ['id'];
    $valores = [$_POST['nombre'] , $_POST['nivel']];
    $sql = "UPDATE administrador SET nombre = '$valores[0]', nivel = $valores[1] WHERE id = $id;";
    $db =new Database();
    $db->modificacion($sql);
    header('Location: index.php ');
?>