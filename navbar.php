<div class="navbar navbar-default navbar-static-top">
  <div class="container">
    <div class="navbar-header">
      <?php
      if ($_SESSION['id'] == 1)
        { ?>
            <button style="background-color:rgba(0,0,0,0);border:0px;" class="navbar-brand" type="button" data-toggle="dropdown">
              <span class="glyphicon glyphicon-menu-hamburger"></span>
            </button>
              <ul style="left:135px;background-color:#0C1D46; width:60px;" class="dropdown-menu">
                <li style="padding-left:10px;"><a href='usuarios.php' class='navbar-brand'> Usuarios </a></li>
                <li style="padding-left:10px;"><a href='cargos.php' class='navbar-brand'> Cargos </a></li>
                <li style="padding-left:10px;"><a href='ciclos.php' class='navbar-brand'> Ciclos </a></li>
                <li style="padding-left:10px;"><a href='perfiles.php' class='navbar-brand'> Perfiles </a></li>
                <li style="padding-left:10px;"><a href='asignaturas.php' class='navbar-brand'> Asignaturas </a></li>
                <li style="padding-left:10px;"><a href='trabaja.php' class='navbar-brand'> Trabajos </a></li>
                <li style="padding-left:10px;"><a href='superiores.php' class='navbar-brand'> Superiores </a></li>
                <li style="padding-left:10px;"><a href="procesos.php" class="navbar-brand"> Procesos </a></li>
                <li style="padding-left:10px;"><a href="competencias.php" class="navbar-brand"> Competencias </a></li>
                <li style="padding-left:10px;"><a href="criterios.php" class="navbar-brand"> Criterios </a></li>
                <li style="padding-left:10px;"><a href="metas.php" class="navbar-brand"> Metas </a></li>
                <li style="padding-left:10px;"><a href="indicadores.php" class="navbar-brand"> Indicadores </a></li>
              </ul>
      <?php }
        //<a href="logout.php" class="navbar-brand"> Cerrar Sesión </a>
      ?>
      <a href="welcome.php" class="navbar-brand"> Inicio </a>
      <?php session_start();
      if ($_SESSION['proceso_id'] != 0 and $_SESSION['id'] != 1) { echo "<a href='proceso.php?proceso_id=".$_SESSION['proceso_id']."' class='navbar-brand'> Evaluaciones </a>"; }
      if ($_SESSION['id'] == 1 && $_SESSION['proceso_id'] != 0)
        { echo "<a href='resultados.php?proceso_id=".$_SESSION['proceso_id']."' class='navbar-brand'> Resultados </a>"; }
      ?>
    </div>
  </div>
</div>
