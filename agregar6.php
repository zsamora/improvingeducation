<?php
include_once("db_connect.php");
$nombre=$_POST["nombre"];
$finicio=$_POST["finicio"];
$ftermino=$_POST["ftermino"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS
$agregar = "INSERT INTO procesos (`id`,`nombre`,`establecimiento_id`,`finicio`,`ftermino`)
                        SELECT COUNT(*) + 1,'$nombre',1,'$finicio','$ftermino'
                          FROM procesos";
if ($conn->query($agregar) === TRUE) {
  header("Location: procesos.php");
} else {
    echo "Error: " . $agregar . "<br>" . $conn->error;
}
die();
?>
