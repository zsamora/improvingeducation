<?php
include_once("db_connect.php");
$id=$_GET["id_el"];
//TODO: ARREGLAR INYECCIONES Y ENVIAR MENSAJE DE SUCCESS, Y ARREGLAR ESTABLECIMIENTO
$evalcomp = "DELETE FROM evaluaciones_comp
									 WHERE proceso_id = $id";
$evalind = "DELETE FROM evaluaciones_ind
									WHERE proceso_id = $id";
$evalcomp_result = $conn->query($evalcomp) or die ("database error:".$conn->error);
$evalind_result = $conn->query($evalind) or die ("database error:".$conn->error);
$evalind = "INSERT INTO `evaluaciones_ind`(`tipo_id`, `meta_id`,`indicador_id`, `evaluado_id`, `cargo_id`,
                        `ciclo_id`, `asignatura_id`, `evaluador_id`, `cargo_sup`, `ciclo_sup`, `asignatura_sup`,`proceso_id`)
                 SELECT 2, indicadores.meta_id, indicadores.id, opinantes.evaluado_id,
                        opinantes.cargo_id, opinantes.ciclo_id, opinantes.asignatura_id, opinantes.evaluador_id,
                        opinantes.cargo_sup, opinantes.ciclo_sup, opinantes.asignatura_sup, $id
                   FROM indicador_cargos, indicadores, opinantes, proc_ind
                  WHERE indicador_cargos.cargo_id = opinantes.cargo_id
                    AND opinantes.tipo_id = 2
                    AND indicadores.id = indicador_cargos.indicador_id
                    AND proc_ind.proceso_id = $id
                    AND indicador_cargos.indicador_id = proc_ind.indicador_id";
$evalcomp1 = "INSERT INTO `evaluaciones_comp`(`tipo_id`, `competencia_id`, `criterio_id`, `evaluado_id`,
                          `cargo_id`, `ciclo_id`, `asignatura_id`, `evaluador_id`, `cargo_sup`, `ciclo_sup`, `asignatura_sup`,`proceso_id`)
                  SELECT 1, comp_perfiles.competencia_id, comp_crit.criterio_id, opinantes.evaluado_id,
                         opinantes.cargo_id, opinantes.ciclo_id, opinantes.asignatura_id, opinantes.evaluado_id,
                         opinantes.cargo_id, opinantes.ciclo_id, opinantes.asignatura_id, $id
                    FROM comp_perfiles, comp_crit, opinantes, proc_comp
                   WHERE comp_perfiles.perfil_id = opinantes.perfil_id
                     AND opinantes.tipo_id = 1
                     AND comp_perfiles.competencia_id = comp_crit.competencia_id
                     AND proc_comp.proceso_id = $id
                     AND comp_perfiles.competencia_id = proc_comp.competencia_id";
$evalcomp2 = "INSERT INTO `evaluaciones_comp`(`tipo_id`, `competencia_id`, `criterio_id`, `evaluado_id`,
                          `cargo_id`, `ciclo_id`, `asignatura_id`, `evaluador_id`, `cargo_sup`, `ciclo_sup`, `asignatura_sup`,`proceso_id`)
                  SELECT 2, comp_perfiles.competencia_id, comp_crit.criterio_id, opinantes.evaluado_id,
                         opinantes.cargo_id, opinantes.ciclo_id, opinantes.asignatura_id, opinantes.evaluador_id,
                         opinantes.cargo_sup, opinantes.ciclo_sup, opinantes.asignatura_sup, $id
                    FROM comp_perfiles, comp_crit, opinantes, proc_comp
                   WHERE comp_perfiles.perfil_id = opinantes.perfil_id
                     AND opinantes.tipo_id = 2
                     AND comp_perfiles.competencia_id = comp_crit.competencia_id
                     AND proc_comp.proceso_id = $id
                     AND comp_perfiles.competencia_id = proc_comp.competencia_id";
$evalcomp3 = "INSERT INTO `evaluaciones_comp`(`tipo_id`, `competencia_id`, `criterio_id`, `evaluado_id`,
                          `cargo_id`, `ciclo_id`, `asignatura_id`, `evaluador_id`, `cargo_sup`, `ciclo_sup`, `asignatura_sup`,`proceso_id`)
                  SELECT 3, comp_perfiles.competencia_id, comp_crit.criterio_id, opinantes.evaluado_id,
                         opinantes.cargo_id, opinantes.ciclo_id, opinantes.asignatura_id, opinantes.evaluador_id,
                         opinantes.cargo_sup, opinantes.ciclo_sup, opinantes.asignatura_sup, $id
                    FROM comp_perfiles, comp_crit, opinantes, proc_comp
                   WHERE comp_perfiles.perfil_id = opinantes.perfil_id
                     AND opinantes.tipo_id = 3
                     AND comp_perfiles.competencia_id = comp_crit.competencia_id
                     AND proc_comp.proceso_id = $id
                     AND comp_perfiles.competencia_id = proc_comp.competencia_id";
if ($conn->query($evalind) && $conn->query($evalcomp1) && $conn->query($evalcomp2) && $conn->query($evalcomp3)) {
	header("Location: procesos.php");
} else {
    echo "Error: " . $agregar . "<br>" . $conn->error;
}
die();
?>
