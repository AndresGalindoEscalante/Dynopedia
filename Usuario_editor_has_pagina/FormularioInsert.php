<?php
require_once 'insert.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $usuario_editor_id = $_POST['usuario_editor_id'];
    $pagina_id = $_POST['pagina_id'];

    $insert = new Insert();
    $resultado = $insert->insertar($usuario_editor_id, $pagina_id);
    echo $resultado;
    header('Location: index.php');
}
?>

<html>

<head>
    <title>Insertar Usuario Editor has Pagina</title>
    <style>
    @import url(../FormularioStyle.css);
    /* Importar El fontawesome para la flecha de backeo */
    </style>
</head>

<body>
    <h1>Insertar Usuario Editor has Pagina</h1>
    <form method="POST" action="">
        <label for="usuario_editor_id">Usuario Editor ID:</label>
        <input type="text" name="usuario_editor_id"><br>

        <label for="pagina_id">ID de página:</label>
        <input type="text" name="pagina_id"><br>

        <div class="enlace">
            <i class="fas fa-arrow-left" onclick="history.back()"></i>
        </div>

        <input type="submit" value="Insertar">
    </form>
</body>

</html>