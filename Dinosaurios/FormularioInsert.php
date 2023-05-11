<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $nombre = $_POST['nombre'];
    $era = $_POST['era'];
    $pagina_id = $_POST['pagina_id'];
    $familias_id = $_POST['familias_id'];
    $zonas_id = $_POST['zonas_id'];

    $insert = new Insert();
    $resultado = $insert->insertar($nombre, $era, $pagina_id, $familias_id, $zonas_id);
    echo $resultado;
}
?>

<html>
<head>
    <title>Insertar dinosaurio</title>
    <style>
        @import url(../FormularioStyle.css);
    </style>
</head>
<body>
    <h1>Insertar dinosaurio</h1>
    <form method="POST" action="">
        <label for="nombre">Nombre:</label>
        <input type="text" name="nombre"><br>

        <label for="era">Era:</label>
        <input type="text" name="era"><br>

        <label for="pagina_id">ID de página:</label>
        <input type="text" name="pagina_id"><br>

        <label for="familias_id">ID de familia:</label>
        <input type="text" name="familias_id"><br>

        <label for="zonas_id">ID de zona:</label>
        <input type="text" name="zonas_id"><br>

        <input type="submit" value="Insertar">
    </form>
</body>
</html>