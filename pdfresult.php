<?php ob_start();
session_start();
// Chequear que sea el admin (agregar aquí id's autorizadas)
if($_SESSION['id']!=1){
	header("Location: index.php");
}
// Chequear que esté dentro de un proceso
if(!isset($_SESSION['proceso_id'])){
	header("Location: welcome.php");
}
include_once("db_connect.php");
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
$img = $_SESSION['image1'];
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
$nombre = $resultado['nombre'];
$apellido = $resultado['apellido'];
$cargo = $resultado['cargo'];
$perfil = $resultado['perfil'];
// Tabla información de usuario ?>
<?php
// $html guarda informe en html
$html="";
$html.='<link rel="stylesheet" media="screen" href="bootstrap-3.3.7-dist/css/bootstrap.min.css">'; // VER QUE HACER CON BOOTSTRAP
$html.='<link href="css/styleprint.css" rel="stylesheet" type="text/css" media="screen">';
$html.="<h1>Informe: </h1><br><h2>";
$html.=$nombre." ".$apellido." - ".$cargo;
$html.="</h2><p class='saltodepagina'/>";
$html.='<div class="table-responsive">
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
        <tr>
          <td>'. $resultado['nombre'] . '</td>
				  <td>' . $resultado['apellido'] . '</td>
				  <td>' . $resultado['cargo'] . '</td>
				  <td>' . $resultado['ciclo'] . '</td>
				  <td>' . $resultado['asignatura'] . '</td>
				</tr>
			</tbody>
	</table>
</div>';
// CONDICIONES
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


// Caso sin Evaluaciones
if ($respind_row['res'] == 0 && $respcomp_row['res'] == 0){
	$html.='<h3>No se enviaron respuestas para el evaluado</h3>';
	$html.="</body>
					</html>";
}


// Caso solo Indicadores
else if ($respcomp_row['res'] == 0) {
	$html.='<h3>Solo hay respuestas de indicadores (o no tiene evaluaciones de competencias)</h3><br>';
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
	$html.='
		<table class="table">
			<thead>
	      <tr>
					<th style="background-color:rgba(255, 255, 0 ,0.8)">Resultado Metas (100%)</th>
					<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
	      </tr>
	    </thead>
			<tbody style="text-align:center">
						<tr>
						<td id="meta">'. $meta_general.'%</td>
						<td id="gen">'. $prom_general.'%</td>
						</tr>
	  	</tbody>
		</table>
		<br>';
	if (isset($_SESSION['image1'])){
		//$img = base64_decode($img);
		$html.='<img width=740 src='.$img.' /><br><br><br>';;
	}
	// Tabla con resultados generales de Metas
	$html.='
				<h3> Metas del Cargo: '.$cargo.'</h3>
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
				<br><br>';
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
						$indicador_result = $conn->query($indicador) or die ("database error:". $conn->error);
						$html.='<div class="table-responsive">
						<h4 class="meta"> Meta N°'.$meta." ".$meta_desc.'</h4><br>';
						$html.='<table class="table">
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
							<tbody>';
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
							$html.='
								<tr>
								<td class="chica">'.$fila_indicador['descripcion'].'</td>
								<td class="chica">'.$fila_indicador['no_cumplido'].'</td>
								<td class="chica">'.$fila_indicador['minimo'].'</td>
								<td class="chica">'.$fila_indicador['esperado'].'</td>
								<td class="chica">'.$fila_indicador['sobre_esperado'].'</td>
								<td>'.$ponderacion.'%</td>
								<td>'.$fila_evaluacion['resultado'].'%</td>
								</tr>';
							//$html.='</div><p class="saltodepagina"/>';
							$total += $fila_evaluacion['resultado'] * ($ponderacion / 100.0);
							}
							$html.='</tbody></table>';
						}
						$html.='<h3 class="total"> Total: '.ROUND($total,2).' %</h3>';
						$html.='<br><br><br><br><br>';
						$html.='<input type="text" class="signature"/>';
						$html.='<span>firma</span>';
						$html.="</body>
										</html>";
}


