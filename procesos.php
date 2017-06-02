<?php
session_start();
if($_SESSION['id']!=1){ // Poner aquí las id de quien puede tener acceso
	header("Location: index.php");
}
include('header.php');
include_once("db_connect.php");
include('navbar.php');
?>
<div class="container">
	<?php include('sessionbar.php'); ?>
</div>
<h2> Procesos </h2>
<br>
<div class="container">
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Agregar</th>
				<th>Nombre</th>
				<th>Fecha de Inicio</th>
        <th>Fecha de Término</th>
				<th>Establecimiento</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$procesos = "SELECT establecimiento_id, establecimiento.nombre as e_nombre
										 FROM procesos,establecimiento
										WHERE establecimiento.id = procesos.establecimiento_id";
			$proc_result = $conn->query($procesos) or die ("database error:".$conn->error);
			?>
			<form action='agregar6.php' method="post">
			<td>
				<div class="btn-group">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus-sign"></span>
					</button>
				</div>
			</td>
			<td>
				<input type="text" name="nombre" class="form-control" placeholder="Nombre del Proceso">
			</td>
			<td>
				<input type="date" name="finicio" class="form-control">
			</td>
      <td>
				<input type="date" name="ftermino" class="form-control">
			</td>
			<td>
				<select name='est' class="custom-select mb-2 mr-sm-2 mb-sm-0">
				 <?php while($fila_procesos = $proc_result->fetch_assoc()) {
					 echo "<option value=".$fila_procesos['establecimiento_id'].">".$fila_procesos['e_nombre']."</option>";
				 } ?>
			</td>
			</form>
		</tbody>
	</table>
</div>
<h3> En curso </h3>
<?php
$procesos = "SELECT procesos.id as p_id, procesos.nombre as p_nombre, finicio, ftermino,
										establecimiento_id, establecimiento.nombre as e_nombre
               FROM procesos, establecimiento
							WHERE procesos.establecimiento_id = establecimiento.id
								AND habilitado = 1";
$proc_result = $conn->query($procesos) or die ("database error:".$conn->error);
?>
<div>
	<table class="table table-hover">
		<thead>
      <tr>
				<th>Acciones</th>
        <th>ID</th>
				<th>Nombre</th>
        <th>Fecha Inicio</th>
        <th>Fecha Término</th>
				<th>Establecimiento</th>
      </tr>
    </thead>
		<tbody>
			<?php while($fila = $proc_result->fetch_assoc()){?>
			<tr>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
								<?php echo "<li><a href='actualizar.php?id_el=" . $fila["p_id"]. "'>Actualizar evaluaciones</a></li>"?>
								<?php echo "<li><a href='borrarresult.php?id_el=" . $fila["p_id"]. "'>Borrar resultados</a></li>"?>
								<?php echo "<li><a href='eliminar6.php?id_el=" . $fila["p_id"]. "'>Eliminar</a></li>"?>
								<?php echo "<li><a href='deshabilitar2.php?id=" . $fila["p_id"]. "'>Deshabilitar</a></li>"?>
						</ul>
					</div>
				</td>
			<?php
			echo "<td>" . $fila["p_id"] . "</td>";
			echo "<td>" . $fila["p_nombre"] . "</td>";
			echo "<td>" . $fila["finicio"] . "</td>";
      echo "<td>" . $fila["ftermino"] . "</td>";
			echo "<td>" . $fila["e_nombre"] . "</td>";
    	echo "</tr>";
			} ?>
		</tbody>
	</table>
</div>
<h3> Cerrados </h3>
<?php
$procesos = "SELECT procesos.id as p_id, procesos.nombre as p_nombre, finicio, ftermino,
										establecimiento_id, establecimiento.nombre as e_nombre
               FROM procesos, establecimiento
							WHERE procesos.establecimiento_id = establecimiento.id
							  AND habilitado = 0";
$proc_result = $conn->query($procesos) or die ("database error:".$conn->error);
?>
<div>
	<table class="table table-hover">
		<thead>
      <tr>
				<th>Acciones</th>
        <th>ID</th>
				<th>Nombre</th>
        <th>Fecha Inicio</th>
        <th>Fecha Término</th>
				<th>Establecimiento</th>
      </tr>
    </thead>
		<tbody>
			<?php while($fila = $proc_result->fetch_assoc()){?>
			<tr>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<li>
								<?php echo "<li><a href='eliminar6.php?id_el=" . $fila["p_id"]. "'>Eliminar</a></li>"?>
							</li>
							<li>
								<?php echo "<li><a href='habilitar2.php?id=" . $fila["p_id"]. "'>Habilitar</a></li>"?>
							</li>
						</ul>
					</div>
				</td>
			<?php
			echo "<td>" . $fila["p_id"] . "</td>";
			echo "<td>" . $fila["p_nombre"] . "</td>";
			echo "<td>" . $fila["finicio"] . "</td>";
      echo "<td>" . $fila["ftermino"] . "</td>";
			echo "<td>" . $fila["e_nombre"] . "</td>";
    	echo "</tr>";
			} ?>
		</tbody>
	</table>
