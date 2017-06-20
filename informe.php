<?php
session_start();
// Chequear que sea el admin (agregar aquí id's autorizadas)
if($_SESSION['id']!=1){
	header("Location: index.php");
}
// Chequear que esté dentro de un proceso
if(!isset($_SESSION['proceso_id'])){
	header("Location: welcome.php");
}
include('header.php');
include_once("db_connect.php");
include('navbar.php');
// Recibir datos del usuario
$_SESSION['usuario_id'] = $_GET['usuario_id'];
$_SESSION['car_id'] = $_GET['car_id'];
$_SESSION['cic_id'] = $_GET['cic_id'];
$_SESSION['asi_id'] = $_GET['asi_id'];
$usuario_id = $_SESSION['usuario_id'];
$cargo_id = $_SESSION['car_id'];
$ciclo_id = $_SESSION['cic_id'];
$asi_id = $_SESSION['asi_id'];
$proceso = $_SESSION['proceso_id'];
require_once 'dompdf/autoload.inc.php';
use Dompdf\Dompdf;
// Información del Usuario
$usuario_info = "SELECT usuarios.nombre as nombre, usuarios.apellidop as apellido,
												cargos.nombre as cargo, ciclos.nombre as ciclo,
												asignaturas.nombre as asignatura, perfiles.nombre as perfil
									FROM cargos, ciclos, asignaturas, usuarios, trabaja, perfiles
									WHERE cargos.id = $cargo_id
									AND ciclos.id = $ciclo_id
									AND asignaturas.id = $asi_id
									AND usuarios.id = $usuario_id
									AND trabaja.usuario_id = $usuario_id
									AND perfiles.id = trabaja.perfil_id";
$usuario_result = $conn->query($usuario_info) or die("database error:". $conn->error);
$resultado = $usuario_result->fetch_assoc();
// Tabla información de usuario ?>
<div class="container">
	<?php include('sessionbar.php');
	echo "<a id='pdf-btn' href='pdfresult.php?usuario_id=".$usuario_id."
																	&car_id=".$cargo_id."
																	&cic_id=".$ciclo_id."
																	&asi_id=".$asi_id."
																	' class='btn btn-danger'> Descargar PDF </a>";
  ?>
<br><br>
<div class="table-responsive">
	<table class="table">
		<thead>
      <tr>
				<th>Nombre</th>
				<th>Apellido</th>
        <th>Cargo</th>
				<th>Ciclo</th>
				<th>Asignatura</th>
      </tr>
    </thead>
		<tbody>
			<?php
				$cargo = $resultado['cargo'];
				$perfil = $resultado['perfil'];
				echo "<tr>";
				echo "<td>". $resultado['nombre'] . "</td>";
				echo "<td>". $resultado['apellido'] . "</td>";
				echo "<td>" . $resultado['cargo'] . "</td>";
				echo "<td>" . $resultado['ciclo'] . "</td>";
				echo "<td>" . $resultado['asignatura'] . "</td>";
				echo "</tr>";
			?>
  	</tbody>
	</table>
</div>
<?php
// Consultas con resultados generales
$respind = "SELECT COUNT(respuesta) as res
						  FROM evaluaciones_ind, resultados_ind
						 WHERE evaluaciones_ind.id = evaluacion_id
						 	 AND evaluado_id = $usuario_id
						 	 AND cargo_id = $cargo_id
							 AND ciclo_id = $ciclo_id
							 AND asignatura_id = $asi_id
							 AND proceso_id = $proceso";
$respind_result = $conn->query($respind) or die ("database error: " . $conn->error);
$respind_row = $respind_result->fetch_assoc();
$respcomp = "SELECT COUNT(respuesta) as res
						  FROM evaluaciones_comp, resultados_comp
						 WHERE evaluaciones_comp.id = evaluacion_id
						 	 AND evaluado_id = $usuario_id
						 	 AND cargo_id = $cargo_id
							 AND ciclo_id = $ciclo_id
							 AND asignatura_id = $asi_id
							 AND proceso_id = $proceso";
$respcomp_result = $conn->query($respcomp) or die ("database error: " . $conn->error);
$respcomp_row = $respcomp_result->fetch_assoc();
if ($respind_row['res'] == 0 && $respcomp_row['res'] == 0){ ?>
	<h3>No se enviaron respuestas para el evaluado</h3>
<?php
	include('footer.php');
}
// Caso solo de indicadores
else if ($respcomp_row['res'] == 0) { ?>
	<h3>Solo hay respuestas de indicadores (o no tiene evaluaciones de competencias)</h3>
	<br>
	<?php
	$respuesta = "SELECT ROUND(SUM(result) / COUNT(result), 2) as resultado
									FROM (SELECT evaluador_id, ROUND(SUM(valores.valor * (ponderacion/100.0)),2) as result
					 								FROM evaluaciones_ind, resultados_ind, indicadores, valores
					 							 WHERE evaluaciones_ind.id = evaluacion_id
					 						 		 AND respuesta = valores.id
					 							 	 AND evaluado_id = $usuario_id
					 							 	 AND cargo_id = $cargo_id
					 							 	 AND ciclo_id = $ciclo_id
					 							 	 AND asignatura_id = $asi_id
					 							 	 AND indicadores.id = indicador_id
					 						GROUP BY evaluador_id
												) as por_evaluador";
  $respuesta_result = $conn->query($respuesta) or die("database error:". $conn->error);
	$resultado = $respuesta_result->fetch_assoc();
	$meta_general = $resultado['resultado'];
	$prom_general = $resultado['resultado'];
	// Tabla con resultados generales ?>
	<div class="table-responsive">
		<table class="table">
			<thead>
	      <tr>
					<th style="background-color:rgba(255, 255, 0 ,0.8)">Resultado Metas (100%)</th>
					<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
	      </tr>
	    </thead>
			<tbody style="text-align:center">
				<?php
						echo "<tr>";
						echo "<td id='meta' value='".$meta_general."'>". $meta_general."%</td>";
						echo "<td id='gen' value='".$prom_general."'>". $prom_general."%</td>";
						echo "</tr>";
				?>
	  	</tbody>
		</table>
		<br>
		<canvas id="myChart" width="10" height="3"></canvas>
		<br><br>
	</div>
	<?php
	// Tabla con resultados generales de Metas ?>
		<div class="table-responsive">
			<h3> Metas del Cargo: <?php echo $cargo ?> </h3>
			<br>
			<table class="table">
				<thead>
					<tr>
						<th> Valor </th>
						<th> Porcentaje </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td> No Cumplido </td>
						<td> 33 % </td>
					</tr>
					<tr>
						<td> Mínimo </td>
						<td> 67 % </td>
					</tr>
					<tr>
						<td> Esperado </td>
						<td> 100 % </td>
					</tr>
					<tr>
						<td> Sobre lo esperado </td>
						<td> 133 % </td>
					</tr>
				</tbody>
			</table>
			<br>
			<?php
				// Metas
				$meta = "SELECT DISTINCT metas.descripcion as meta_desc,
																 metas.id as id
							 							FROM evaluaciones_ind, metas
									 				 WHERE metas.id = evaluaciones_ind.meta_id
									 			     AND evaluado_id = $usuario_id
	 								 			 		 AND cargo_id = $cargo_id
									 				   AND ciclo_id = $ciclo_id
									 				   AND asignatura_id = $asi_id
									 				   AND proceso_id = $proceso
												ORDER BY id";
				$meta_result = $conn->query($meta) or die("database error:". $conn->error);
				$total = 0;
				while($fila_meta = $meta_result->fetch_assoc()){
					$meta = $fila_meta['id'];
					$meta_desc = $fila_meta['meta_desc'];
					$indicador = "SELECT indicadores.id as id,
						                   descripcion, no_cumplido,
															 minimo, esperado,
															 sobre_esperado, ponderacion
													FROM indicadores, indicador_cargos
												 WHERE indicadores.meta_id = $meta
												 	 AND indicador_cargos.cargo_id = $cargo_id
													 AND indicador_cargos.indicador_id = indicadores.id";
					$indicador_result = $conn->query($indicador) or die ("database error:". $conn->error);?>
					<div class="table-responsive">
					<h4 class="meta"><?php echo "Meta N°".$meta." : ".$meta_desc; ?></h4>
					<table class="table">
						<thead>
							<tr>
								<th>Indicador</th>
								<th>No Cumplido</th>
								<th>Mínimo</th>
								<th>Esperado </th>
				        <th>Sobre lo esperado</th>
								<th>Ponderación</th>
								<th>Cumplimiento</th>
							</tr>
						</thead>
						<tbody>
					<?php
					while ($fila_indicador = $indicador_result->fetch_assoc()){
						$indicador = $fila_indicador["id"];
						$ponderacion = $fila_indicador['ponderacion'];
						$evaluacion = "SELECT ROUND(SUM(valor)/COUNT(valor),2) as resultado
						  							 FROM resultados_ind, evaluaciones_ind, valores
														WHERE resultados_ind.evaluacion_id = evaluaciones_ind.id
														  AND resultados_ind.respuesta = valores.id
														  AND evaluado_id = $usuario_id
									 					  AND cargo_id = $cargo_id
									 					  AND ciclo_id = $ciclo_id
															AND asignatura_id = $asi_id
														  AND proceso_id = $proceso
															AND indicador_id = $indicador";
						$evaluacion_result = $conn->query($evaluacion) or die("database error:". $conn->error);
						$fila_evaluacion = $evaluacion_result->fetch_assoc();
						echo "<tr>";
						echo "<td>".$fila_indicador['descripcion']."</td>";
						echo "<td>".$fila_indicador['no_cumplido']."</td>";
						echo "<td>".$fila_indicador['minimo']."</td>";
						echo "<td>".$fila_indicador['esperado']."</td>";
						echo "<td>".$fila_indicador['sobre_esperado']."</td>";
						echo "<td>".$ponderacion."%</td>";
						echo "<td>".$fila_evaluacion['resultado']."%</td>";
						echo "</tr>";
						$total += $fila_evaluacion['resultado'] * ($ponderacion / 100.0);
						}
						echo "</tbody>";
						echo "</table>";
					}
					?>
					<h3 class="total"> Total: <?php echo ROUND($total,2); ?> %</h3>
				</div>
<?php
	include('footer.php'); ?>
	<script type="text/javascript">
	window.onload = function(){
		var metas = <?php echo $meta_general ?>;
		var general = <?php echo $prom_general ?>;
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
		type: 'bar',
		data: {
				labels: ["Metas","General"],
				datasets: [{
						data: [metas, general],
						backgroundColor: [
								'rgba(255, 255, 0, 0.5)',
								'rgba(255, 80, 0, 0.5)'
						],
						borderColor: [
							'rgba(255, 255, 0, 1)',
							'rgba(255, 80, 0, 1)'
						],
						borderWidth: 2
				}]
		},
		options: {
				legend: {
					fontColor:"black",
					fontSize: 18,
					display: false
				},
				scales: {
						yAxes: [{
								ticks: {
										fontColor: "black",
										beginAtZero:true,
										max: 140
								}
						}],
						xAxes: [{
								ticks: {
									fontColor: "black",
									beginAtZero:true
								}
						}]
				}
		}
	});
	$("#pdf-btn").click(function() {
		var dataURL = document.getElementById("myChart").toDataURL("image/png");
		dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		$.ajax({
			type: "POST",
			url: 'saveimage.php',
			data: {image1 : dataURL},
			success: function(respond){
				console.log(respond);
			}
		});
	});
	};
	</script>

