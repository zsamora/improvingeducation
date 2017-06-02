<div class="navbar navbar-default navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <a href="welcome.php" class="navbar-brand"> Inicio </a>
      <?php session_start();
      if ($_SESSION['proceso_id'] != 0 and $_SESSION['id'] != 1) { echo "<a href='proceso.php?proceso_id=".$_SESSION['proceso_id']."' class='navbar-brand'> Evaluaciones </a>"; }
      if ($_SESSION['id'] == 1 && $_SESSION['proceso_id'] != 0)
        { echo "<a href='resultados.php?proceso_id=".$_SESSION['proceso_id']."' class='navbar-brand'> Resultados </a>"; }
      if ($_SESSION['id'] == 1)
        { ?>
          <a href='usuarios.php' class='navbar-brand'> Usuarios </a>
          <a href='trabaja.php' class='navbar-brand'> Trabajos </a>
          <a href='superiores.php' class='navbar-brand'> Superiores </a>
          <a href="procesos.php" class="navbar-brand"> Proceso </a>
          <a href="competencias.php" class="navbar-brand"> Competencias </a>
          <a href="criterios.php" class="navbar-brand"> Criterios </a>
          <a href="metas.php" class="navbar-brand"> Metas </a>
          <a href="indicadores.php" class="navbar-brand"> Indicadores </a>
          <a href='perfiles.php' class='navbar-brand'> Perfiles </a>
          <a href='cargos.php' class='navbar-brand'> Cargos </a>
          <a href='ciclos.php' class='navbar-brand'> Ciclos </a>
          <a href='asignaturas.php' class='navbar-brand'> Asignaturas </a>
      <?php } ?>
      <a href="logout.php" class="navbar-brand"> Cerrar Sesión </a>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav"></ul>
    </div>
  </div>
</div>
