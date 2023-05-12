<?php
class Insert
{
    public function conectar()
    {
        $driver = "mysql";
        $host = 'localhost';
        $port = '3306';
        $bd = 'dynopedia';
        $user = 'root';
        $password = '';

        $dsn = "$driver:dbname=$bd;host=$host;port=$port";
        $gbd = null;
        try {
            $gbd = new PDO($dsn, $user, $password);
            //   echo 'Conectado correctamente'."<br>";
        } catch (PDOException $e) {
            //    echo 'fallo la conexion: ' . $e->getMessage()."<br>";;
        }
        return $gbd;
    }

    public function insertar($nombre, $era, $pagina_id, $familias_id, $zonas_id,$imagen)
    {
        // Esta es la consulta sql que inserta en la base de datos segun los id que se les pase por parametro
        $sql = "INSERT INTO dinosaurios VALUES(null, :nombre, :era, :pagina_id, :familias_id, :zonas_id,:imagen)";
        $conexion = self::conectar();
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':nombre', $nombre);
        $stmt->bindParam(':era', $era);
        $stmt->bindParam(':pagina_id', $pagina_id);
        $stmt->bindParam(':familias_id', $familias_id);
        $stmt->bindParam(':zonas_id', $zonas_id);
        $stmt->bindParam(':imagen', $imagen);
        $resultado = $stmt->execute();
        if ($resultado !== false) {
            echo "<script>alert('Registro insertado correctamente');</script>";
            
        } else {
            echo "<script>alert('No se pudo insertar el registro');</script>";
           
        }
        return $resultado;
    }
}
?>