// Caso solo Competencias
else if ($respind_row['res'] == 0) {
	$img2 = $_SESSION['image2'];
	$img3 = $_SESSION['image3'];
	$html.='<h3>Solo hay respuestas de competencias (o no tiene evaluaciones de indicadores)</h3><br>';
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
	$respuesta_result = $conn->query($respuesta) or die("database error:". $conn->error);
	$resultado = $respuesta_result->fetch_assoc();
	$comp_general = $resultado['resultado'];
	$prom_general = $resultado['resultado'];
	// Tabla con resultados generales
	$html.='
		<div class="table-responsive">
		<table class="table">
			<thead>
	      <tr>
	        <th style="background-color:rgba(255, 14, 44 ,0.8)">Resultado Competencias (100%)</th>
					<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
	      </tr>
	    </thead>
			<tbody style="text-align:center">
						<tr>
						<td id="comp">'. $comp_general.'%</td>
						<td id="gen">'. $prom_general.'%</td>
						</tr>
	  	</tbody>
		</table>
		</div>
		<br>';
		if (isset($_SESSION['image1'])){
			//$img = base64_decode($img);
			$html.='<img width=740 src='.$img.' /><p class="saltodepagina"/>';;
		}
		$html.='
		<h3> Competencias del Perfil: '.$perfil.'</h3>
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
		</table>';
	if (isset($_SESSION['image2'])){
		//$img = base64_decode($img);
		$html.='<img width=740 src='.$img2.'/><br><br><br>';;
	}
	if (isset($_SESSION['image3'])){
		//$img = base64_decode($img);
		$html.='<img width=740 src='.$img3.' /><br><br>';;
	}
	// Competencias
	$comp = "SELECT DISTINCT competencia_id, competencias.nombre as nombre
											FROM evaluaciones_comp, competencias
											WHERE proceso_id = $proceso
											AND evaluado_id = $usuario_id
											AND cargo_id = $cargo_id
											AND ciclo_id = $ciclo_id
											AND asignatura_id = $asi_id
											AND competencias.id = competencia_id
								 ORDER BY competencia_id";
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
		}
		else {
			$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.9,2);
		}
		$html.='<h4 class="comp"> Competencia N°'.$competencia_id.' : '.$competencia_nombre.'</h4>';
		$html.='
			<table class="table table-condensed">
			<thead>
					<tr>
						<th class="resumen">Evaluador </th>
						<th class="resumen">Peso opinante</th>
						<th class="resumen">Porcentaje </th>
						<th class="resumen">Nivel </th>
					</tr>
			</thead>
			<tbody>
					<tr>
					<td>Auto-Evaluación</td>
					<td>10%</td>
					<td>'.$resultado_autoeval.'%</td>';
					if ($resultado_autoeval <= 33.33) { $html.='<td>1</td>';}
					elseif ($resultado_autoeval <= 66.66) { $html.='<td>2</td>';}
					elseif ($resultado_autoeval <= 99.99) { $html.='<td>3</td>';}
					else { $html.='<td>4</td>';}
					$html.='</tr>';
					if ($verificador){
						$html.='<tr>
						<td>Superior</td>
						<td>75%</td>
						<td>'.$resultado_superior.'%</td>';
						if ($resultado_superior <= 33.33) { $html.='<td>1</td>';}
						elseif ($resultado_superior <= 66.66) { $html.='<td>2</td>';}
						elseif ($resultado_superior <= 99.99) { $html.='<td>3</td>';}
						else { $html.='<td>4</td>';}
						$html.='</tr>
						<tr>
						<td>Colaboradores</td>
						<td>15%</td>
						<td>'.$resultado_colaborador.'%</td>';
						if ($resultado_colaborador <= 33.33) { $html.='<td>1</td>';}
						elseif ($resultado_colaborador <= 66.66) { $html.='<td>2</td>';}
						elseif ($resultado_colaborador <= 99.99) { $html.='<td>3</td>';}
						else { $html.='<td>4</td>';}
						$html.='</tr><tr>
						<td>Total</td>
						<td>100%</td>
						<td>'.$resultado_competencia.'%</td>';
						if ($resultado_competencia <= 33.33) { $html.='<td>1</td>';}
						elseif ($resultado_competencia <= 66.66) { $html.='<td>2</td>';}
						elseif ($resultado_competencia <= 99.99) { $html.='<td>3</td>';}
						else { $html.='<td>4</td>';}
						$html.='</tr>';
					}
					else {
						$html.='
						<tr>
						<td>Superior</td>
						<td>90%</td>
						<td>'.$resultado_superior.'%</td>';
						if ($resultado_superior <= 33.33) { $html.='<td>1</td>';}
						elseif ($resultado_superior <= 66.66) { $html.='<td>2</td>';}
						elseif ($resultado_superior <= 99.99) { $html.='<td>3</td>';}
						else { $html.='<td>4</td>';}
						$html.='</tr>
						<tr>
						<td>Total</td>
						<td>100%</td>
						<td>'.$resultado_competencia.'%</td>';
						if ($resultado_competencia <= 33.33) { $html.='<td>1</td>';}
						elseif ($resultado_competencia <= 66.66) { $html.='<td>2</td>';}
						elseif ($resultado_competencia <= 99.99) { $html.='<td>3</td>';}
						else { $html.='<td>4</td>';}
						$html.='</tr>';
					}
					$html.='</tbody>
									</table>
									<br>';
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
			$criterio = $fila_crit["id"];
			$html.='
			<table class="table">
				<thead>
					<tr>
						<th>Criterio N°'.$fila_crit["id"].'</th>
						<th>Ponderación </th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>'.$fila_crit["descr"].'</td>
						<td>'.$fila_crit["ponderacion"].'%</td>
					</tr>
				</tbody>
			</table>';
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
		$html.='
		<table class="table">
			<thead>
					<tr>
						<th>Evaluador </th>
						<th>Peso opinante</th>
						<th>Porcentaje </th>
					</tr>
			</thead>
			<tbody>
					<tr>
					<td>Auto-Evaluación</td>
					<td>10%</td>
					<td>'.$fila_autoeval['resultado'].'%</td>
					</tr>';
					if ($verificador){
						$html.='<tr>
											<td>Superior</td>
											<td>75%</td>
											<td>'.$fila_sup['resultado'].'%</td>
										</tr>
										<tr>
											<td>Colaboradores</td>
											<td>15%</td>
											<td>'.$fila_col['resultado'].'%</td>
										</tr>
										<tr>
											<td>Total</td>
											<td>100%</td>
											<td>'.ROUND($fila_autoeval['resultado'] * 0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15,2).'%</td>
										</tr>';
					}
					else {
						$html.='<tr>
											<td>Superior</td>
											<td>90%</td>
											<td>'.$fila_sup['resultado'].'%</td>
										</tr>
										<tr>
											<td>Total</td>
											<td>100%</td>
											<td>'.ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.9 ,2).'%</td>
										</tr>';
					}
			$html.='</tbody>
							</table>
							<br><br>';
			}
	}
	$resultado_autoeval2 = ROUND($resultado_autoeval2/$contador2,2);
	$resultado_superior2 = ROUND($resultado_superior2/$contador2,2);
	$resultado_colaborador2 = ROUND($resultado_colaborador2/$contador2,2);
	$html.='</div>
					</body>
					</html>';
}


