<?php
session_start();
$_SESSION['eval_id'] = $_GET['eval_id'];
$_SESSION['car_id'] = $_GET['car_id'];
$_SESSION['cic_id'] = $_GET['cic_id'];
$_SESSION['asi_id'] = $_GET['asi_id'];
$_SESSION['car2_id'] = $_GET['car2_id'];
$_SESSION['cic2_id'] = $_GET['cic2_id'];
$_SESSION['asi2_id'] = $_GET['asi2_id'];
$_SESSION['tipo_eval'] = $_GET['tipo_eval'];
if(!isset($_SESSION['id'])){
	header("Location: index.php");
}
if(!isset($_SESSION['proceso_id']) || !isset($_SESSION['eval_id']) ||
	 !isset($_SESSION['car_id']) || !isset($_SESSION['cic_id']) ||
	 !isset($_SESSION['asi2_id']) || !isset($_SESSION['asi2_id']) ||
	 !isset($_SESSION['car2_id']) || !isset($_SESSION['cic2_id'] )){
	header("Location: welcome.php");
}
include('header.php');
include_once("db_connect.php");
include('navbar.php');
$proceso = $_SESSION['proceso_id'];
$tipo_eval = $_SESSION['tipo_eval'];
$evaluador = $_SESSION['id'];
// Nombre evaluado
$evaluado = $_SESSION['eval_id'];
$evaluado_nombre = "SELECT nombre, apellidop
										FROM usuarios
										WHERE id = $evaluado";
$evaluado_result = $conn->query($evaluado_nombre) or die("database error:". $conn->error);
$evaluado_row = $evaluado_result->fetch_assoc();
// Cargos Evaluado y Evaluador
$evaluado_cargo = $_SESSION['car_id'];
$evaluador_cargo = $_SESSION['car2_id'];
$cargos = "SELECT c1.nombre as cargo1, c2.nombre as cargo2
					 FROM cargos c1, cargos c2
					 WHERE c1.id = $evaluado_cargo
					 AND c2.id = $evaluador_cargo";
$cargo_res = $conn->query($cargos) or die("database error:". $conn->error);
$cargo_row = $cargo_res->fetch_assoc();
// Ciclos Evaluado y Evaluador
$evaluado_ciclo = $_SESSION['cic_id'];
$evaluador_ciclo = $_SESSION['cic2_id'];
$ciclos = "SELECT c1.nombre as ciclo1, c2.nombre as ciclo2
					 FROM ciclos c1, ciclos c2
					 WHERE c1.id = $evaluado_ciclo
					 AND c2.id = $evaluador_ciclo";
$ciclo_res = $conn->query($ciclos) or die("database error:". $conn->error);
$ciclo_row = $ciclo_res->fetch_assoc();
// Asignatura (POR RELLENAR)
$evaluado_asig = $_SESSION['asi_id'];
$evaluador_asig = $_SESSION['asi2_id'];
$asignaturas = "SELECT a1.nombre as asignatura1, a2.nombre as asignatura2
					 FROM asignaturas a1, asignaturas a2
					 WHERE a1.id = $evaluado_asig
					 AND a2.id = $evaluador_asig";
$asignatura_res = $conn->query($asignaturas) or die("database error:". $conn->error);
$asignatura_row = $asignatura_res->fetch_assoc();
// Tipo
$tipo = "SELECT nombre
					 FROM evaluacion_tipo
					 WHERE id = $tipo_eval";
