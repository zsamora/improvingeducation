<?php
include_once("db_connect.php");
$proceso=$_GET["id"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS
$habilitar = "UPDATE procesos
                 SET habilitado = 1
               WHERE id = $proceso";
if ($conn->query($habilitar) === TRUE) {
  header("Location: procesos.php");
} else {
    echo "Error: " . $habilitar . "<br>" . $conn->error;
}
die();
?>