// Caso ambas respuestas
else {
$img = $_SESSION['image1'];
$img2 = $_SESSION['image2'];
$img3 = $_SESSION['image3'];
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
// Tabla con resultados generales
$html.='
	<table class="table">
		<thead>
      <tr>
				<th style="background-color:rgba(255, 255, 0 ,0.8)">Resultado Metas (50%)</th>
        <th style="background-color:rgba(255, 14, 44 ,0.8)">Resultado Competencias (50%)</th>
				<th style="background-color:rgba(255, 80, 0 ,0.7)">Resultado General</th>
      </tr>
    </thead>
		<tbody>
					<tr>
					  <td>'. $meta_general.'%</td>
					  <td>'. $comp_general.'%</td>
					  <td>'. $prom_general.'%</td>
					</tr>
  	</tbody>
	</table><br>';
	if (isset($_SESSION['image1'])){
		//$img = base64_decode($img);
		$html.='<img width=740 src='.$img.' /><br><br><br>';
	}
$html.="<h3> Metas del Cargo: ".$cargo."</h3>
	<br>
	<table class='table'>
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
	<br><br><br><br><br><br>";
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
$indicador_result = $conn->query($indicador) or die ("database error:". $conn->error);
$html.="<div class='table-responsive'>
<h4 class='meta'>Meta N°".$meta." ".$meta_desc."</h4>
<table class='table'>
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
	<tbody>";
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
$html.="
		<tr>
		<td class='chica'>".$fila_indicador['descripcion']."</td>
		<td class='chica'>".$fila_indicador['no_cumplido']."</td>
		<td class='chica'>".$fila_indicador['minimo']."</td>
		<td class='chica'>".$fila_indicador['esperado']."</td>
		<td class='chica'>".$fila_indicador['sobre_esperado']."</td>
		<td>".$ponderacion."%</td>
		<td>".$fila_evaluacion['resultado']."%</td>
		</tr>";
$total += $fila_evaluacion['resultado'] * ($ponderacion / 100.0);
	}
