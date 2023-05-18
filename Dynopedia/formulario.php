<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="icon" type="image/jpg" href="img/icono.ico" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Formulario</title>
    <link rel="stylesheet" href="formulariostyle.css">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="fontawesome/css/all.min.css">
</head>

<body>
    <header>
        <div class="cabecera">
            <img src="img/logo.png" id="logo">
            <ul class="listaNav">
                <a href="index.html">
                    <li>Inicio</li>
                </a>
                <a href="admin.html">
                    <li>Administración</li>
                </a>
            </ul>
        </div>
    </header>

    <main>
        <form action="#" target="" method="get" name="iniciarsesion">
            <label for="email">Email</label><br>
            <input type="email" name="email" id="email" placeholder="email" required>
            <br>
            <label for="asunto">Contraseña</label><br>
            <input type="password" name="password" id="password" placeholder="Contraseña"><br>

            <input id="enviar" type="button" name="enviar" value="Enviar datos" />

            <div class="enlace">
                <i class="fas fa-arrow-left" onclick="history.back()"></i>
            </div>

            <div>
                <p>¿No tienes una cuenta?</p>
                <a href="registro.php">Haz clic aqui para registrarte</a>
            </div>
        </form>
    </main>
</body>

</html>