<?php
}

// Caso Solo respuestas de competencia
else if ($respind_row['res'] == 0) { ?>
	<h3>Solo hay respuestas de competencias (o no tiene evaluaciones de indicadores)</h3>
	<br>
	<?php
	$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
										FROM resultados_comp, evaluaciones_comp, valores
									 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
										 AND resultados_comp.respuesta = valores.id
										 AND evaluado_id = $usuario_id
										 AND cargo_id = $cargo_id
										 AND ciclo_id = $ciclo_id
										 AND asignatura_id = $asi_id
										 AND proceso_id = $proceso
										 AND tipo_id = 3";
	$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
	$fila_col = $colaborador_result->fetch_assoc();
	$verificador = ($fila_col['resultado'] != NULL); // Si es distinto de null, hay un valor
	if (!$verificador) {
		$respuesta = "SELECT ROUND(SUM(resultado) / COUNT(resultado),2) as resultado
										FROM (SELECT competencia_id, ROUND(SUM(tabla.resultado * (ponderacion / 100.0)),2) as resultado
														FROM (SELECT competencia_id, tipo_id, SUM(res_previo)/COUNT(res_previo) as resultado
																		FROM (SELECT evaluador_id, competencia_id, tipo_id,
																					ROUND(SUM(valores.valor * (ponderacion/100.0)),2) as res_previo
																						FROM evaluaciones_comp, resultados_comp, criterios, valores
																					 WHERE evaluaciones_comp.id = evaluacion_id
																						 AND respuesta = valores.id
																						 AND evaluado_id = $usuario_id
																						 AND cargo_id = $cargo_id
																						 AND ciclo_id = $ciclo_id
																						 AND asignatura_id = $asi_id
																						 AND proceso_id = $proceso
																						 AND criterios.id = criterio_id
																				GROUP BY evaluador_id, competencia_id, tipo_id
																			) as por_evaluador, ponderacion_tipo2
																	 WHERE ponderacion_tipo2.id = tipo_id
																GROUP BY competencia_id, tipo_id
													) as tabla, ponderacion_tipo2
									WHERE ponderacion_tipo2.id = tipo_id
							 GROUP BY competencia_id) as tablita";
	}
	else {
	$respuesta = "SELECT ROUND(SUM(resultado) / COUNT(resultado),2) as resultado
		 							FROM (SELECT competencia_id, ROUND(SUM(tabla.resultado * (ponderacion / 100.0)),2) as resultado
						 							FROM (SELECT competencia_id, tipo_id, SUM(res_previo)/COUNT(res_previo) as resultado
										 							FROM (SELECT evaluador_id, competencia_id, tipo_id,
																				ROUND(SUM(valores.valor * (ponderacion/100.0)),2) as res_previo
														 							FROM evaluaciones_comp, resultados_comp, criterios, valores
																				 WHERE evaluaciones_comp.id = evaluacion_id
																				   AND respuesta = valores.id
																					 AND evaluado_id = $usuario_id
																					 AND cargo_id = $cargo_id
																					 AND ciclo_id = $ciclo_id
																					 AND asignatura_id = $asi_id
																					 AND proceso_id = $proceso
																					 AND criterios.id = criterio_id
																		  GROUP BY evaluador_id, competencia_id, tipo_id
																				) as por_evaluador, ponderacion_tipo
																 WHERE ponderacion_tipo.id = tipo_id
								 							GROUP BY competencia_id, tipo_id
												) as tabla, ponderacion_tipo
							 	WHERE ponderacion_tipo.id = tipo_id
						 GROUP BY competencia_id) as tablita";
	}
	$respuesta_result = $conn->query($respuesta) or die("database error:". $conn->error);
	$resultado = $respuesta_result->fetch_assoc();
	$comp_general = $resultado['resultado'];
	$prom_general = $resultado['resultado'];
	// Tabla con resultados generales ?>
	<div class="table-responsive">
		<table class="table">
			<thead>
	      <tr>
	        <th style="background-color:rgba(255, 14, 44 ,0.8)">Resultado Competencias (100%)</th>
					<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
	      </tr>
	    </thead>
			<tbody style="text-align:center">
				<?php
						echo "<tr>";
						echo "<td id='comp' value='".$comp_general."'>". $comp_general."%</td>";
						echo "<td id='gen' value='".$prom_general."'>". $prom_general."%</td>";
						echo "</tr>";
				?>
	  	</tbody>
		</table>
		<br>
		<canvas id="myChart" width="10" height="3"></canvas>
		<br><br>
		</div>
		<h3> Competencias del Perfil: <?php echo $perfil; ?></h3>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th> Leyenda </th>
					<th> Nivel </th>
					<th> Porcentaje (%)</th>
					<th> Rango de Evaluación </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> Mínimo </td>
					<td> 1 </td>
					<td> 33.33 % </td>
					<td> 0 - 33.33 %</td>
				</tr>
				<tr>
					<td> En Desarrollo </td>
					<td> 2 </td>
					<td> 66.66 % </td>
					<td> 33.34 - 66.66 %</td>
				</tr>
				<tr>
					<td> Desarrollado </td>
					<td> 3 </td>
					<td> 99.99 % </td>
					<td> 66.67 - 99.99 %</td>
				</tr>
				<tr>
					<td> Destacado </td>
					<td> 4 </td>
					<td> 133.32 % </td>
					<td> 100 - 133.32 %</td>
				</tr>
				<tr>
					<td></td>
					<td> Nivel esperado </td>
					<td> 3 </td>
					<td></td>
				</tr>
			</tbody>
		</table>
		<?php
		$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
											FROM resultados_comp, evaluaciones_comp, valores
										 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
											 AND resultados_comp.respuesta = valores.id
											 AND evaluado_id = $usuario_id
											 AND cargo_id = $cargo_id
											 AND ciclo_id = $ciclo_id
											 AND asignatura_id = $asi_id
											 AND proceso_id = $proceso
											 AND tipo_id = 3";
		$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
		$fila_col = $colaborador_result->fetch_assoc();
		$verificador = ($fila_col['resultado'] != NULL); // Si es distinto de null, hay un valor
		if ($verificador){ ?>
			<canvas id="myChart2" width="10" height="3"></canvas>
			<br><br>
			<canvas id="myChart3" width="12" height="5"></canvas>
		<?php
		}
		else { ?>
			<canvas id="myChart4" width="10" height="3"></canvas>
			<br><br>
			<canvas id="myChart5" width="12" height="5"></canvas>
		<?php
		}
	// Competencias
	// Necesito una constante de array para guardar las competencias
	$comp_array = new ArrayObject();
	$comp_nombres = new ArrayObject();
	$comp_autoeval = new ArrayObject();
	$comp_superior = new ArrayObject();
	$comp_colaborador = new ArrayObject();
	$comp_suma = new ArrayObject();
	// $comp_array[x][0] -> entrega las ids
	// $comp_array[x][1] -> entrega los nombres
	// $comp_array[x][2] -> entrega autoeval
	// $comp_array[x][3] -> entrega superior
	// $comp_array[x][4] -> entrega colaborador
	// $comp_array[x][5] -> entrega general
	$comp = "SELECT DISTINCT competencia_id, competencias.nombre as nombre
											FROM evaluaciones_comp, competencias
											WHERE proceso_id = $proceso
											AND evaluado_id = $usuario_id
											AND cargo_id = $cargo_id
											AND ciclo_id = $ciclo_id
											AND asignatura_id = $asi_id
											AND competencias.id = competencia_id";
	$comp_result = $conn->query($comp) or die("database error:". $conn->error);
	$resultado_autoeval2 = 0;
	$resultado_superior2 = 0;
	$resultado_colaborador2 = 0;
	$contador2 = 0;
	while($fila_comp = $comp_result->fetch_assoc()){
		$competencia_id = $fila_comp['competencia_id'];
		$competencia_nombre = $fila_comp['nombre'];
		$crit = "SELECT criterios.id as id,
										ponderacion
							 FROM comp_crit, criterios
							WHERE comp_crit.competencia_id = $competencia_id
								AND comp_crit.criterio_id = criterios.id
					 ORDER BY id";
		$crit_result = $conn->query($crit) or die ("database error:". $conn->error);
		$resultado_competencia = 0;
		$resultado_autoeval = 0;
		$resultado_superior = 0;
		$resultado_colaborador = 0;
		$contador = 0;
		$resultado_competencia2 = 0;
		while ($fila_crit = $crit_result->fetch_assoc()){
			$criterio = $fila_crit["id"];
			$ponderacion = $fila_crit['ponderacion'];
			// Resultados por tipo encuesta
			$autoeval = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
										AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 1";
		$autoeval_result = $conn->query($autoeval) or die("database error:". $conn->error);
		$fila_autoeval = $autoeval_result->fetch_assoc();
		$autoeval2 = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
								 FROM resultados_comp, evaluaciones_comp, valores
								WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									AND resultados_comp.respuesta = valores.id
									AND evaluado_id = $usuario_id
									AND cargo_id = $cargo_id
									AND ciclo_id = $ciclo_id
									AND asignatura_id = $asi_id
									AND proceso_id = $proceso
									AND criterio_id = $criterio
									AND tipo_id = 1";
	$autoeval2_result = $conn->query($autoeval2) or die("database error:". $conn->error);
	$fila_autoeval2 = $autoeval2_result->fetch_assoc();
		$superior = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
				 					  AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 2";
		$superior_result = $conn->query($superior) or die("database error:". $conn->error);
		$fila_sup = $superior_result->fetch_assoc();
		$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									    FROM resultados_comp, evaluaciones_comp, valores
										 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  	 AND resultados_comp.respuesta = valores.id
									  	 AND evaluado_id = $usuario_id
				 					  	 AND cargo_id = $cargo_id
				 					  	 AND ciclo_id = $ciclo_id
				 					  	 AND asignatura_id = $asi_id
									  	 AND proceso_id = $proceso
											 AND criterio_id = $criterio
							 				 AND tipo_id = 3";
		$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
		$fila_col = $colaborador_result->fetch_assoc();
		$verificador = ($fila_col['resultado'] != NULL); // Si es distinto de null, hay un valor
		if ($verificador){
			$resultado_autoeval += $fila_autoeval['resultado'];
			$resultado_superior += $fila_sup['resultado'];
			$resultado_colaborador += $fila_col['resultado'];
			//$resultado_competencia += ROUND(($fila_autoeval['resultado'] * 0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15)*$ponderacion,2);
		}
		else {
			$resultado_autoeval += $fila_autoeval['resultado'];
			$resultado_superior += $fila_sup['resultado'];
			//$resultado_competencia += ROUND(($fila_autoeval['resultado'] * 0.1 + $fila_sup['resultado'] * 0.90)*$ponderacion,2);
		}
		$contador += 1;
		}
		$contador2 +=1;
		$resultado_autoeval = ROUND($resultado_autoeval/$contador,2);
		$resultado_autoeval2 += $resultado_autoeval;
		$resultado_superior = ROUND($resultado_superior/$contador,2);
		$resultado_superior2 += $resultado_superior;
		$resultado_colaborador = ROUND($resultado_colaborador/$contador,2);
		$resultado_colaborador2 += $resultado_colaborador;
		if ($verificador){
				$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.75 + $resultado_colaborador * 0.15,2);
				$comp_array->append(array($competencia_id,$competencia_nombre,$resultado_autoeval,$resultado_superior,$resultado_colaborador,$resultado_competencia));
				$comp_nombres->append($competencia_nombre);
				$comp_autoeval->append($resultado_autoeval);
				$comp_superior->append($resultado_superior);
				$comp_colaborador->append($resultado_colaborador);
				$comp_suma->append($resultado_competencia);
		}
		else {
			$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.9,2);
			$comp_array->append(array($competencia_id,$competencia_nombre,$resultado_autoeval,$resultado_superior,0,$resultado_competencia));
			$comp_nombres->append($competencia_nombre);
			$comp_autoeval->append($resultado_autoeval);
			$comp_superior->append($resultado_superior);
			$comp_colaborador->append($resultado_colaborador);
			$comp_suma->append($resultado_competencia);
		}
		?>
		<table class="table table-condensed">
			<h4 class="comp"> <?php echo "Competencia N°".$competencia_id." : ".$competencia_nombre?> </h4>
			<thead>
					<tr>
						<th>Evaluador </th>
						<th>Peso opinante</th>
						<th>Porcentaje </th>
						<th>Nivel </th>
					</tr>
			</thead>
			<tbody>
				<tr>
					<?php
					echo "<tr>";
					echo "<td>Auto-Evaluación</td>";
					echo "<td>10%</td>";
					echo "<td>".$resultado_autoeval."%</td>";
					if ($resultado_autoeval <= 33.33) { echo "<td>1</td>";}
					elseif ($resultado_autoeval <= 66.66) { echo "<td>2</td>";}
					elseif ($resultado_autoeval <= 99.99) { echo "<td>3</td>";}
					else { echo "<td>4</td>";}
					echo "</tr>";
					if ($verificador){
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>75%</td>";
						echo "<td>".$resultado_superior."%</td>";
						if ($resultado_superior <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_superior <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_superior <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
						echo "<tr>";
						echo "<td>Colaboradores</td>";
						echo "<td>15%</td>";
						echo "<td>".$resultado_colaborador."%</td>";
						if ($resultado_colaborador <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_colaborador <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_colaborador <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".$resultado_competencia."%</td>";
						if ($resultado_competencia <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_competencia <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_competencia <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
					}
					else {
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>90%</td>";
						echo "<td>".$resultado_superior."%</td>";
						if ($resultado_superior <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_superior <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_superior <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".$resultado_competencia."%</td>";
						if ($resultado_competencia <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_competencia <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_competencia <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>"; }
						echo "</tr>";
					}
					?>
				</tr>
			</tbody>
		</table>
		<br>
	<div class="table-responsive">
		<?php
		// Criterios
		$crit = "SELECT criterios.descripcion as descr,
										criterios.id as id,
										ponderacion
							 FROM comp_crit, criterios
							WHERE comp_crit.competencia_id = $competencia_id
								AND comp_crit.criterio_id = criterios.id
					 ORDER BY id";
		$crit_result = $conn->query($crit) or die ("database error:". $conn->error);
		while ($fila_crit = $crit_result->fetch_assoc()){
			$criterio = $fila_crit["id"];?>
		<table class="table">
			<thead>
				<tr>
					<th>Criterio N°<?php echo $fila_crit["id"]?></th>
					<th>Ponderación </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> <?php echo $fila_crit["descr"]?></td>
					<td> <?php echo $fila_crit["ponderacion"] ?>%</td>
				</tr>
			</tbody>
		</table>
		<?php
		// Resultados por tipo encuesta
		$autoeval = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
										AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 1";
		$autoeval_result = $conn->query($autoeval) or die("database error:". $conn->error);
		$fila_autoeval = $autoeval_result->fetch_assoc();
		$superior = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
				 					  AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 2";
		$superior_result = $conn->query($superior) or die("database error:". $conn->error);
		$fila_sup = $superior_result->fetch_assoc();
		$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									    FROM resultados_comp, evaluaciones_comp, valores
										 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  	 AND resultados_comp.respuesta = valores.id
									  	 AND evaluado_id = $usuario_id
				 					  	 AND cargo_id = $cargo_id
				 					  	 AND ciclo_id = $ciclo_id
				 					  	 AND asignatura_id = $asi_id
									  	 AND proceso_id = $proceso
											 AND criterio_id = $criterio
							 				 AND tipo_id = 3";
		$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
		$fila_col = $colaborador_result->fetch_assoc();
		$verificador = $fila_col['resultado'] != NULL; // Si es distinto de null, hay un valor
		?>
		<table class="table">
			<thead>
					<tr>
						<th>Evaluador </th>
						<th>Peso opinante</th>
						<th>Porcentaje </th>
					</tr>
			</thead>
			<tbody>
				<?php
					echo "<tr>";
					echo "<td>Auto-Evaluación</td>";
					echo "<td>10%</td>";
					echo "<td>".$fila_autoeval['resultado']."%</td>";
					echo "</tr>";
					if ($verificador){
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>75%</td>";
						echo "<td>".$fila_sup['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Colaboradores</td>";
						echo "<td>15%</td>";
						echo "<td>".$fila_col['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15,2)."%</td>";
						echo "</tr>";
					}
					else {
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>90%</td>";
						echo "<td>".$fila_sup['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.9 ,2)."%</td>";
						echo "</tr>";
					}
				?>
			</tbody>
		</table>
		<?php }?>
	</div>
	<br>
	<?php }
	$resultado_autoeval2 = ROUND($resultado_autoeval2/$contador2,2);
	$resultado_superior2 = ROUND($resultado_superior2/$contador2,2);
	$resultado_colaborador2 = ROUND($resultado_colaborador2/$contador2,2);
	?>
</div>
	<?php
	include('footer.php');
	?>
	<script type="text/javascript">
	window.onload = function(){
		var competencias = <?php echo $comp_general ?>;
		var general = <?php echo $prom_general ?>;
		var ctx = document.getElementById("myChart");
		var myChart = new Chart(ctx, {
			type: 'bar',
			data: {
				labels: ["Competencias","General"],
				datasets: [{
						data: [competencias, general],
						backgroundColor: [
								'rgba(255, 14, 44, 0.5)',
								'rgba(255, 80, 0, 0.5)'
							],
							borderColor: [
								'rgba(255, 14, 44, 1)',
								'rgba(255, 80, 0, 1)'
							],
							borderWidth: 2
						}]
					},
					options: {
						legend: {
							fontColor:"black",
							fontSize: 18,
							display: false
						},
						scales: {
							yAxes: [{
								ticks: {
										fontColor: "black",
										beginAtZero:true,
										max: 140
									}
								}],
								xAxes: [{
									ticks: {
										fontColor: "black",
										beginAtZero:true
									}
								}]
							}
						}
		});
		var autoeval = <?php echo $resultado_autoeval2 ?>;
		var superior = <?php echo $resultado_superior2 ?>;
		var colaborador = <?php echo $resultado_colaborador2 ?>;
		if (colaborador != 0){
		var ctx2 = document.getElementById("myChart2");
		var myChart2 = new Chart(ctx2, {
		type: 'bar',
		data: {
		labels: ["General","Auto-Evaluación","Superior","Colaborador"],
		datasets: [{
				data: [competencias,autoeval,superior,colaborador],
				backgroundColor: [
						'rgba(129, 20, 112, 0.5)',
						'rgba(255, 99, 132, 0.5)',
						'rgba(54, 162, 235, 0.5)',
						'rgba(54, 50, 235, 0.5)'
				],
				borderColor: [
						'rgba(129, 20, 112, 1)',
						'rgba(255, 99, 132, 1)',
						'rgba(54, 162, 235, 1)',
						'rgba(54, 50, 235, 1)'
				],
				borderWidth: 2
		}]
		},
		options: {
			legend: {
				display: false
			},
			scales: {
					yAxes: [{
							ticks: {
									fontColor: "black",
									beginAtZero:true,
									max: 140
							}
					}],
					xAxes: [{
							ticks: {
								fontColor: "black",
								beginAtZero:true
							}
					}]
			}
		}
	});
	var nombres = <?php echo json_encode($comp_nombres) ?>;
	var nombres_arr = Object.keys(nombres).map(function (key) { return nombres[key]; });
	var autoeval = <?php echo json_encode($comp_autoeval) ?>;
	var autoeval_arr = Object.keys(autoeval).map(function (key) { return autoeval[key]; });
	var superior = <?php echo json_encode($comp_superior) ?>;
	var superior_arr = Object.keys(superior).map(function (key) { return superior[key]; });
	var colaborador = <?php echo json_encode($comp_colaborador) ?>;
	var colaborador_arr = Object.keys(colaborador).map(function (key) { return colaborador[key]; });
	var suma = <?php echo json_encode($comp_suma) ?>;
	var suma_arr = Object.keys(suma).map(function (key) { return suma[key]; });
	var ctx3 = document.getElementById("myChart3");
	var myChart3 = new Chart(ctx3, {
	type: 'bar',
	data: {
		labels: nombres_arr,
		datasets: [{
			label: "General",
			data: suma_arr,
			backgroundColor: 'rgba(129, 20, 112, 0.5)',
			borderColor: 'rgba(129, 20, 112, 1)',
			borderWidth: 2
			}, {
			label: "Auto-Evaluación",
			data: autoeval_arr,
			backgroundColor: 'rgba(255, 99, 132, 0.5)',
			borderColor: 'rgba(255, 99, 132, 1)',
			borderWidth: 2
			}, {
			label: "Superior",
			data: superior_arr,
			backgroundColor: 'rgba(54, 162, 235, 0.5)',
			borderColor: 'rgba(54, 162, 235, 1)',
			borderWidth: 2
			}, {
			label: "Colaborador",
			data: colaborador_arr,
			backgroundColor: 'rgba(54, 50, 235, 0.5)',
			backgroundColor: 'rgba(54, 50, 235, 1)',
			borderWidth: 2
			},
		]
	},
	options: {
		legend: {
			labels: {fontColor: "black"}
		},
		scales: {
				yAxes: [{
						ticks: {
								fontColor: "black",
								beginAtZero:true,
								max: 140
						}
				}],
				xAxes: [{
						ticks: {
							fontColor: "black",
							beginAtZero:true,
							autoSkip: false,
							maxRotation: 20,
							minRotation: 0
						}
				}]
		}
	}
	});
	}
	else {
	var autoeval = <?php echo $resultado_autoeval2 ?>;
	var superior = <?php echo $resultado_superior2 ?>;
	var ctx4 = document.getElementById("myChart4");
	var myChart4 = new Chart(ctx4, {
	type: 'bar',
	data: {
	labels: ["General","Auto-Evaluación","Superior"],
	datasets: [{
			data: [competencias,autoeval,superior],
			backgroundColor: [
					'rgba(129, 20, 112, 0.5)',
					'rgba(255, 99, 132, 0.5)',
					'rgba(54, 162, 235, 0.5)'
			],
			borderColor: [
					'rgba(129, 20, 112, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)'
			],
			borderWidth: 2
	}]
	},
	options: {
		legend: {
			display: false
		},
		scales: {
				yAxes: [{
						ticks: {
								fontColor: "black",
								beginAtZero:true,
								max:140
						}
				}],
				xAxes: [{
						ticks: {
							fontColor: "black",
							beginAtZero:true
						}
				}]
		}
	}
	});
	var nombres = <?php echo json_encode($comp_nombres) ?>;
	var nombres_arr = Object.keys(nombres).map(function (key) { return nombres[key]; });
	var autoeval = <?php echo json_encode($comp_autoeval) ?>;
	var autoeval_arr = Object.keys(autoeval).map(function (key) { return autoeval[key]; });
	var superior = <?php echo json_encode($comp_superior) ?>;
	var superior_arr = Object.keys(superior).map(function (key) { return superior[key]; });
	var suma = <?php echo json_encode($comp_suma) ?>;
	var suma_arr = Object.keys(suma).map(function (key) { return suma[key]; });
	var ctx5 = document.getElementById("myChart5");
	var myChart5 = new Chart(ctx5, {
	type: 'bar',
	data: {
		labels: nombres_arr,
		datasets: [{
			label: "General",
			data: suma_arr,
			backgroundColor: 'rgba(129, 20, 112, 0.5)',
			borderColor: 'rgba(129, 20, 112, 1)',
			borderWidth: 2
			}, {
			label: "Auto-Evaluación",
			data: autoeval_arr,
			backgroundColor: 'rgba(255, 99, 132, 0.5)',
			borderColor: 'rgba(255, 99, 132, 1)',
			borderWidth: 2
			}, {
			label: "Superior",
			data: superior_arr,
			backgroundColor: 'rgba(54, 162, 235, 0.5)',
			borderColor: 'rgba(54, 162, 235, 1)',
			borderWidth: 2
			},
		]
	},
	options: {
		legend: {
			labels: {fontColor: "black"}
		},
		scales: {
				yAxes: [{
						ticks: {
								fontColor: "black",
								beginAtZero:true,
								max:140
						}
				}],
				xAxes: [{
						ticks: {
							fontColor: "black",
							beginAtZero:true,
							autoSkip: false,
							maxRotation: 20,
							minRotation: 0
						}
				}]
		}
	}
	});
	}
		$("#pdf-btn").click(function() {
			var dataURL = document.getElementById("myChart").toDataURL("image/png");
			dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
			if (colaborador != 0){
				var dataURL2 = document.getElementById("myChart2").toDataURL("image/png");
				var dataURL3 = document.getElementById("myChart3").toDataURL("image/png");
				dataURL2.replace(/^data:image\/(png|jpg);base64,/, "");
				dataURL3.replace(/^data:image\/(png|jpg);base64,/, "");
				$.ajax({
					type: "POST",
					url: 'saveimage.php',
					data: {image1 : dataURL,
							 	 image2 : dataURL2,
								 image3 : dataURL3},
					success: function(respond){
						console.log(respond);
					}
					});
			}
			else {
				var dataURL4 = document.getElementById("myChart4").toDataURL("image/png");
				var dataURL5 = document.getElementById("myChart5").toDataURL("image/png");
				dataURL4.replace(/^data:image\/(png|jpg);base64,/, "");
				dataURL5.replace(/^data:image\/(png|jpg);base64,/, "");
				$.ajax({
					type: "POST",
					url: 'saveimage.php',
					data: {image1 : dataURL,
								 image2 : dataURL4,
								 image3 : dataURL5},
					success: function(respond){
						console.log(respond);
					}
					});
			}
		});
	};
	</script>
	<?php
}


// Caso ambas respuestas
else {
$respuesta_info = "SELECT comp_table.resultado as comp_result,
													 meta_table.resultado as meta_result,
													 ROUND (comp_table.resultado * 0.5 + meta_table.resultado * 0.5 , 2) as total_result
									 	FROM (SELECT ROUND(SUM(result) / COUNT(result), 2) as resultado
													FROM
														(SELECT evaluador_id, ROUND(SUM(valores.valor * (ponderacion/100.0)),2) as result
														 FROM evaluaciones_ind, resultados_ind, indicadores, valores
														 WHERE evaluaciones_ind.id = evaluacion_id
														 AND respuesta = valores.id
														 AND evaluado_id = $usuario_id
														 AND cargo_id = $cargo_id
														 AND ciclo_id = $ciclo_id
														 AND asignatura_id = $asi_id
														 AND indicadores.id = indicador_id
														 GROUP BY evaluador_id
													 	 ) as por_evaluador
												 ) as meta_table,
												 (SELECT ROUND(SUM(resultado) / COUNT(resultado),2) as resultado
												 		FROM (SELECT competencia_id, ROUND(SUM(tabla.resultado * (ponderacion / 100.0)),2) as resultado
														 			  FROM (SELECT competencia_id, tipo_id, SUM(res_previo)/COUNT(res_previo) as resultado
																						FROM (SELECT evaluador_id, competencia_id, tipo_id,
																												 ROUND(SUM(valores.valor * (ponderacion/100.0)),2) as res_previo
																										FROM evaluaciones_comp, resultados_comp, criterios, valores
																									 WHERE evaluaciones_comp.id = evaluacion_id
																									 	 AND respuesta = valores.id
																										 AND evaluado_id = $usuario_id
																										 AND cargo_id = $cargo_id
																										 AND ciclo_id = $ciclo_id
																										 AND asignatura_id = $asi_id
																										 AND criterios.id = criterio_id
																										 GROUP BY evaluador_id, competencia_id, tipo_id
																									 	 ) as por_evaluador,
																									 	      ponderacion_tipo
																					 WHERE ponderacion_tipo.id = tipo_id
																			  GROUP BY competencia_id, tipo_id
																							 ) as tabla, ponderacion_tipo
																		  WHERE ponderacion_tipo.id = tipo_id
																   GROUP BY competencia_id) as tablita) as comp_table";
$respuesta_result = $conn->query($respuesta_info) or die("database error:". $conn->error);
$resultado = $respuesta_result->fetch_assoc();
$comp_general = $resultado['comp_result'];
$meta_general = $resultado['meta_result'];
$prom_general = $resultado['total_result'];
// Tabla con resultados generales ?>
<div class="table-responsive">
	<table class="table">
		<thead>
      <tr>
				<th style="background-color:rgba(255, 255, 0 ,0.8)">Resultado Metas (50%)</th>
        <th style="background-color:rgba(255, 14, 44 ,0.8)">Resultado Competencias (50%)</th>
				<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
      </tr>
    </thead>
		<tbody style="text-align:center">
			<?php
					echo "<tr>";
					echo "<td id='meta' value='".$meta_general."'>". $meta_general."%</td>";
					echo "<td id='comp' value='".$comp_general."'>". $comp_general."%</td>";
					echo "<td id='gen' value='".$prom_general."'>". $prom_general."%</td>";
					echo "</tr>";
			?>
  	</tbody>
	</table>
	<br>
	<canvas id="myChart" width="10" height="3"></canvas>
	<br><br>
</div>
<?php
// Tabla con resultados generales de Metas ?>
	<div class="table-responsive">
		<h3> Metas del Cargo: <?php echo $cargo ?> </h3>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th> Valor </th>
					<th> Porcentaje </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> No Cumplido </td>
					<td> 33 % </td>
				</tr>
				<tr>
					<td> Mínimo </td>
					<td> 67 % </td>
				</tr>
				<tr>
					<td> Esperado </td>
					<td> 100 % </td>
				</tr>
				<tr>
					<td> Sobre lo esperado </td>
					<td> 133 % </td>
				</tr>
			</tbody>
		</table>
		<br>
		<?php
			// Metas
			$meta = "SELECT DISTINCT metas.descripcion as meta_desc,
															 metas.id as id
						 							FROM evaluaciones_ind, metas
								 				 WHERE metas.id = evaluaciones_ind.meta_id
								 			     AND evaluado_id = $usuario_id
 								 			 		 AND cargo_id = $cargo_id
								 				   AND ciclo_id = $ciclo_id
								 				   AND asignatura_id = $asi_id
								 				   AND proceso_id = $proceso
											ORDER BY id";
			$meta_result = $conn->query($meta) or die("database error:". $conn->error);
			$total = 0;
			while($fila_meta = $meta_result->fetch_assoc()){
				$meta = $fila_meta['id'];
				$meta_desc = $fila_meta['meta_desc'];
				$indicador = "SELECT indicadores.id as id,
					                   descripcion, no_cumplido,
														 minimo, esperado,
														 sobre_esperado, ponderacion
												FROM indicadores, indicador_cargos
											 WHERE indicadores.meta_id = $meta
											 	 AND indicador_cargos.cargo_id = $cargo_id
												 AND indicador_cargos.indicador_id = indicadores.id";
				$indicador_result = $conn->query($indicador) or die ("database error:". $conn->error);?>
				<div class="table-responsive">
				<h4 class="meta"><?php echo "Meta N°".$meta." : ".$meta_desc; ?></h4>
				<table class="table">
					<thead>
						<tr>
							<th>Indicador</th>
							<th>No Cumplido</th>
							<th>Mínimo</th>
							<th>Esperado </th>
			        <th>Sobre lo esperado</th>
							<th>Ponderación</th>
							<th>Cumplimiento</th>
						</tr>
					</thead>
					<tbody>
				<?php
				while ($fila_indicador = $indicador_result->fetch_assoc()){
					$indicador = $fila_indicador["id"];
					$ponderacion = $fila_indicador['ponderacion'];
					$evaluacion = "SELECT ROUND(SUM(valor)/COUNT(valor),2) as resultado
					  							 FROM resultados_ind, evaluaciones_ind, valores
													WHERE resultados_ind.evaluacion_id = evaluaciones_ind.id
													  AND resultados_ind.respuesta = valores.id
													  AND evaluado_id = $usuario_id
								 					  AND cargo_id = $cargo_id
								 					  AND ciclo_id = $ciclo_id
														AND asignatura_id = $asi_id
													  AND proceso_id = $proceso
														AND indicador_id = $indicador";
					$evaluacion_result = $conn->query($evaluacion) or die("database error:". $conn->error);
					$fila_evaluacion = $evaluacion_result->fetch_assoc();
					echo "<tr>";
					echo "<td>".$fila_indicador['descripcion']."</td>";
					echo "<td>".$fila_indicador['no_cumplido']."</td>";
					echo "<td>".$fila_indicador['minimo']."</td>";
					echo "<td>".$fila_indicador['esperado']."</td>";
					echo "<td>".$fila_indicador['sobre_esperado']."</td>";
					echo "<td>".$ponderacion."%</td>";
					echo "<td>".$fila_evaluacion['resultado']."%</td>";
					echo "</tr>";
					$total += $fila_evaluacion['resultado'] * ($ponderacion / 100.0);
					}
					echo "</tbody>";
					echo "</table>";
				}
				?>
				<h3 class="total"> Total: <?php echo ROUND($total,2); ?> %</h3>
			</div>
		<br><br><br><br>
		<h3> Competencias del Perfil: <?php echo $perfil; ?></h3>
		<br>
		<table class="table">
			<thead>
				<tr>
					<th> Leyenda </th>
					<th> Nivel </th>
					<th> Porcentaje (%)</th>
					<th> Rango de Evaluación </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> Mínimo </td>
					<td> 1 </td>
					<td> 33.33 % </td>
					<td> 0 - 33.33 %</td>
				</tr>
				<tr>
					<td> En Desarrollo </td>
					<td> 2 </td>
					<td> 66.66 % </td>
					<td> 33.34 - 66.66 %</td>
				</tr>
				<tr>
					<td> Desarrollado </td>
					<td> 3 </td>
					<td> 99.99 % </td>
					<td> 66.67 - 99.99 %</td>
				</tr>
				<tr>
					<td> Destacado </td>
					<td> 4 </td>
					<td> 133.32 % </td>
					<td> 100 - 133.32 %</td>
				</tr>
				<tr>
					<td></td>
					<td> Nivel esperado </td>
					<td> 3 </td>
					<td></td>
				</tr>
			</tbody>
		</table>
	</div>
	<?php
	$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
										FROM resultados_comp, evaluaciones_comp, valores
									 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
										 AND resultados_comp.respuesta = valores.id
										 AND evaluado_id = $usuario_id
										 AND cargo_id = $cargo_id
										 AND ciclo_id = $ciclo_id
										 AND asignatura_id = $asi_id
										 AND proceso_id = $proceso
										 AND tipo_id = 3";
	$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
	$fila_col = $colaborador_result->fetch_assoc();
	$verificador = ($fila_col['resultado'] != NULL); // Si es distinto de null, hay un valor
	if ($verificador){ ?>
		<canvas id="myChart2" width="10" height="3"></canvas>
		<br><br>
		<canvas id="myChart3" width="12" height="5"></canvas>
	<?php
	}
	else { ?>
		<canvas id="myChart4" width="10" height="3"></canvas>
		<br><br>
		<canvas id="myChart5" width="12" height="5"></canvas>
	<?php
	}
	// Competencias
	// Necesito una constante de array para guardar las competencias
	$comp_array = new ArrayObject();
	$comp_nombres = new ArrayObject();
	$comp_autoeval = new ArrayObject();
	$comp_superior = new ArrayObject();
	$comp_colaborador = new ArrayObject();
	$comp_suma = new ArrayObject();
	// $comp_array[x][0] -> entrega las ids
	// $comp_array[x][1] -> entrega los nombres
	// $comp_array[x][2] -> entrega autoeval
	// $comp_array[x][3] -> entrega superior
	// $comp_array[x][4] -> entrega colaborador
	// $comp_array[x][5] -> entrega general
	$comp = "SELECT DISTINCT competencia_id, competencias.nombre as nombre
											FROM evaluaciones_comp, competencias
											WHERE proceso_id = $proceso
											AND evaluado_id = $usuario_id
											AND cargo_id = $cargo_id
											AND ciclo_id = $ciclo_id
											AND asignatura_id = $asi_id
											AND competencias.id = competencia_id";
	$comp_result = $conn->query($comp) or die("database error:". $conn->error);
	$resultado_autoeval2 = 0;
	$resultado_superior2 = 0;
	$resultado_colaborador2 = 0;
	$contador2 = 0;
	while($fila_comp = $comp_result->fetch_assoc()){
		$competencia_id = $fila_comp['competencia_id'];
		$competencia_nombre = $fila_comp['nombre'];
		$crit = "SELECT criterios.id as id,
										ponderacion
							 FROM comp_crit, criterios
							WHERE comp_crit.competencia_id = $competencia_id
								AND comp_crit.criterio_id = criterios.id
					 ORDER BY id";
		$crit_result = $conn->query($crit) or die ("database error:". $conn->error);
		$resultado_competencia = 0;
		$resultado_autoeval = 0;
		$resultado_superior = 0;
		$resultado_colaborador = 0;
		$contador = 0;
		$resultado_competencia2 = 0;
		while ($fila_crit = $crit_result->fetch_assoc()){
			$criterio = $fila_crit["id"];
			$ponderacion = $fila_crit['ponderacion'];
			// Resultados por tipo encuesta
			$autoeval = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
										AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 1";
		$autoeval_result = $conn->query($autoeval) or die("database error:". $conn->error);
		$fila_autoeval = $autoeval_result->fetch_assoc();
		$autoeval2 = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
								 FROM resultados_comp, evaluaciones_comp, valores
								WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									AND resultados_comp.respuesta = valores.id
									AND evaluado_id = $usuario_id
									AND cargo_id = $cargo_id
									AND ciclo_id = $ciclo_id
									AND asignatura_id = $asi_id
									AND proceso_id = $proceso
									AND criterio_id = $criterio
									AND tipo_id = 1";
	$autoeval2_result = $conn->query($autoeval2) or die("database error:". $conn->error);
	$fila_autoeval2 = $autoeval2_result->fetch_assoc();
		$superior = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
				 					  AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 2";
		$superior_result = $conn->query($superior) or die("database error:". $conn->error);
		$fila_sup = $superior_result->fetch_assoc();
		$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									    FROM resultados_comp, evaluaciones_comp, valores
										 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  	 AND resultados_comp.respuesta = valores.id
									  	 AND evaluado_id = $usuario_id
				 					  	 AND cargo_id = $cargo_id
				 					  	 AND ciclo_id = $ciclo_id
				 					  	 AND asignatura_id = $asi_id
									  	 AND proceso_id = $proceso
											 AND criterio_id = $criterio
							 				 AND tipo_id = 3";
		$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
		$fila_col = $colaborador_result->fetch_assoc();
		$verificador = ($fila_col['resultado'] != NULL); // Si es distinto de null, hay un valor
		if ($verificador){
			$resultado_autoeval += $fila_autoeval['resultado'];
			$resultado_superior += $fila_sup['resultado'];
			$resultado_colaborador += $fila_col['resultado'];
			//$resultado_competencia += ROUND(($fila_autoeval['resultado'] * 0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15)*$ponderacion,2);
		}
		else {
			$resultado_autoeval += $fila_autoeval['resultado'];
			$resultado_superior += $fila_sup['resultado'];
			//$resultado_competencia += ROUND(($fila_autoeval['resultado'] * 0.1 + $fila_sup['resultado'] * 0.90)*$ponderacion,2);
		}
		$contador += 1;
		}
		$contador2 +=1;
		$resultado_autoeval = ROUND($resultado_autoeval/$contador,2);
		$resultado_autoeval2 += $resultado_autoeval;
		$resultado_superior = ROUND($resultado_superior/$contador,2);
		$resultado_superior2 += $resultado_superior;
		$resultado_colaborador = ROUND($resultado_colaborador/$contador,2);
		$resultado_colaborador2 += $resultado_colaborador;
		if ($verificador){
				$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.75 + $resultado_colaborador * 0.15,2);
				$comp_array->append(array($competencia_id,$competencia_nombre,$resultado_autoeval,$resultado_superior,$resultado_colaborador,$resultado_competencia));
				$comp_nombres->append($competencia_nombre);
				$comp_autoeval->append($resultado_autoeval);
				$comp_superior->append($resultado_superior);
				$comp_colaborador->append($resultado_colaborador);
				$comp_suma->append($resultado_competencia);
		}
		else {
			$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.9,2);
			$comp_array->append(array($competencia_id,$competencia_nombre,$resultado_autoeval,$resultado_superior,0,$resultado_competencia));
			$comp_nombres->append($competencia_nombre);
			$comp_autoeval->append($resultado_autoeval);
			$comp_superior->append($resultado_superior);
			$comp_colaborador->append($resultado_colaborador);
			$comp_suma->append($resultado_competencia);
		}
		?>
		<table class="table table-condensed">
			<h4 class="comp"> <?php echo "Competencia N°".$competencia_id." : ".$competencia_nombre?> </h4>
			<thead>
					<tr>
						<th>Evaluador </th>
						<th>Peso opinante</th>
						<th>Porcentaje </th>
						<th>Nivel </th>
					</tr>
			</thead>
			<tbody>
				<tr>
					<?php
					echo "<tr>";
					echo "<td>Auto-Evaluación</td>";
					echo "<td>10%</td>";
					echo "<td>".$resultado_autoeval."%</td>";
					if ($resultado_autoeval <= 33.33) { echo "<td>1</td>";}
					elseif ($resultado_autoeval <= 66.66) { echo "<td>2</td>";}
					elseif ($resultado_autoeval <= 99.99) { echo "<td>3</td>";}
					else { echo "<td>4</td>";}
					echo "</tr>";
					if ($verificador){
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>75%</td>";
						echo "<td>".$resultado_superior."%</td>";
						if ($resultado_superior <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_superior <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_superior <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
						echo "<tr>";
						echo "<td>Colaboradores</td>";
						echo "<td>15%</td>";
						echo "<td>".$resultado_colaborador."%</td>";
						if ($resultado_colaborador <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_colaborador <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_colaborador <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".$resultado_competencia."%</td>";
						if ($resultado_competencia <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_competencia <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_competencia <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
					}
					else {
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>90%</td>";
						echo "<td>".$resultado_superior."%</td>";
						if ($resultado_superior <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_superior <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_superior <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>";}
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".$resultado_competencia."%</td>";
						if ($resultado_competencia <= 33.33) { echo "<td>1</td>";}
						elseif ($resultado_competencia <= 66.66) { echo "<td>2</td>";}
						elseif ($resultado_competencia <= 99.99) { echo "<td>3</td>";}
						else { echo "<td>4</td>"; }
						echo "</tr>";
					}
					?>
				</tr>
			</tbody>
		</table>
		<br>
	<div class="table-responsive">
		<?php
		// Criterios
		$crit = "SELECT criterios.descripcion as descr,
										criterios.id as id,
										ponderacion
							 FROM comp_crit, criterios
							WHERE comp_crit.competencia_id = $competencia_id
								AND comp_crit.criterio_id = criterios.id
					 ORDER BY id";
		$crit_result = $conn->query($crit) or die ("database error:". $conn->error);
		while ($fila_crit = $crit_result->fetch_assoc()){
			$criterio = $fila_crit["id"];?>
		<table class="table">
			<thead>
				<tr>
					<th>Criterio N°<?php echo $fila_crit["id"]?></th>
					<th>Ponderación </th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td> <?php echo $fila_crit["descr"]?></td>
					<td> <?php echo $fila_crit["ponderacion"] ?>%</td>
				<tr>
			</tbody>
		</table>
		<?php
		// Resultados por tipo encuesta
		$autoeval = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
										AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 1";
		$autoeval_result = $conn->query($autoeval) or die("database error:". $conn->error);
		$fila_autoeval = $autoeval_result->fetch_assoc();
		$superior = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									 FROM resultados_comp, evaluaciones_comp, valores
									WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  AND resultados_comp.respuesta = valores.id
									  AND evaluado_id = $usuario_id
				 					  AND cargo_id = $cargo_id
				 					  AND ciclo_id = $ciclo_id
				 					  AND asignatura_id = $asi_id
									  AND proceso_id = $proceso
										AND criterio_id = $criterio
							 			AND tipo_id = 2";
		$superior_result = $conn->query($superior) or die("database error:". $conn->error);
		$fila_sup = $superior_result->fetch_assoc();
		$colaborador = "SELECT ROUND(SUM(valor) / COUNT(valor),2) as resultado
									    FROM resultados_comp, evaluaciones_comp, valores
										 WHERE resultados_comp.evaluacion_id = evaluaciones_comp.id
									  	 AND resultados_comp.respuesta = valores.id
									  	 AND evaluado_id = $usuario_id
				 					  	 AND cargo_id = $cargo_id
				 					  	 AND ciclo_id = $ciclo_id
				 					  	 AND asignatura_id = $asi_id
									  	 AND proceso_id = $proceso
											 AND criterio_id = $criterio
							 				 AND tipo_id = 3";
		$colaborador_result = $conn->query($colaborador) or die("database error:". $conn->error);
		$fila_col = $colaborador_result->fetch_assoc();
		$verificador = $fila_col['resultado'] != NULL; // Si es distinto de null, hay un valor
		?>
		<table class="table">
			<thead>
					<tr>
						<th>Evaluador </th>
						<th>Peso opinante</th>
						<th>Porcentaje </th>
					</tr>
			</thead>
			<tbody>
				<?php
					echo "<tr>";
					echo "<td>Auto-Evaluación</td>";
					echo "<td>10%</td>";
					echo "<td>".$fila_autoeval['resultado']."%</td>";
					echo "</tr>";
					if ($verificador){
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>75%</td>";
						echo "<td>".$fila_sup['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Colaboradores</td>";
						echo "<td>15%</td>";
						echo "<td>".$fila_col['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15,2)."%</td>";
						echo "</tr>";
					}
					else {
						echo "<tr>";
						echo "<td>Superior</td>";
						echo "<td>90%</td>";
						echo "<td>".$fila_sup['resultado']."%</td>";
						echo "</tr>";
						echo "<tr>";
						echo "<td>Total</td>";
						echo "<td>100%</td>";
						echo "<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.9 ,2)."%</td>";
						echo "</tr>";
					}
				?>
			</tbody>
		</table>
		<?php }?>
	</div>
	<br>
	<?php }
	$resultado_autoeval2 = ROUND($resultado_autoeval2/$contador2,2);
	$resultado_superior2 = ROUND($resultado_superior2/$contador2,2);
	$resultado_colaborador2 = ROUND($resultado_colaborador2/$contador2,2);
	?>
</div>
<?php
include('footer.php');
}
?>
<script type="text/javascript">
window.onload = function(){
	var competencias = <?php echo $comp_general ?>;
	var metas = <?php echo $meta_general ?>;
	var general = <?php echo $prom_general ?>;
	var ctx = document.getElementById("myChart");
	var myChart = new Chart(ctx, {
	type: 'bar',
	data: {
			labels: ["Metas","Competencias","General"],
			datasets: [{
					data: [metas, competencias, general],
					backgroundColor: [
							'rgba(255, 255, 0, 0.5)',
							'rgba(255, 14, 44, 0.5)',
							'rgba(255, 80, 0, 0.5)'
					],
					borderColor: [
						'rgba(255, 255, 0, 1)',
						'rgba(255, 14, 44, 1)',
						'rgba(255, 80, 0, 1)'
					],
					borderWidth: 2
			}]
	},
	options: {
			legend: {
				fontColor:"black",
				fontSize: 18,
				display: false
			},
			scales: {
					yAxes: [{
							ticks: {
									fontColor: "black",
									beginAtZero:true,
									max:140
							}
					}],
					xAxes: [{
							ticks: {
								fontColor: "black",
								beginAtZero:true
							}
					}]
			}
	}
});
	var autoeval = <?php echo $resultado_autoeval2 ?>;
	var superior = <?php echo $resultado_superior2 ?>;
	var colaborador = <?php echo $resultado_colaborador2 ?>;
	if (colaborador != 0) {
	var ctx2 = document.getElementById("myChart2");
	var myChart2 = new Chart(ctx2, {
	type: 'bar',
	data: {
	labels: ["General","Auto-Evaluación","Superior","Colaborador"],
	datasets: [{
			data: [competencias,autoeval,superior,colaborador],
			backgroundColor: [
					'rgba(129, 20, 112, 0.5)',
					'rgba(255, 99, 132, 0.5)',
					'rgba(54, 162, 235, 0.5)',
					'rgba(54, 50, 235, 0.5)'
			],
			borderColor: [
					'rgba(129, 20, 112, 1)',
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(54, 50, 235, 1)'
			],
			borderWidth: 2
	}]
	},
	options: {
		legend: {
			display: false
		},
		scales: {
				yAxes: [{
						ticks: {
								fontColor: "black",
								beginAtZero:true,
								max:140
						}
				}],
				xAxes: [{
						ticks: {
							fontColor: "black",
							beginAtZero:true
						}
				}]
		}
	}
});
var nombres = <?php echo json_encode($comp_nombres) ?>;
var nombres_arr = Object.keys(nombres).map(function (key) { return nombres[key]; });
var autoeval = <?php echo json_encode($comp_autoeval) ?>;
var autoeval_arr = Object.keys(autoeval).map(function (key) { return autoeval[key]; });
var superior = <?php echo json_encode($comp_superior) ?>;
var superior_arr = Object.keys(superior).map(function (key) { return superior[key]; });
var colaborador = <?php echo json_encode($comp_colaborador) ?>;
var colaborador_arr = Object.keys(colaborador).map(function (key) { return colaborador[key]; });
var suma = <?php echo json_encode($comp_suma) ?>;
var suma_arr = Object.keys(suma).map(function (key) { return suma[key]; });
var ctx3 = document.getElementById("myChart3");
var myChart3 = new Chart(ctx3, {
type: 'bar',
data: {
	labels: nombres_arr,
	datasets: [{
		label: "General",
		data: suma_arr,
		backgroundColor: 'rgba(129, 20, 112, 0.5)',
		borderColor: 'rgba(129, 20, 112, 1)',
		borderWidth: 2
		}, {
		label: "Auto-Evaluación",
		data: autoeval_arr,
		backgroundColor: 'rgba(255, 99, 132, 0.5)',
		borderColor: 'rgba(255, 99, 132, 1)',
		borderWidth: 2
		}, {
		label: "Superior",
		data: superior_arr,
		backgroundColor: 'rgba(54, 162, 235, 0.5)',
		borderColor: 'rgba(54, 162, 235, 1)',
		borderWidth: 2
		}, {
		label: "Colaborador",
		data: colaborador_arr,
		backgroundColor: 'rgba(54, 50, 235, 0.5)',
		backgroundColor: 'rgba(54, 50, 235, 1)',
		borderWidth: 2
		},
	]
},
options: {
	legend: {
		labels: {fontColor: "black"}
	},
	scales: {
			yAxes: [{
					ticks: {
							fontColor: "black",
							beginAtZero:true,
							max:140
					}
			}],
			xAxes: [{
					ticks: {
						fontColor: "black",
						beginAtZero:true,
						autoSkip: false,
						maxRotation: 20,
						minRotation: 0
					}
			}]
	}
}
});
}
else {
var autoeval = <?php echo $resultado_autoeval2 ?>;
var superior = <?php echo $resultado_superior2 ?>;
var ctx4 = document.getElementById("myChart4");
var myChart4 = new Chart(ctx4, {
type: 'bar',
data: {
labels: ["General","Auto-Evaluación","Superior"],
datasets: [{
		data: [competencias,autoeval,superior],
		backgroundColor: [
				'rgba(129, 20, 112, 0.5)',
				'rgba(255, 99, 132, 0.5)',
				'rgba(54, 162, 235, 0.5)'
		],
		borderColor: [
				'rgba(129, 20, 112, 1)',
				'rgba(255, 99, 132, 1)',
				'rgba(54, 162, 235, 1)'
		],
		borderWidth: 2
}]
},
options: {
	legend: {
		display: false
	},
	scales: {
			yAxes: [{
					ticks: {
							fontColor: "black",
							beginAtZero:true,
							max:140
					}
			}],
			xAxes: [{
					ticks: {
						fontColor: "black",
						beginAtZero:true
					}
			}]
	}
}
});
var nombres = <?php echo json_encode($comp_nombres) ?>;
var nombres_arr = Object.keys(nombres).map(function (key) { return nombres[key]; });
var autoeval = <?php echo json_encode($comp_autoeval) ?>;
var autoeval_arr = Object.keys(autoeval).map(function (key) { return autoeval[key]; });
var superior = <?php echo json_encode($comp_superior) ?>;
var superior_arr = Object.keys(superior).map(function (key) { return superior[key]; });
var suma = <?php echo json_encode($comp_suma) ?>;
var suma_arr = Object.keys(suma).map(function (key) { return suma[key]; });
var ctx5 = document.getElementById("myChart5");
var myChart5 = new Chart(ctx5, {
type: 'bar',
data: {
	labels: nombres_arr,
	datasets: [{
		label: "General",
		data: suma_arr,
		backgroundColor: 'rgba(129, 20, 112, 0.5)',
		borderColor: 'rgba(129, 20, 112, 1)',
		borderWidth: 2
		}, {
		label: "Auto-Evaluación",
		data: autoeval_arr,
		backgroundColor: 'rgba(255, 99, 132, 0.5)',
		borderColor: 'rgba(255, 99, 132, 1)',
		borderWidth: 2
		}, {
		label: "Superior",
		data: superior_arr,
		backgroundColor: 'rgba(54, 162, 235, 0.5)',
		borderColor: 'rgba(54, 162, 235, 1)',
		borderWidth: 2
		},
	]
},
options: {
	legend: {
		labels: {fontColor: "black"}
	},
	scales: {
			yAxes: [{
					ticks: {
							fontColor: "black",
							beginAtZero:true,
							max:140
					}
			}],
			xAxes: [{
					ticks: {
						fontColor: "black",
						beginAtZero:true,
						autoSkip: false,
						maxRotation: 20,
						minRotation: 0
					}
			}]
	}
}
});
}
	$("#pdf-btn").click(function() {
		var dataURL = document.getElementById("myChart").toDataURL("image/png");
		dataURL.replace(/^data:image\/(png|jpg);base64,/, "");
		if (colaborador != 0){
			var dataURL2 = document.getElementById("myChart2").toDataURL("image/png");
			var dataURL3 = document.getElementById("myChart3").toDataURL("image/png");
			dataURL2.replace(/^data:image\/(png|jpg);base64,/, "");
			dataURL3.replace(/^data:image\/(png|jpg);base64,/, "");
			$.ajax({
				type: "POST",
				url: 'saveimage.php',
				data: {image1 : dataURL,
							 image2 : dataURL2,
							 image3 : dataURL3},
				success: function(respond){
					console.log(respond);
				}
				});
		}
		else {
			var dataURL4 = document.getElementById("myChart4").toDataURL("image/png");
			var dataURL5 = document.getElementById("myChart5").toDataURL("image/png");
			dataURL4.replace(/^data:image\/(png|jpg);base64,/, "");
			dataURL5.replace(/^data:image\/(png|jpg);base64,/, "");
			$.ajax({
				type: "POST",
				url: 'saveimage.php',
				data: {image1 : dataURL,
							 image2 : dataURL4,
							 image3 : dataURL5},
				success: function(respond){
					console.log(respond);
				}
				});
		}
	});
};
</script>
