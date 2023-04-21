<?php
    class Delete {

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

        public function eliminar($id) {
            // Esta es la consulta sql que elimina en la base de datos segun el id que se le pase por parametro
            $sql = "DELETE FROM zonas WHERE id = $id;";
            $conexion=self::conectar();
            // Ejecutar consulta utilizando un objeto PDO
            $resultado = $conexion->query($sql);
            // Comprobar si se ha eliminado correctamente el registro
            if ($resultado !== false) {
                return "Registro eliminado correctamente";
            } else {
                return "No se pudo eliminar el registro";
            }
        }
    }

?>