</div>
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Agregar</th>
				<th>Procesos</th>
				<th>Competencia</th>
			</tr>
		</thead>
		<tbody>
			<form action='agregar11.php' method="post">
			<td>
				<div class="btn-group">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus-sign"></span>
					</button>
				</div>
			</td>
			<?php
			$competencias = "SELECT id, nombre
												 FROM competencias";
      $comp_result = $conn->query($competencias) or die("database error:". $conn->error);
			$procesos = "SELECT id, nombre
										 FROM procesos";
			$procesos_result = $conn->query($procesos) or die("database error:". $conn->error);
			?>
			<td>
				<select name='proc' class="custom-select mb-2 mr-sm-2 mb-sm-0">
				 <?php while($fila_procesos = $procesos_result->fetch_assoc()) {
					 echo "<option value=".$fila_procesos['id'].">".$fila_procesos['nombre']."</option>";
				 } ?>
			</td>
			<td>
				<select name='comp' class="custom-select mb-2 mr-sm-2 mb-sm-0">
				 <?php while($fila_comp = $comp_result->fetch_assoc()) {
					 echo "<option value=".$fila_comp['id'].">".$fila_comp['nombre']."</option>";
				 } ?>
			 </select>
			</td>
			</form>
		</tbody>
	</table>
</div>
<div>
	<table class="table table-hover">
		<thead>
      <tr>
				<th>Acciones</th>
        <th>Proceso</th>
				<th>Competencia</th>
      </tr>
    </thead>
		<tbody>
			<?php
			$comp_perfil = "SELECT competencia_id, proceso_id, competencias.nombre as comp, procesos.nombre as proc
												FROM proc_comp, competencias, procesos
											 WHERE proc_comp.competencia_id = competencias.id
											 	 AND proc_comp.proceso_id = procesos.id";
			$result = $conn->query($comp_perfil) or die("database error:". $conn->error);
			while ($fila = $result->fetch_assoc()){
			?>
			<tr>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<?php echo "<li><a href='eliminar11.php?comp_id=" . $fila["competencia_id"]. "&proc_id=" . $fila["proceso_id"]. "'>Eliminar</a></li>"?>
						</ul>
					</div>
				</td>
			<?php
				echo "<td>" . $fila["proc"] . "</td>";
				echo "<td>" . $fila["comp"] . "</td>";
    		echo "</tr>";
			} ?>
		</tbody>
	</table>
</div>
<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Agregar</th>
				<th>Procesos</th>
				<th>Indicadores</th>
			</tr>
		</thead>
		<tbody>
			<form action='agregar8.php' method="post">
			<td>
				<div class="btn-group">
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-plus-sign"></span>
					</button>
				</div>
			</td>
			<?php
			$procesos = "SELECT id, nombre
										 FROM procesos";
			$procesos_result = $conn->query($procesos) or die("database error:". $conn->error);
			$indicadores = "SELECT id, descripcion
												 FROM indicadores";
      $ind_result = $conn->query($indicadores) or die("database error:". $conn->error);
			?>
			<td>
				<select name='proc' class="custom-select mb-2 mr-sm-2 mb-sm-0">
				 <?php while($fila_procesos = $procesos_result->fetch_assoc()) {
					 echo "<option value=".$fila_procesos['id'].">".$fila_procesos['nombre']."</option>";
				 } ?>
			</td>
			<td>
				<select name='ind' class="custom-select mb-2 mr-sm-2 mb-sm-0">
				 <?php while($fila_ind = $ind_result->fetch_assoc()) {
					 echo "<option value=".$fila_ind['id'].">".$fila_ind['id'].") ".$fila_ind['descripcion']."</option>";
				 } ?>
			 </select>
			</td>
			</form>
		</tbody>
	</table>
</div>
<div>
	<table class="table table-hover">
		<thead>
      <tr>
				<th>Acciones</th>
        <th>Proceso</th>
				<th>Indicadores</th>
      </tr>
    </thead>
		<tbody>
			<?php
			$proc_ind = "SELECT indicador_id, proceso_id, indicadores.descripcion as ind, procesos.nombre as proc
												FROM proc_ind, indicadores, procesos
											 WHERE proc_ind.indicador_id = indicadores.id
											 	 AND proc_ind.proceso_id = procesos.id";
			$result = $conn->query($proc_ind) or die("database error:". $conn->error);
			while ($fila = $result->fetch_assoc()){
			?>
			<tr>
				<td>
					<div class="btn-group">
						<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown">
							<span class="caret"></span>
							<span class="sr-only">Toggle Dropdown</span>
						</button>
						<ul class="dropdown-menu" role="menu">
							<?php echo "<li><a href='eliminar8.php?ind_id=" . $fila["indicador_id"]. "&proc_id=" . $fila["proceso_id"]. "'>Eliminar</a></li>"?>
						</ul>
					</div>
				</td>
			<?php
				echo "<td>" . $fila["proc"] . "</td>";
				echo "<td>" . $fila["indicador_id"].") ".$fila["ind"] . "</td>";
    		echo "</tr>";
			} ?>
		</tbody>
	</table>
</div>
</div>
<?php include('footer.php');?>