$html.="</tbody></table>";
}
$html.="<h3 class='total'> Total: ".ROUND($total,2)." %</h3>";
$html.="<p class='saltodepagina'/>";
$html.="<h3> Competencias del Perfil: ".$perfil."</h3>
<br>
<table class='table'>
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
</table>";
if (isset($_SESSION['image2'])){
	//$img = base64_decode($img);
	$html.='<img width=740 src='.$img2.'/><br><br><br>';
}
if (isset($_SESSION['image3'])){
	//$img = base64_decode($img);
	$html.='<img width=740 src='.$img3.' /><br><br>';
}
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
	}
	else {
		$resultado_competencia = ROUND($resultado_autoeval * 0.1 + $resultado_superior * 0.9,2);
	}
$html.="<h4 class='comp'>Competencia N° ".$competencia_id." : ".$competencia_nombre."</h4>
	<table class='table table-condensed'>
		<thead>
				<tr>
					<th class='resumen'>Evaluador </th>
					<th class='resumen'>Peso opinante</th>
					<th class='resumen'>Porcentaje </th>
					<th class='resumen'>Nivel </th>
				</tr>
		</thead>
		<tbody>
			<tr>
			<td>Auto-Evaluación</td>
			<td>10%</td>
			<td>".$resultado_autoeval."%</td>";
			if ($resultado_autoeval <= 33.33) { $html.="<td>1</td>"; }
			elseif ($resultado_autoeval <= 66.66) { $html.="<td>2</td>";}
			elseif ($resultado_autoeval <= 99.99) { $html.="<td>3</td>";}
			else { $html.="<td>4</td>";}
			$html.="</tr>";
			if ($verificador){
				$html.="<tr>
					<td>Superior</td>
					<td>75%</td>
					<td>".$resultado_superior."%</td>";
				if ($resultado_superior <= 33.33) { $html.="<td>1</td>";}
				elseif ($resultado_superior <= 66.66) { $html.="<td>2</td>";}
				elseif ($resultado_superior <= 99.99) { $html.="<td>3</td>";}
				else { $html.="<td>4</td>";}
				$html.="</tr>
					<tr>
					<td>Colaboradores</td>
					<td>15%</td>
					<td>".$resultado_colaborador."%</td>";
				if ($resultado_colaborador <= 33.33) { $html.="<td>1</td>";}
				elseif ($resultado_colaborador <= 66.66) { $html.="<td>2</td>";}
				elseif ($resultado_colaborador <= 99.99) { $html.="<td>3</td>";}
				else { $html.="<td>4</td>";}
				$html.="</tr><tr>
					<td>Total</td>
					<td>100%</td>
					<td>".$resultado_competencia."%</td>";
				if ($resultado_competencia <= 33.33) { $html.="<td>1</td>";}
				elseif ($resultado_competencia <= 66.66) { $html.="<td>2</td>";}
				elseif ($resultado_competencia <= 99.99) { $html.="<td>3</td>";}
				else { $html.="<td>4</td>";}
				$html.="</tr>";
			}
			else {
				$html.="
					<tr>
					<td>Superior</td>
					<td>90%</td>
					<td>".$resultado_superior."%</td>";
				if ($resultado_superior <= 33.33) { $html.="<td>1</td>";}
				elseif ($resultado_superior <= 66.66) { $html.="<td>2</td>";}
				elseif ($resultado_superior <= 99.99) { $html.="<td>3</td>";}
				else { $html.="<td>4</td>";}
				$html.="</tr>
					<tr>
					<td>Total</td>
					<td>100%</td>
					<td>".$resultado_competencia."%</td>";
				if ($resultado_competencia <= 33.33) { $html.="<td>1</td>";}
				elseif ($resultado_competencia <= 66.66) { $html.="<td>2</td>";}
				elseif ($resultado_competencia <= 99.99) { $html.="<td>3</td>";}
				else { $html.="<td>4</td>"; }
				$html.="</tr>";
			}
