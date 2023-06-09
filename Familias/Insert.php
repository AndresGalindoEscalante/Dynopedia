<?php
class Insert
{

    public function conectar()
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

    public function insertar($nombre)
    {
        // Esta es la consulta sql que inserta en la base de datos segun los id que se les pase por parametro
        $sql = "INSERT INTO 16_familias VALUES(null, :nombre)";
        $conexion = self::conectar();
        $stmt = $conexion->prepare($sql);
        $stmt->bindParam(':nombre', $nombre);
        $resultado = $stmt->execute();
        if ($resultado !== false) {
            echo "<script>alert('Registro insertado correctamente');</script>";
        } else {
            echo "<script>alert('No se pudo insertar el registro');</script>";
        }
    }
}

?>