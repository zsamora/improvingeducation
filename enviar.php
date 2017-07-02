<?php
session_start();
include_once("db_connect.php");
$ids = $_POST['id_result'];
$selecciones = $_POST['seleccion_result'];
$proceso = $_SESSION['proceso_id'];
$i = 0;
for ($i = 0 ; $i < count($ids) ; $i++){
      $eval_id = $ids[$i];
      $sel_id = $selecciones[$i];
      $insertar_sql ="INSERT INTO resultados_ind (evaluacion_id,respuesta) VALUES ($eval_id,$sel_id)";
      $insertar_result = $conn->query($insertar_sql) or die ("database error:". $conn->error);
      $delete_sql = "DELETE FROM resultados_ind WHERE evaluacion_id = $eval_id";
      $delete_result = $conn->query($delete_sql) or die ("database error:". $conn->error);
      $insertar_sql ="INSERT INTO resultados_ind (evaluacion_id,respuesta) VALUES ($eval_id,$sel_id)";
      $insertar_result = $conn->query($insertar_sql) or die ("database error:". $conn->error);
      /*$existe_sql = "SELECT * FROM resultados_ind WHERE evaluacion_id = $eval_id";
      $existe_result = $conn->query($existe_sql) or die("database error:". $conn->error);
      if ($existe_result->num_rows == 0){
      }
      else {*/
        //$update_sql = "UPDATE resultados_ind SET respuesta = $sel_id WHERE evaluacion_id = $eval_id";
        //$update_result = $conn->query($update_sql) or die ("database error:". $conn->error);
      //}
}
echo 1;
?>
