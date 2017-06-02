<?php
include_once("db_connect.php");
$usuario=$_GET["id"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS
$deshabilitar = "UPDATE usuarios
                 SET habilitado = 0
               WHERE id = $usuario";
if ($conn->query($deshabilitar) === TRUE) {
  header("Location: usuarios.php");
} else {
    echo "Error: " . $deshabilitar . "<br>" . $conn->error;
}
die();
?>
