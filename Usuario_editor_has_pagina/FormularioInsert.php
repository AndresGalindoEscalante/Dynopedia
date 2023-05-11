<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario_editor_id = $_POST['usuario_editor_id'];
    $pagina_id = $_POST['pagina_id'];

    $insert = new Insert();
    $resultado = $insert->insertar($usuario_editor_id, $pagina_id);
    echo $resultado;
}
?>

<html>
<head>
    <title>Insertar Usuario Editor has Pagina</title>
    <style>
        @import url(../FormularioStyle.css);
    </style>
</head>
<body>
    <h1>Insertar Usuario Editor has Pagina</h1>
    <form method="POST" action="">
        <label for="usuario_editor_id">Usuario Editor ID:</label>
        <input type="text" name="usuario_editor_id"><br>

        <label for="pagina_id">ID de página:</label>
        <input type="text" name="pagina_id"><br>

        <input type="submit" value="Insertar">
    </form>
</body>
</html>