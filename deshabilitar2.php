<?php
include_once("db_connect.php");
$proceso=$_GET["id"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS
$deshabilitar = "UPDATE procesos
                 SET habilitado = 0
               WHERE id = $proceso";
if ($conn->query($deshabilitar) === TRUE) {
  header("Location: procesos.php");
} else {
    echo "Error: " . $deshabilitar . "<br>" . $conn->error;
}
die();
?>