$html.="</tbody>
				</table>
				<br>";
$crit = "SELECT criterios.descripcion as descr,
								criterios.id as id,
								ponderacion
					 FROM comp_crit, criterios
					WHERE comp_crit.competencia_id = $competencia_id
						AND comp_crit.criterio_id = criterios.id
			 ORDER BY id";
$crit_result = $conn->query($crit) or die ("database error:". $conn->error);
while ($fila_crit = $crit_result->fetch_assoc()){
	$criterio = $fila_crit["id"];
$html.="<table class='table'>
	<thead>
		<tr>
			<th>Criterio N°".$fila_crit['id']."</th>
			<th>Ponderación </th>
		</tr>
	</thead>
	<tbody>
		<tr>
			<td>".$fila_crit["descr"]."</td>
			<td>".$fila_crit["ponderacion"]."</td>
		</tr>
	</tbody>
</table>";
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
$verificador = $fila_col['resultado'] != NULL;
$html.="<table class='table'>
	<thead>
			<tr>
				<th>Evaluador </th>
				<th>Peso opinante</th>
				<th>Porcentaje </th>
			</tr>
	</thead>
	<tbody>
		<tr>
		<td>Auto-Evaluación</td>
		<td>10%</td>
		<td>".$fila_autoeval['resultado']."%</td>
		</tr>";
		if ($verificador){
				$html.="<tr>
				<td>Superior</td>
				<td>75%</td>
				<td>".$fila_sup['resultado']."%</td>
				</tr>
				<tr>
				<td>Colaboradores</td>
				<td>15%</td>
				<td>".$fila_col['resultado']."%</td>
				</tr>
				<tr>
				<td>Total</td>
				<td>100%</td>
				<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.75 + $fila_col['resultado'] * 0.15,2)."%</td>
				</tr>";
			}
		else {
			$html.="<tr>
			<td>Superior</td>
			<td>90%</td>
			<td>".$fila_sup['resultado']."%</td>
			</tr>
			<tr>
			<td>Total</td>
			<td>100%</td>
			<td>".ROUND($fila_autoeval['resultado']*0.1 + $fila_sup['resultado'] * 0.9 ,2)."%</td>
			</tr>";
		}
$html.="</tbody>
				</table>
				<br><br>";
	}
}
$resultado_autoeval2 = ROUND($resultado_autoeval2/$contador2,2);
$resultado_superior2 = ROUND($resultado_superior2/$contador2,2);
$resultado_colaborador2 = ROUND($resultado_colaborador2/$contador2,2);
$html.="</div>";
$html.="</body>
				</html>";
}
$dompdf = new Dompdf();
$dompdf->load_html($html);
$dompdf->render();
//$dompdf->stream("dompdf_out.pdf", array("Attachment" => false));
//exit(0);
// Descomentar para PDF descargable
$dompdf->stream("Informe - ".$nombre." ".$apellido.".pdf");
////////////////////////////////////

/*$dompdf->load_html_file("'informe.php?usuario_id=".$usuario_id."
&car_id=".$cargo_id."
&cic_id=".$ciclo_id."
&asi_id=".$asi_id."'")));
//$html = file_get_contents("welcome.php");
//$dompdf->loadHtml($tbl);
$dompdf->load_html($_SESSION['prints']['table']);
$dompdf->load_html_file(index.php);
//$dompdf->load_html(file_get_contents("index.php"));
// (Optional) Setup the paper size and orientation
$dompdf->setPaper('A4', 'landscape');

// Render the HTML as PDF
$dompdf->render();
// Output the generated PDF to Browser
$dompdf->stream("Informe.pdf")*/
?>
