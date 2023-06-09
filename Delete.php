<?php


function conectar()
{
    $driver = "mysql";
    $host = 'mysql-5706.dinaserver.com';
    $port = '3306';
    $bd = 'tfg2022imf';
    $user = 'root';
    $password = '';

    $dsn = "$driver:host=$host;port=$port;dbname=$bd";
    $gbd = null;
    try {
        $gbd = new PDO($dsn, 'admintfg22', 'Morcilla01.');
        //   echo 'Conectado correctamente'."<br>";
    } catch (PDOException $e) {
        //    echo 'fallo la conexion: ' . $e->getMessage()."<br>";;
    }
    return $gbd;
}

function eliminar($id, $tabla)
{
    // Esta es la consulta sql que elimina en la base de datos segun el id que se le pase por parametro
    $sql = "DELETE FROM $tabla WHERE id = $id;";
    $conexion = conectar();
    // Ejecutar consulta utilizando un objeto PDO
    $resultado = $conexion->query($sql);
    // Comprobar si se ha eliminado correctamente el registro
    if ($resultado !== false) {
        return "Registro eliminado correctamente";
    } else {
        return "No se pudo eliminar el registro";
    }
}

$id = $_GET["id"];
$pagina = $_GET["pagina"];
$tabla = $_GET["tabla"];
eliminar($id, $tabla);
header('Location: ' . $pagina);

?>