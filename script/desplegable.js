function desplegar(tabla_a_desplegar,estadoT) {
  var tablA = document.getElementById(tabla_a_desplegar);
  var estadOt = document.getElementById(estadoT);
  switch(tablA.style.display) {
    case "none":
      tablA.style.display = "block";
      estadOt.innerHTML = "Ocultar contenido"
      break;
    default:
      tablA.style.display = "none";
      estadOt.innerHTML = "Mostrar contenido"
      break;
  }
}
