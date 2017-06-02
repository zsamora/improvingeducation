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
$cargo = $resultado['cargo'];
$perfil = $resultado['perfil'];
// Tabla información de usuario ?>
<?php
$html="";
$html.='<link rel="stylesheet" media="screen" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">';
$html.='<link href="css/styleprint.css" rel="stylesheet" type="text/css" media="screen">';
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
</div>
';
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
<div class="table-responsive">
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
	</table>';
$dompdf = new Dompdf();
$dompdf->load_html($html);
$dompdf->render();
$dompdf->stream("Informe.pdf");
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