$tipo_res = $conn->query($tipo) or die("database error:". $conn->error);
$tipo_row = $tipo_res->fetch_assoc();
?>
<div class="container">
	<?php include('sessionbar.php'); ?>
	<h2> Evaluación de Metas e Indicadores</h2>
	<br>
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Tipo de Evaluación</th>
				<th>Evaluado</th>
				<th>Cargo Evaluado</th>
				<th>Ciclo Evaluado</th>
				<th>Asignatura Evaluado </th>
        <th>Evaluador</th>
				<th>Cargo Evaluador</th>
				<th>Ciclo Evaluador</th>
				<th>Asignatura Evaluado </th>
			</tr>
		</thead>
		<tbody>
			<?php
				echo "<tr>";
				echo "<td>". $tipo_row["nombre"] . "</td>";
				echo "<td>" . $evaluado_row["nombre"] . " " . $evaluado_row["apellidop"] . "</td>";
				echo "<td>" . $cargo_row['cargo1']. "</td>";
				echo "<td>" . $ciclo_row["ciclo1"] . "</td>";
				echo "<td>" . $asignatura_row['asignatura1'] . "</td>";
				echo "<td>" . $_SESSION["nombre"] . " " . $_SESSION["apellidop"] ." (yo) </td>";
				echo "<td>" . $cargo_row["cargo2"] . "</td>";
				echo "<td>" . $ciclo_row["ciclo2"] . "</td>";
				echo "<td>" . $asignatura_row['asignatura2'] . "</td>";
				?>
			</tr>
		</tbody>
	</table>
</div>
<?php
// Metas
$meta = "SELECT DISTINCT meta_id, descripcion
										FROM evaluaciones_ind, metas
										WHERE proceso_id = $proceso
										AND evaluado_id = $evaluado
										AND cargo_id = $evaluado_cargo
										AND ciclo_id = $evaluado_ciclo
										AND asignatura_id = $evaluado_asig
										AND evaluador_id = $evaluador
										AND cargo_sup = $evaluador_cargo
										AND ciclo_sup = $evaluador_ciclo
										AND asignatura_sup = $evaluador_asig
										AND tipo_id = $tipo_eval
										AND metas.id = meta_id";
