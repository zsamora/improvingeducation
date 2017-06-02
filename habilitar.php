<?php
include_once("db_connect.php");
$usuario=$_GET["id"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS
$habilitar = "UPDATE usuarios
                 SET habilitado = 1
               WHERE id = $usuario";
if ($conn->query($habilitar) === TRUE) {
  header("Location: usuarios.php");
} else {
    echo "Error: " . $habilitar . "<br>" . $conn->error;
}
die();
?>
