<?php
class Database
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
        $gbd=null;
        try {
            $gbd = new PDO($dsn, $user, $password);
        //   echo 'Conectado correctamente'."<br>";
        } catch (PDOException $e) {
        //    echo 'fallo la conexion: ' . $e->getMessage()."<br>";;
        }
        return $gbd;
    }
   
    public function getAll($tabla)
    {
        $conexion=self::conectar();
        $sql = "SELECT * FROM $tabla";
        $resultados = $conexion->query($sql);

     return $resultados;
    }

    public function getElementById($tabla,$id){
        $conexion=self::conectar();
        $sql = "SELECT * FROM $tabla";
        $resultados = $conexion->query($sql);

     return $resultados->fetch(PDO::FETCH_ASSOC);
    }

    function modificacion($sql){
        $db = new Database();
        $conexion=  $db->conectar();
        $conexion->exec($sql);
    }
}
?>