$meta_result = $conn->query($meta) or die("database error:". $conn->error);
while($fila_meta = $meta_result->fetch_assoc()){ ?>
	<div class="table-responsive">
		<table class="table">
			<thead>
				<tr>
					<th id='desc'>Meta</th>
					<th>Descripción </th>
				</tr>
			</thead>
			<tbody>
			<?php
				$meta_id = $fila_meta['meta_id'];
				$meta_desc = $fila_meta['descripcion'];
				echo "<tr>";
				echo "<td>".$meta_id."</td>";
				echo "<td>".$meta_desc."</td>";
				echo "</tr>"; ?>
			</tbody>
		</table>
	</div>
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<!--<th>Evaluacion ID </th>-->
				<th id='desc'>Indicador </th>
				<th>No Cumplido</th>
				<th>Minimo</th>
        <th>Esperado</th>
				<th>Sobre lo Esperado</th>
				<th>Ponderación</th>
			</tr>
		</thead>
		<tbody>
<form action="" method="post" id="send-form">
<?php
	// Indicadores
	$indicadores = "SELECT id, indicador_id
						  FROM evaluaciones_ind
							WHERE proceso_id = $proceso
							AND evaluado_id = $evaluado
							AND cargo_id = $evaluado_cargo
							AND ciclo_id = $evaluado_ciclo
							AND asignatura_id = $evaluado_asig
							AND evaluador_id = $evaluador
							AND cargo_sup = $evaluador_cargo
							AND ciclo_sup = $evaluador_ciclo
							AND asignatura_sup = $evaluado_asig
							AND tipo_id = $tipo_eval
							AND meta_id = $meta_id";
	$ind_result = $conn->query($indicadores) or die("database error:". $conn->error);
	while($fila_ind = $ind_result->fetch_assoc()){
		$eval_id = $fila_ind['id'];
		$indicador_id = $fila_ind['indicador_id'];
		// Metas
		$info = "SELECT indicadores.descripcion as idesc,
										no_cumplido, minimo, esperado, sobre_esperado, ponderacion
							FROM metas, indicadores
							WHERE indicadores.id = $indicador_id";
		$info_result = $conn->query($info) or die("database error:". $conn->error);
		$info_row = $info_result->fetch_assoc();
		$resultado = "SELECT respuesta FROM resultados_ind WHERE evaluacion_id = $eval_id";
		$resultado_result = $conn->query($resultado) or die("database error:". $conn->error);
		$estado = $resultado_result->num_rows;
		if ($estado == 1) {
			$resultado_row = $resultado_result->fetch_assoc();
			echo "<tr>";
			//echo "<td>".$eval_id."</td>";
			echo "<td>".$info_row["idesc"]."</td>";
			// Primer cuadro
			if ($resultado_row['respuesta'] == 1) {
				echo "<td id='select' style='background-color:lightblue'><input type='radio' name='".$eval_id."' value ='1' checked='checked'";
			}
			else {
				echo "<td id='select'><input type='radio' name='".$eval_id."' value ='1'";
			}
			echo ">" . $info_row["no_cumplido"]."</td>";
			// Segundo cuadro
			if ($resultado_row['respuesta'] == 2) {
				echo "<td id='select' style='background-color:lightblue'><input type='radio' name='".$eval_id."' value ='2' checked='checked'";
			}
			else {
				echo "<td id='select'><input type='radio' name='".$eval_id."' value ='2'";
			}
			echo ">" . $info_row["minimo"]."</td>";
			// Tercer cuadro
			if ($resultado_row['respuesta'] == 3) {
				echo "<td id='select' style='background-color:lightblue'><input type='radio' name='".$eval_id."' value ='3' checked='checked'";
			}
			else {
				echo "<td id='select'><input type='radio' name='".$eval_id."' value ='3'";
			}
			echo ">" . $info_row["esperado"]."</td>";
			// Cuarto cuadro
			if ($resultado_row['respuesta'] == 4) {
				echo "<td id='select' style='background-color:lightblue'><input type='radio' name='".$eval_id."' value ='4' checked='checked'";
			}
			else {
				echo "<td id='select'><input type='radio' name='".$eval_id."' value ='4'";
			}
			echo ">" . $info_row["sobre_esperado"]."</td>";
			echo "<td>". $info_row["ponderacion"]."%</td>";
			echo "</tr>";
		}
		else {
			echo "<tr>";
			//echo "<td>".$eval_id."</td>";
			echo "<td>".$info_row["idesc"]."</td>";
			echo "<td id='select'><input type='radio' name='".$eval_id."' value ='1'>" . $info_row["no_cumplido"]."</td>";
			echo "<td id='select'><input type='radio' name='".$eval_id."' value ='2'>" . $info_row["minimo"]."</td>";
			echo "<td id='select'><input type='radio' name='".$eval_id."' value ='3'>" . $info_row["esperado"]."</td>";
			echo "<td id='select'><input type='radio' name='".$eval_id."' value ='4'>" . $info_row["sobre_esperado"]."</td>";
			echo "<td>". $info_row["ponderacion"]." %</td>";
			echo "</tr>";
		}

		}?>
		</tbody>
	</table>
</div>
<?php }?>
<br>
	<div class="form-group">
		<center>
			<button type="submit" class="btn btn-default" name="send_button1" id="send_button1">
				<span class="glyphicon glyphicon-send"></span> &nbsp; Enviar Resultados (Guardar)
			</button>
		</center>
	</div>
</form>
</div>
<?php include('footer.php');?>
<script type="text/javascript">
	//Funciona bien para seleccionar
	//$('td').click(e => $(e.currentTarget).find('input').prop('checked',true));
	$('td#select').click(function(){
		$(this).css('background-color','lightblue');
		$(this).siblings().css( "background-color",'white');
		$(this).find('input').prop('checked',true);
	});
	$('#send_button1').click(function() {
    var val = $('input:checked').serialize();
    var elements = val.split("&");
    var id_result = []
    var seleccion_result = []
    for (var i = 0; i < elements.length; i++){
      var x = elements[i].split("=");
      id_result.push(parseInt(x[0]));
      seleccion_result.push(parseInt(x[1]));
    }
    if (elements.length >= 1 && elements[0] != "") {
      $.ajax({
        type : 'POST',
        url  : 'enviar.php',
        data : {id_result: id_result, seleccion_result: seleccion_result},
        success : function(response){
          console.log(response);
          window.location.replace("proceso.php?proceso_id="+response);
        }
      });
    }
    else {
        console.log("Algo paso");
    }
  });
</script>
