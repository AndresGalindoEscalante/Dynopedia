<?php
    class Insert {

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

        public function insertar($nombre, $nivel) {
            // Esta es la consulta sql que inserta en la base de datos segun los id que se les pase por parametro
            $sql = "INSERT INTO administrador VALUES(null, $nombre, $nivel)";
            $conexion=self::conectar();
            // Ejecutar consulta utilizando un objeto PDO
            $resultado = $conexion->query($sql);
            // Comprobar si se ha insertado correctamente el registro
            if ($resultado !== false) {
                return "Registro insertado correctamente";
            } else {
                return "No se pudo insertar el registro";
            }
        }
    }

?>