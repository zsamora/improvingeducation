-- phpMyAdmin SQL Dump
-- version 4.5.4.1deb2ubuntu2
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Tiempo de generación: 01-06-2017 a las 03:25:19
-- Versión del servidor: 5.7.18-0ubuntu0.16.04.1
-- Versión de PHP: 7.0.15-0ubuntu0.16.04.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sesiones`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`) VALUES
(0, 'Sin Asignatura'),
(1, 'Ingles'),
(2, 'Lenguaje'),
(3, 'Religion'),
(4, 'Arte'),
(5, 'Danza'),
(6, 'Futbol Varones'),
(7, 'Fisica'),
(8, 'Staff'),
(9, 'Educacion Fisica'),
(10, 'Basketball Varones'),
(11, 'Biologia'),
(12, 'Historia'),
(13, 'Manualidades'),
(14, 'Quimica'),
(15, 'Coro Liturgico'),
(16, 'Musica'),
(17, 'Voleibol Mixto'),
(18, 'Tecnologia'),
(19, 'Matematicas'),
(20, 'Pintura'),
(21, 'Handball Varones'),
(22, 'Computacion'),
(23, 'Filosofia'),
(24, 'Basketball Damas'),
(25, 'Gimnasia Artistica'),
(26, 'Futbol Damas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cargos`
--

CREATE TABLE `cargos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `perfil_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `cargos`
--

INSERT INTO `cargos` (`id`, `nombre`, `perfil_id`) VALUES
(0, 'Sin Cargo', 0),
(1, 'Administrador', 1),
(2, 'Agente de Convivencia Escolar', 2),
(3, 'Agente de Pastoral', 2),
(4, 'Asistente Deportivo ACLE', 1),
(5, 'Co-Educadora 1° Básico', 4),
(6, 'Co-Educadora de Párvulos', 4),
(7, 'Contador', 1),
(8, 'Convivencia Escolar ACLE', 1),
(9, 'CRA', 1),
(10, 'Director de Pastoral', 3),
(11, 'Educadora de Párvulos', 4),
(12, 'Encargado RRHH', 1),
(13, 'Encargado Tesorería y Cobranza', 1),
(14, 'Gerente de Administración y Finanzas', 3),
(15, 'Jefe de Ciclo', 3),
(16, 'Jefe de CRA', 1),
(17, 'Jefe de Departamento', 4),
(18, 'Jefe de UTP', 3),
(19, 'Jefe UTP Básica', 4),
(20, 'Misiones', 1),
(21, 'Orientadora Educación Básica', 2),
(22, 'Profesor de ACLE', 4),
(23, 'Profesor de Asignatura', 4),
(24, 'Profesor de Staff', 4),
(25, 'Profesor Jefe', 4),
(26, 'Psicopedagoga', 2),
(27, 'Psicóloga', 2),
(28, 'Recepcionista', 1),
(29, 'Rector', 3),
(30, 'Secretaria', 1),
(31, 'Orientadora Educación Media', 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ciclos`
--

CREATE TABLE `ciclos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ciclos`
--

INSERT INTO `ciclos` (`id`, `nombre`) VALUES
(0, 'Sin Ciclo'),
(1, 'Básica'),
(2, 'Media'),
(3, 'Párvulo'),
(4, 'Ninguno');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `competencias`
--

CREATE TABLE `competencias` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `competencias`
--

INSERT INTO `competencias` (`id`, `nombre`, `descripcion`) VALUES
(1, 'Liderazgo Gasparino', 'Conduce y motiva el proceso de aprendizaje hacia altos niveles de logro, comprometiéndose con el desarrollo integral de los alumnos/as, promoviendo la participación y valoración de las actividades de la comunidad educativa que fomentan la formación gasparina, centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre.'),
(2, 'Trabajo en Equipo', 'Se coordina con los integrantes del equipo para el cumplimiento de los objetivos, facilitando y promoviendo un clima de trabajo positivo y generando un trabajo colaborativo, que facilite y promueva la gestión del conocimiento.'),
(3, 'Orientación a la Excelencia con Iniciativa e Innovación', 'Realiza sus tareas con responsabilidad, eficiencia y calidad, apuntando a la excelencia, focalizándose en el cumplimiento de los objetivos, respondiendo positivamente frente a los cambios del entorno y generando ideas creativas e innovadoras, agregando así valor a la comunidad educativa a través del mejoramiento continuo.'),
(4, 'Compromiso Institucional', 'Influye positivamente en la cultura del Saint Gaspar, conduciéndose a partir de los valores definidos en el Proyecto Educativo Institucional, generando confianza y credibilidad, comprometiéndose con la línea pastoral y pedagógica del colegio, participando en actividades propias de la comunidad y comprometiéndose con la espiritualidad de la Preciosa Sangre y el PEI.'),
(5, 'Relaciones Interpersonales', 'Se relaciona e interactúa con cada miembro de la comunidad Gasparina en forma asertiva, empática y respetuosa, dando a conocer su punto de vista, de manera clara y oportuna, a través de los conductos regulares y abordando situaciones de conflicto con seguridad, pertinencia y tranquilidad.'),
(6, 'Calidad de la Enseñanza', 'Motiva y compromete a los estudiantes y a sus familias hacia un trabajo colaborativo para el logro de los objetivos, maximizando las capacidades de aprendizaje de todos los alumnos/as, tendiendo hacia el logro de aprendizajes de excelencia, consolidando el propósito educativo a través de un clima organizado y positivo de trabajo y favorable al aprendizaje.'),
(7, 'Liderazgo Directivo', 'Conduce, orienta, motiva y compromete a la comunidad educativa, hacia una visión y misión alineada con el PEI, guiando a su equipo de trabajo hacia altos estándares de desempeño y promoviendo su desarrollo, en un clima comunitario, organizado, colaborativo, nutritivo e innovador.'),
(8, 'Liderazgo para una Gestión Administrativa Efectiva', 'Enfoca su trabajo hacia un estándar de servicio de calidad educativa que cumple con las expectativas de manera oportuna y adecuada, tomando decisiones en forma oportuna para asegurar una administración efectiva del establecimiento. Lidera la planificación presupuestaria, orientando a la comunidad hacia un buen uso de los recursos.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_crit`
--

CREATE TABLE `comp_crit` (
  `competencia_id` int(10) NOT NULL,
  `criterio_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comp_crit`
--

INSERT INTO `comp_crit` (`competencia_id`, `criterio_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 5),
(2, 6),
(3, 7),
(3, 8),
(3, 9),
(3, 10),
(4, 11),
(4, 12),
(4, 13),
(5, 14),
(5, 15),
(5, 16),
(6, 17),
(6, 18),
(6, 19),
(7, 20),
(7, 21),
(7, 22),
(7, 23),
(8, 24),
(8, 25),
(8, 26),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comp_perfiles`
--

CREATE TABLE `comp_perfiles` (
  `competencia_id` int(10) NOT NULL,
  `perfil_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `comp_perfiles`
--

INSERT INTO `comp_perfiles` (`competencia_id`, `perfil_id`) VALUES
(1, 3),
(1, 4),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(6, 4),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `criterios`
--

CREATE TABLE `criterios` (
  `id` int(10) NOT NULL,
  `descripcion` text NOT NULL,
  `minimo` text NOT NULL,
  `en_desarrollo` text NOT NULL,
  `desarrollado` text NOT NULL,
  `superior` text NOT NULL,
  `ponderacion` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `criterios`
--

INSERT INTO `criterios` (`id`, `descripcion`, `minimo`, `en_desarrollo`, `desarrollado`, `superior`, `ponderacion`) VALUES
(1, 'Conduce y motiva el proceso de aprendizaje de los alumnos/as hacia altos niveles de logro.', 'Rara vez incentiva a los alumnos/as a valorar la tarea bien hecha y la autonomía en el trabajo escolar, retroalimentándolos solo en situaciones formales de evaluación.', 'Ocasionalmente motiva a los alumnos/as para lograr un trabajo autónomo y de calidad, retroalimentándolos en los logros obtenidos y debilidades observadas. Necesita apoyo para orientarlos hacia altos niveles de logro en el ámbito académico y formativo.', 'Constantemente motiva a los alumnos/as para lograr un trabajo autónomo y de calidad. Promueve la mejora a través de una retroalimentación habitual y sistemática, para la obtención de altos niveles de logro académicos y formativos.', 'Se destaca por fomentar una alta motivación de logro en los alumnos/as, procurando que sean autónomos e interesados en aprender, para alcanzar resultados de excelencia a nivel individual y grupal, logrando transferir sus buenas prácticas de retroalimentación a otros.', 33),
(2, 'Se compromete con el desarrollo integral de los alumnos/as', 'Se apega a los procedimientos establecidos para su cargo, necesitando apoyo y o supervisión para realizar acciones concretas de formación integral de los alumnos/as', 'Demuestra comprensión del impacto de su trabajo y de su influencia en el desarrollo integral de los estudiantes, siendo capaz de proponer acciones concretas para la formación de los alumnos/as', 'Comprende y valora su rol de formador de personas integras, generando de forma sistemática, proyectos y estrategias que promueven el desarrollo integral de los alumnos/as, de acuerdo con el PEI', 'Se destaca por su capacidad de influir positiva y significativamente en los alumnos/as, desarrollando en ellos identificación con la institución, la que se mantiene en el tiempo. Comparte sus estrategias y buenas prácticas con otros.', 33),
(3, 'Promueve en los alumnos/as la participación y valoración de las actividades de la comunidad educativa que fomentan la formación gasparina centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre.', 'Necesita apoyo para motivar la participación y valoración de los alumnos/as de las actividades de la comunidad educativa que fomentan la formación gasparina, centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre.', 'En algunas ocasiones promueve que los alumnos/as participen y valoren las actividades de la comunidad educativa que fomentan la formación gasparina, centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre.', 'Permanentemente promueve y compromete la participación y valoración de los alumnos/as en las actividades de la comunidad educativa que fomentan la formación gasparina, centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre.', 'Se destaca por movilizar y comprometer a los alumnos/as para que valoren y participen activamente las actividades de la comunidad educativa que fomentan la formación gasparina, centrada en la persona y con el sello de la Espiritualidad de la Preciosa Sangre, transfiriendo a otros sus experiencias y estrategias.', 34),
(4, 'Se coordina con el equipo de trabajo para el cumplimiento de los objetivos.', 'Realiza sólo el trabajo que le corresponde dentro del equipo.', 'Se coordina con su equipo de trabajo para lograr los objetivos, mostrando dificultades para respetar los acuerdos en situaciones de mayor complejidad.', 'Muestra disponibilidad para trabajar con otros compañeros de trabajo, participando y coordinándose con los demás, logrando acuerdos y cumpliendo a cabalidad con los compromisos adquiridos, esforzándose por lograr los objetivos del equipo.', 'Se destaca por movilizar a su equipo, diseñando e implementando estrategias de coordinación y planificación que trascienden a su equipo de trabajo directo, orientadas a impactar positivamente en los objetivos del colegio.', 33),
(5, 'Facilita y promueve un clima de trabajo positivo.', 'Se orienta a la búsqueda de soluciones simples, considerando sólo sus opiniones al momento de tomar la decisión.', 'Busca resolver los conflictos considerando las opiniones de los demás, teniendo dificultades para resolver situaciones más complejas.', 'Reconoce los aportes de los demás, tomando en cuenta sus ideas en la construcción conjunta de soluciones, afrontando situaciones complejas con una actitud optimista que contribuye al logro de los objetivos comunes.', 'Se destaca por su capacidad para generar espacios de trabajo colaborativos, preocupándose por el bienestar de sus compañeros, generando confianza en la capacidad del equipo para afrontar los desafíos propuestos. Transfiere a los demás habilidades en la resolución de conflicto.', 33),
(6, 'Fomenta el trabajo colaborativo y la transferencia de conocimientos y experiencias.', 'Comparte información sólo cuando se la solicitan.', 'Solicita ayuda cuando lo necesita y apoya a sus colegas cuando éstos se lo piden.', 'Construye y/o se vincula a redes de colaboración profesionales, facilitando, a través de acciones concretas, el diálogo pedagógico, el intercambio de conocimientos, experiencias y buenas prácticas, promoviendo con ello la generación de nuevas ideas.', 'Se destaca por fomentar el trabajo colaborativo, evaluando en conjunto y de manera sistemática, su utilidad para mejorar las prácticas de trabajo y la promoción del diálogo pedagógico. Además, su actitud positiva moviliza a otros integrantes a compartir sus conocimientos y experiencias.', 34),
(7, 'Asegura la calidad de su trabajo con responsabilidad, eficiencia y apuntando a la excelencia.', 'Cumple con los horarios, plazos y las tareas asignadas proveyendo lo estrictamente encomendado.', 'Asume con seriedad y responsabilidad sus compromisos y trabajos administrativos, cumpliendo con los requerimientos mínimos establecidos por el colegio.', 'Planifica su trabajo, desarrollándolo de forma responsable, eficiente, cuidadosa y ordenada, entregando productos de calidad (rigurosos y prolijos), introduciendo criterios de revisión y control para resguardar el cumplimiento del estándar de calidad de la institución.', 'Se destaca por su estilo de trabajo responsable, eficiente, riguroso y organizado, siendo un ejemplo para los demás por diseñar, utilizar y transferir métodos de trabajo orientados a asegurar la calidad de los procesos, productos y resultados, alcanzando la excelencia.', 25),
(8, 'Se orienta al cumplimiento de objetivos, resultados y metas.', 'Conoce los objetivos y metas establecidas, necesitando apoyo y supervisión para cumplirlos en el tiempo establecido.', 'Es autónomo en el cumplimiento de los objetivos, pero necesita apoyo ante situaciones de mayor complejidad.', 'Permanentemente se muestra autónomo, efectivo y perseverante en el cumplimiento de los objetivos, proponiéndose metas desafiantes, que van más allá de las esperadas.', 'Se destaca por su capacidad de cumplir sistemáticamente con los compromisos desafiantes que adquiere, promoviendo en sus compañeros de trabajo altos estándares de excelencia que se alinean con la visión institucional.', 25),
(9, 'Responde positivamente frente a los cambios del entorno, generando ideas creativas e innovadoras.', 'Trabaja siguiendo procedimientos y rutinas establecidas, requiriendo de apoyo y supervisión para realizar modificaciones en ellas y responder a los cambios del entorno.', 'Incorpora cambios en sus rutinas de trabajo, colaborando en el desarrollo de nuevas soluciones. Frente a situaciones de mayor complejidad demuestra poca creatividad y autonomía.', 'Muestra capacidad de adaptación y pro actividad en su actuar construyendo colaborativamente alternativas de acción, para responder eficientemente a los cambios del entorno, manifestando iniciativa y pro actividad en el desarrollo de nuevas ideas que impactan su quehacer', 'Se destaca por su capacidad de anticiparse y responder positivamente a los cambios del entorno, proponiendo acciones que mejoren los procesos educativos. Tiene la capacidad de implementar nuevas ideas, promoviendo y transfiriendo estas prácticas al resto de sus compañeros.', 25),
(10, 'Se orienta al mejoramiento continuo, agregando valor a la comunidad educativa', 'Se preocupa solo de realizar las tareas definidas para su cargo, mostrando poco interés en desarrollar oportunidades de mejora en su trabajo y acoger las sugerencias de los otros.', 'En ocasiones identifica y aprovecha oportunidades para generar nuevas y mejores formas de hacer las cosas, siendo más receptivo a las sugerencias de otros.', 'Permanentemente busca mejorar las prácticas de trabajo existentes, demostrando apertura frente a las sugerencias de los demás, autoevaluando su gestión, indagando en nuevas metodologías y conocimientos, transfiriendo efectiva y oportunamente los aprendizajes adquiridos a su quehacer diario.', 'Sistemáticamente adquiere nuevos conocimientos y los transfiere al puesto de trabajo, motivando a sus compañeros a implementar nuevas prácticas que agregan valor a la comunidad educativa.', 25),
(11, 'Transmite y practica los valores del proyecto educativo institucional en su conducta diaria', 'Demuestra conocimiento de los valores definidos en el PEI, actuando ocasionalmente conforme a ellos.', 'Demuestra comprensión de los valores del colegio actuando conforme a ellos y difundiéndolos al interior de la comunidad educativa.', 'Refleja en su conducta motivación y adhesión a los valores del Proyecto Educativo Institucional, siendo consecuente con ellos en su proceder y actuar cotidiano.', 'Se destaca por reflejar en su conducta los valores institucionales y proyectarlos hacia la comunidad, difundiéndolos y promoviéndolos tanto dentro como fuera del colegio, Influyendo a otros para que los integren en su quehacer diario.', 33),
(12, 'Genera confianza y credibilidad en su actuar, comprometiéndose con la línea pastoral y pedagógica del colegio.', 'Generalmente se muestra consecuente entre lo que dice y hace y sólo ocasionalmente cumple con los compromisos adquiridos, demostrando un bajo nivel de compromiso con la línea pastoral y pedagógica del colegio.', 'Demuestra consecuencia entre lo que dice y lo que hace, asumiendo sus errores en situaciones de su ámbito de acción. Se muestra comprometido con la línea pastoral y pedagógica del colegio, teniendo dificultades para integrarlas sistemáticamente a sus prácticas.', 'Demuestra consecuencia entre lo que dice y lo que hace aún en situaciones de alta complejidad, haciéndose responsable de sus actos, decisiones y compromisos en todas las circunstancias donde se ve involucrado. En sus actitudes y prácticas se muestra comprometido con la línea pastoral y pedagógica del colegio.', 'Es proactivo en apoyar a otros miembros de la comunidad educativa a asumir sus errores y compromisos en forma oportuna, generando mecanismos de acción concretos para encontrar soluciones adecuadas. Se destaca por su activo compromiso con la línea pastoral y pedagógica del colegio.', 33),
(13, 'Participa en las actividades de la comunidad escolar, comprometiéndose con la Espiritualidad de la Preciosa Sangre y el PEI', 'Necesita motivación y apoyo para participar en las actividades de la comunidad escolar y comprometerse con la Espiritualidad de la Preciosa Sangre y el PEI.', 'Ocasionalmente participa en las actividades de la comunidad escolar, mostrándose comprometido con la Espiritualidad de la Preciosa Sangre y el PEI.', 'Mantiene una participación entusiasta y se muestra solidario en las actividades del colegio. Se compromete activamente con la Espiritualidad de la Preciosa Sangre y el PEI.', 'Se destaca por su participación activa en las actividades de la comunidad escolar y su compromiso con el PEI. Logra movilizar a otros, consiguiendo motivarlos y comprometerlos con la Espiritualidad de la Preciosa Sangre y el PEI.', 34),
(14, 'Establece relaciones cordiales y profesionales con cada miembro de la comunidad Gasparina en forma asertiva, empática y respetuosa', 'En ocasiones establece un trato respetuoso con las personas.', 'Demuestra respeto y preocupación por los demás, siendo ocasionalmente asertivo para comunicarse de acuerdo a su rol.', 'Muestra preocupación por el otro, relacionándose siempre en un estilo respetuoso, asertivo y empático, estando disponible para atender a las necesidades de las personas de acuerdo al rol que le corresponde.', 'Se destaca por ser cercano, respetuoso, asertivo y empático dentro de la comunidad, influyendo positivamente en las relaciones interpersonales e impactando positivamente en el clima institucional.', 33),
(15, 'Se comunica en forma efectiva, respetando y utilizando adecuadamente los conductos regulares de comunicación', 'Escucha a su interlocutor, comunicando sus ideas en forma clara y utilizando ocasionalmente los conductos de comunicación establecidos.', 'Se preocupa de escuchar a los miembros de la comunidad educativa, comunicando sus ideas en forma clara y oportuna, utilizando siempre los canales de comunicación establecidos.', 'Escucha en forma activa y tolerante y se comunica con claridad de manera adecuada a cada contexto, asegurándose que su mensaje haya sido comprendido, respetando siempre los conductos regulares de comunicación', 'Se destaca por sus habilidades comunicacionales, expresando con claridad sus ideas, valorando y escuchando a los demás, mostrando convicción en lo que dice, movilizando a otros miembros de la comunidad educativa a respetar y utilizar los canales de comunicación establecidos.', 33),
(16, 'Resuelve situaciones de conflicto con seguridad, pertinencia y tranquilidad.', 'Aborda los problemas con las partes involucradas, necesitando apoyo para proponer soluciones en forma oportuna y pertinente.', 'Favorece la resolución de conflictos simples acercando las partes, proponiendo soluciones y abordando las dificultades en forma abierta y constructiva.', 'Enfrenta todos los conflictos con decisión y tranquilidad, identificando su origen y variables asociadas, mediando entre las partes y encontrando soluciones pertinentes y perdurables, incluso en situaciones de mayor complejidad.', 'Resuelve los conflictos en forma efectiva, diseñando redes de colaboración y mecanismos de control para prevenir y anticiparse oportunamente a los conflictos, transmitiendo a otros miembros de la comunidad educativa buenas prácticas de resolución de conflicto.', 34),
(17, 'Orienta a los estudiantes y a sus familias hacia un trabajo colaborativo para el logro de los objetivos.', 'Comunica los objetivos de aprendizaje tanto a los alumnos como a sus familias.', 'Logra que apoderados y estudiantes comprendan la importancia del trabajo colaborativo, siendo capaz de implementar solo en algunos casos, estrategias de trabajo colaborativo entre familia-escuela.', 'Transmite a la familia y estudiantes la importancia de cumplir los objetivos de aprendizaje y trabajar en conjunto con perseverancia y calidad, manifestando altas expectativas en sus capacidades, desarrollando actividades y/o estrategias significativas, retroalimentándolos oportunamente para que conozcan y evalúen sus progresos y resultados.', 'Se destaca por su habilidad para comprometer a la familia en el proceso educativo y desarrollar en los estudiantes la capacidad de formular sus propias metas y definir estrategias para alcanzarlas, mejorando sostenidamente sus resultados. Comparte éstas prácticas a otros docentes.', 33),
(18, 'Maximiza las capacidades de aprendizaje de todos los alumnos/as, tendiendo hacia el logro de aprendizajes de excelencia.', 'Planifica actividades para atender a la generalidad del curso, diversificando los recursos o medios de acuerdo al objetivo por lograr, no considerando la diversidad del aula.', 'Ocasionalmente genera experiencias de aprendizaje que consideran las diferencias individuales e involucran a todos los estudiantes.', 'Permanentemente desarrolla experiencias de aprendizaje desafiantes, utilizando recursos pedagógicos coherentes con las actividades. Respeta las diferencias individuales y estilos de aprendizaje, utilizando metodologías que favorecen el trabajo autónomo, apoyando y motivando a todos sus estudiantes hacia el logro de aprendizajes.', 'Se destaca por su capacidad de diseñar e implementar experiencias de aprendizaje desafiantes e innovadoras que potencian las habilidades de todos los estudiantes, logrando aprendizajes y resultados de excelencia. Transmite sus buenas prácticas pedagógicas a otros docentes', 33),
(19, 'Genera un clima organizado y positivo de trabajo y favorable al aprendizaje.', 'Muestra un trato respetuoso con los alumnos/as, manifestando dificultades para crear y mantener un ambiente organizado y positivo de trabajo', 'Establece relaciones empáticas con los alumnos/as, reconociendo sus intereses, motivación y participación, y ocasionalmente logra mantener un ambiente organizado y positivo de trabajo.', 'Establece relaciones de empatía y respeto mutuo con los estudiantes, motivando su participación e integración al grupo, utilizando estrategias para crear y mantener un ambiente organizado y positivo de trabajo, que favorezcan el aprendizaje de todos los alumnos/as.', 'Se destaca por su habilidad para generar un clima de trabajo organizado, positivo, estimulante y desafiante, logrando que los alumnos/as se comprometan con la adquisición de nuevos aprendizajes. Comparte su metodología con otros docentes del colegio.', 34),
(20, 'Desarrolla una visión común entre los integrantes de la comunidad educativa', 'Comunica la visión y misión a la comunidad sólo en instancias formales de difusión.', 'Transmite la visión y misión en múltiples instancias y se preocupa de que las actividades del establecimiento estén de acuerdo con ellas.', 'Es proactivo y autónomo en la comunicación de la misión y visión, desarrollando estrategias para que todos trabajen en el logro de la visión del establecimiento, con foco en la formación integral de los alumnos, comprometiendo a las personas a través de espacios concretos de participación.', 'Es destacado por su capacidad para generar credibilidad, confianza y compromiso con la proyección futura del colegio, ayudando a los demás a instalar prácticas de trabajo efectivas y sistemáticas, a nivel institucional, para el logro de la misión y visión.', 25),
(21, 'Motiva, conduce, orienta y compromete al equipo hacia el logro de los objetivos del PEI', 'Define metas y objetivos alineados con el PEI.', 'Define metas y objetivos de acuerdo al PEI, informando a sus colaboradores oportuna y claramente, generando espacios de retroalimentación respecto del logro de los objetivos.', 'Se compromete con el logro de los objetivos del PEI, siendo capaz de sortear dificultades y problemas que puedan surgir, motivando, orientando y entregando a su equipo lineamientos claros y facilitando espacios de reflexión sobre el Proyecto Educativo.', 'Se involucra activamente con el Proyecto Educativo Institucional, siendo destacado por formar equipos comprometidos, autónomos y altamente orientados al logro de metas, ayudando a otros a desarrollar una cultura institucional que se caracteriza por alcanzar sus objetivos.', 25),
(22, 'Promueve el desarrollo personal y profesional de su equipo de trabajo.', 'Conoce las capacidades de su equipo, retroalimentándolo ocasionalmente.', 'Muestra preocupación por el desarrollo personal y profesional de su equipo, generando estrategias de capacitación a partir de las necesidades que detecta.', 'Fomenta y potencia el desarrollo personal y profesional de su equipo, promoviendo la reflexión pedagógica, siendo proactivo en utilizar diferentes recursos para implementar estrategias de formación efectivas y permanentes, alineadas con los intereses o necesidades de su equipo y/o las necesidades institucionales.', 'Es destacado por su capacidad para implementar medidas estratégicas orientadas al desarrollo personal y profesional de su equipo de trabajo, instalando procedimientos para, promover una reflexión pedagógica constante, capacitar de manera continua, compartir buenas prácticas y verificar la transferencia de los aprendizajes a sus puestos de trabajo.', 25),
(23, 'Asegura un clima de trabajo organizado, colaborativo, nutritivo e innovador.', 'Se informa de las necesidades que afectan al clima de trabajo, siendo capaz de satisfacerlas oportunamente.', 'Entrega lineamientos para mantener un clima de trabajo organizado y colaborativo, costándole abrirse a las propuestas innovadoras que realizan sus colaboradores.', 'Muestra una actitud de apoyo y respaldo permanente a sus colaboradores, facilitando un clima de trabajo organizado, colaborativo, nutritivo e innovador, permaneciendo disponible para cooperar con su equipo.', 'Es destacado por su capacidad para generar y mantener un clima de trabajo organizado, colaborativo, nutritivo e innovador, generando mecanismos que permitan anticiparse y dar apoyo para resolver eficientemente situaciones complejas. Promoviendo y transfiriendo estas habilidades a sus colaboradores.', 25),
(24, 'Rigurosidad en la planificación presupuestaria y uso de los recursos.', 'Cumple con hacer el presupuesto y ocasionalmente realiza un riguroso control del uso de los recursos.', 'Demuestra capacidad para elaborar el presupuesto y realizar un control del uso de los recursos, pero necesita ayuda para alinear la gestión financiera con las necesidades y prioridades del colegio, en pos del cumplimiento de los resultados y metas institucionales.', 'Es riguroso en la planificación del presupuesto, recogiendo formalmente los requerimientos y prioridades de los distintos estamentos de la comunidad educativa, asegurando la disponibilidad de los recursos para el desarrollo de la actividad escolar y el logro de las metas institucionales.', 'Se destaca por su rigurosidad para realizar una gestión efectiva del presupuesto, optimizando los recursos humanos, tecnológicos, materiales y financieros, con el fin dar cumplimiento y sustentabilidad al PEI.', 33),
(25, 'Estándar de servicio de calidad educativa.', 'Se orienta a establecer estándares de servicio de calidad educativa, pero no considera criterios de calidad en los procesos de control y seguimiento.', 'Mantiene una organización de los recursos materiales y de infraestructura, eficiente, pero necesita apoyo para establecer criterios de calidad en los procesos de control y seguimiento.', 'Enfoca su trabajo hacia un estándar de servicio de calidad educativa que cumple con las expectativas de manera oportuna y adecuada, en la administración de los recursos materiales y de infraestructura, enfocando la gestión hacia la entrega de soluciones que satisfacen continuamente los requerimientos de la comunidad, mediante acciones concretas de control y seguimiento.', 'Se destaca por garantizar estándares de calidad educativa de excelencia en la administración de los recursos materiales y de infraestructura, utilizando medios formales para obtener la retroalimentación de sus clientes e integrarla en la mejora del servicio educativo entregado.', 33),
(26, 'Toma decisiones en forma oportuna.', 'Se orienta a la toma de decisiones, pero no logra actuar de forma rápida y oportuna para enfrentar situaciones cotidianas y emergentes que afectan la operación y la vida escolar.', 'Generalmente toma decisiones en forma autónoma y tranquila, pero ante situaciones de mayor complejidad necesita ayuda, para buscar soluciones rápidas u oportunas.', 'Toma decisiones en forma rápida y oportuna, ante situaciones cotidianas y emergentes que afectan la operación y la vida escolar, dándole fluidez a la administración del establecimiento, ejerciendo un liderazgo efectivo y resolutivo.', 'Se destaca por su capacidad para tomar decisiones en forma rápida y oportuna, ante situaciones cotidianas y emergentes que afectan la operación y la vida escolar. Ayuda a otros a ejercer un liderazgo efectivo y resolutivo.', 34);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `establecimiento`
--

CREATE TABLE `establecimiento` (
  `id` int(5) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `region` varchar(255) NOT NULL,
  `ciudad` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `establecimiento`
--

INSERT INTO `establecimiento` (`id`, `nombre`, `region`, `ciudad`) VALUES
(1, 'Saint Gaspar College', 'Region Metropolitana', 'Ñuñoa');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones_comp`
--

CREATE TABLE `evaluaciones_comp` (
  `id` int(11) NOT NULL,
  `tipo_id` int(10) NOT NULL,
  `competencia_id` int(10) NOT NULL,
  `criterio_id` int(10) NOT NULL,
  `evaluado_id` int(10) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `ciclo_id` int(10) NOT NULL,
  `asignatura_id` int(10) NOT NULL,
  `evaluador_id` int(10) NOT NULL,
  `cargo_sup` int(10) NOT NULL,
  `ciclo_sup` int(10) NOT NULL,
  `asignatura_sup` int(10) NOT NULL,
  `proceso_id` int(10) NOT NULL DEFAULT '1',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluaciones_ind`
--

CREATE TABLE `evaluaciones_ind` (
  `id` int(10) NOT NULL,
  `tipo_id` int(10) NOT NULL DEFAULT '2',
  `meta_id` int(10) NOT NULL,
  `indicador_id` int(11) NOT NULL,
  `evaluado_id` int(11) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `ciclo_id` int(10) NOT NULL,
  `asignatura_id` int(10) NOT NULL,
  `evaluador_id` int(11) NOT NULL,
  `cargo_sup` int(11) NOT NULL,
  `ciclo_sup` int(11) NOT NULL,
  `asignatura_sup` int(10) NOT NULL,
  `proceso_id` int(11) NOT NULL DEFAULT '1',
  `estado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `evaluacion_tipo`
--

CREATE TABLE `evaluacion_tipo` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `evaluacion_tipo`
--

INSERT INTO `evaluacion_tipo` (`id`, `nombre`) VALUES
(1, 'Auto-Evaluacion'),
(2, 'Superior (Comisión Evaluadora)'),
(3, 'Colaborador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicadores`
--

CREATE TABLE `indicadores` (
  `id` int(10) NOT NULL,
  `meta_id` int(10) NOT NULL,
  `descripcion` text NOT NULL,
  `no_cumplido` text NOT NULL,
  `minimo` text NOT NULL,
  `esperado` text NOT NULL,
  `sobre_esperado` text NOT NULL,
  `ponderacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `indicadores`
--

INSERT INTO `indicadores` (`id`, `meta_id`, `descripcion`, `no_cumplido`, `minimo`, `esperado`, `sobre_esperado`, `ponderacion`) VALUES
(1, 1, 'N° de entrevistas con el Profesor Jefe y/o Apoderados para llevar un proceso formativo e informar en casos que amerite los procedimientos normativos basados en el manual de Convivencia Escolar.', '2 o menos entrevistas con el Profesor Jefe y/o Apoderados de cada curso para llevar un proceso formativo e informar en casos que amerite los procedimientos normativos basados en el manual de Convivencia Escolar.', '3 entrevistas con el Profesor Jefe y/o Apoderados de cada curso para llevar un proceso formativo e informar en casos que amerite los procedimientos normativos basados en el manual de Convivencia Escolar.', '4 entrevistas con el Profesor Jefe y/o Apoderados de cada curso para llevar un proceso formativo e informar en casos que amerite los procedimientos normativos basados en el manual de Convivencia Escolar.', '4 entrevistas con el Profesor Jefe y/o Apoderados de cada curso para llevar un proceso formativo e informar en casos que amerite los procedimientos normativos basados en el manual de Convivencia Escolar, más un reporte a Dirección sobre las problemáticas detectadas.', 10),
(2, 2, '% de conflictos abordados e informados a tiempo de acuerdo al protocolo y/o directrices del Manual de Convivencia Escolar', '79 % o menos de los conflictos son abordados e informados a tiempo de acuerdo al protocolo y/o directrices del Manual de Convivencia Escolar', '80 a 99% % de los conflictos son abordados e informados a tiempo de acuerdo al protocolo y/o directrices del Manual de Convivencia Escolar', '100 % de los conflictos son abordados e informados a tiempo de acuerdo al protocolo y/o directrices del Manual de Convivencia Escolar', '100 % de los conflictos son abordados e informados a tiempo de acuerdo al protocolo y/o directrices del Manual de Convivencia Escolar, más una propuesta para mejorar la resolución de conflictos.', 20),
(3, 1, '% de espacios y tiempos de supervisión de los alumnos, que son cumplidos y ejecutados haciendo respetar las normas de convivencia escolar, según los protocolos establecidos (llegada y salida del colegio, cambios de hora, recreos, almuerzos, etc.)', 'En 79% o menos de los espacios y tiempos de supervisión de los alumnos son cumplidos y ejecutados haciendo respetar las normas de convivencia escolar, según los protocolos establecidos (llegada y salida del colegio, cambios de hora, recreos, almuerzos, etc.)', 'En 80% a 99% de los espacios y tiempos de supervisión de los alumnos son cumplidos y ejecutados haciendo respetar las normas de convivencia escolar, según los protocolos establecidos (llegada y salida del colegio, cambios de hora, recreos, almuerzos, etc.)', '100 % de los espacios y tiempos de supervisión de los alumnos son cumplidos y ejecutados haciendo respetar las normas de convivencia escolar, según los protocolos establecidos (llegada y salida del colegio, cambios de hora, recreos, almuerzos, etc.)', 'de los espacios y tiempos de supervisión de los alumnos son cumplidos y ejecutados haciendo respetar las normas de convivencia escolar, según los protocolos establecidos (llegada y salida del colegio, cambios de hora, recreos, almuerzos, etc.), realizando propuestas de mejora', 10),
(4, 1, '% de información de los alumnos que está disponible y actualizada (listas de curso, puntualidad, asistencia, atrasos, inasistencias, anotaciones, autorizaciones, etc.)', '79 % o menos de la información de los alumnos está disponible y actualizada (listas de curso, puntualidad, asistencia, atrasos, inasistencias, anotaciones, autorizaciones, etc.)', '80% a 99 % de la información de los alumnos está disponible y actualizada (listas de curso, puntualidad, asistencia, atrasos, inasistencias, anotaciones, autorizaciones, etc.)', '100 % de la información de los alumnos está disponible y actualizada (listas de curso, puntualidad, asistencia, atrasos, inasistencias, anotaciones, autorizaciones, etc.)', '100 % de la información de los alumnos está disponible, actualizada y no presentan ningún tipo de error (listas de curso, puntualidad, asistencia, atrasos, inasistencias, anotaciones, autorizaciones, etc.),', 10),
(5, 2, 'N° de estrategias implementadas que buscan prevenir y analizar posibles situaciones de conflicto y sus alcances.', '1 estrategia implementada para prevenir y analizar posibles situaciones de conflicto y sus alcances.', '2 estrategias implementadas para prevenir y analizar posibles situaciones de conflicto y sus alcances.', '3 estrategias implementadas para prevenir y analizar posibles situaciones de conflicto y sus alcances.', '3 estrategias implementadas para prevenir y analizar posibles situaciones de conflicto y sus alcances, más una propuesta de evaluación de las estrategias desarrolladas.', 20),
(6, 2, 'N° de estrategias de acompañamiento en el proceso formativo implementadas con el profesor jefe y/o de asignatura', '2 o menos estrategias de acompañamiento en el proceso formativo implementadas con el profesor jefe y/o de asignatura', '3 estrategias de acompañamiento en el proceso formativo implementadas con el profesor jefe y/o de asignatura', '4 estrategias de acompañamiento en el proceso formativo implementadas con el profesor jefe y/o de asignatura', '4 estrategias de acompañamiento en el proceso formativo implementadas con el profesor jefe y/o de asignatura, más una evaluación de las estrategias implementadas.', 15),
(7, 2, 'N° de acciones realizadas para orientar, animar y fortalecer la adhesión y el cumplimiento del Manual de Convivencia, en cuanto instrumento que regula, construye, custodia y asegura la sana relación entre los miembros de la comunidad educativa.', '2 o menos acciones realizadas para orientar, animar y fortalecer la adhesión y el cumplimiento del Manual de Convivencia, en cuanto instrumento que regula, construye, custodia y asegura la sana relación entre los miembros de la comunidad educativa.', '3 acciones realizadas para orientar, animar y fortalecer la adhesión y el cumplimiento del Manual de Convivencia, en cuanto instrumento que regula, construye, custodia y asegura la sana relación entre los miembros de la comunidad educativa.', '4 acciones realizadas para orientar, animar y fortalecer la adhesión y el cumplimiento del Manual de Convivencia, en cuanto instrumento que regula, construye, custodia y asegura la sana relación entre los miembros de la comunidad educativa.', '4 acciones realizadas para orientar, animar y fortalecer la adhesión y el cumplimiento del Manual de Convivencia, en cuanto instrumento que regula, construye, custodia y asegura la sana relación entre los miembros de la comunidad educativa, más una propuesta de mejora para la aplicación en el próximo año.', 15),
(8, 2, 'N° de actividades anuales para monitorear la implementación y evaluación del Plan Pastoral, verificando el cumplimiento de objetivos, de acuerdo a la línea pastoral del colegio.', '3 o menos actividades anuales desarrolladas para monitorear la implementación y evaluación del Plan Pastoral, verificando el cumplimiento de objetivos, de acuerdo a la línea pastoral del colegio.', '4 a 5 actividades anuales desarrolladas para monitorear la implementación y evaluación del Plan Pastoral, verificando el cumplimiento de objetivos, de acuerdo a la línea pastoral del colegio.', '6 actividades anuales desarrolladas para monitorear la implementación y evaluación del Plan Pastoral, verificando el cumplimiento de objetivos, de acuerdo a la línea pastoral del colegio.', '7 o más actividades anuales desarrolladas para monitorear la implementación y evaluación del Plan Pastoral, verificando el cumplimiento de objetivos, de acuerdo a la línea pastoral del colegio, más una propuesta de mejora del Plan Pastoral para el año siguiente.', 15),
(9, 2, 'N° de reuniones que se realizan en donde se aplicó alguna estrategia orientada a fomentar la formación integral, valórica y espiritual de los estudiantes.', '1 reunión realizada al año en donde se aplicó alguna estrategia orientada a fomentar la formación integral, valórica y espiritual de los estudiantes', '3 reunión realizada al semestre en donde se aplicó alguna estrategia orientada a fomentar la formación integral, valórica y espiritual de los estudiantes', '6 reuniones realizadas al semestre en donde se aplicó alguna estrategia orientada a fomentar la formación integral, valórica y espiritual de los estudiantes', '9 reuniones realizadas al semestre en donde se aplicó alguna estrategia orientada a fomentar la formación integral, valórica y espiritual de los estudiantes.', 15),
(10, 1, '% del material pedagógico elaborado para la realización del trabajo pastoral anual, de acuerdo a los objetivos y a los estándares institucionales.', '70% o menos del material pedagógico es elaborado para la realización del trabajo pastoral anual, de acuerdo a los objetivos y a los estándares institucionales.', '71% a 89% del material pedagógico es elaborado para la realización del trabajo pastoral anual, de acuerdo a los objetivos y a los estándares institucionales.', '90% a 100% del material pedagógico es elaborado para la realización del trabajo pastoral anual, de acuerdo a los objetivos y a los estándares institucionales.', '100% del material pedagógico es elaborado para la realización del trabajo pastoral anual, de acuerdo a los objetivos y a los estándares institucionales, más evaluaciones de las actividades realizadas.\r\n', 15),
(11, 1, 'N° de reuniones realizadas con el propósito de asesorar y acompañar en actividades pastorales de su quehacer educativo.', '20 o menos reunión realizada al mes con el propósito de asesorar y acompañar en actividades pastorales de su quehacer educativo', '20 a 29 reuniones realizadas al mes con el propósito de asesorar y acompañar en actividades pastorales de su quehacer educativo.', '30 a 39 reuniones realizadas al mes con el propósito de asesorar y acompañar en actividades pastorales de su quehacer educativo.', '40 o más reuniones realizadas al mes con el propósito de asesorar y acompañar en actividades pastorales de su quehacer educativo.', 15),
(12, 2, '% de actividades pastorales en las cuales participa activamente y que son animadas según los lineamientos establecidos (salidas, retiros, caminatas, peregrinaciones, etc.)', 'En 79% de las actividades pastorales participa activamente y son animadas según los lineamientos establecidos (salidas, retiros, caminatas, peregrinaciones, etc.)', 'En 80 % a 99% de las actividades pastorales participa activamente y son animadas según los lineamientos establecidos (salidas, retiros, caminatas, peregrinaciones, etc.)', 'En 100 % de las actividades pastorales participa activamente y son animadas según los lineamientos establecidos (salidas, retiros, caminatas, peregrinaciones, etc.)', 'En 100 % de las actividades pastorales participa activamente y son animadas según los lineamientos establecidos (salidas, retiros, caminatas, peregrinaciones, etc.), más una evaluación de las actividades que asiste.', 20),
(13, 3, '% de materiales pedagógicos elaborados según las necesidades del nivel, que son adecuados a las actividades y objetivos de aprendizaje y cumplen con los estándares establecidos (funcionales, creativos, con sentido pedagógico)', '74% o menos de los materiales pedagógicos elaborados según indicaciones de la educadora son adecuados para las actividades y objetivos de aprendizaje y cumplen con los estándares establecidos (seguros, atractivos, educativos)', 'Entre 75% a 99% de los materiales pedagógicos elaborados según indicaciones de la educadora son adecuados para las actividades y objetivos de aprendizaje y cumplen con los estándares establecidos (seguros, atractivos, educativos)', '100 % de los materiales pedagógicos son elaborados según las necesidades del nivel y son adecuados a las actividades y objetivos de aprendizaje, cumpliendo los estándares establecidos (funcionales, creativos, con sentido pedagógico)', '100 % de los materiales pedagógicos son elaborados según las necesidades del nivel y son adecuados a las actividades y objetivos de aprendizaje, cumpliendo los estándares establecidos (funcionales, creativos, con sentido pedagógico), más una propuesta de ideas para la creación de material pedagógico para el cicl', 30),
(14, 3, 'N° de estrategias aplicadas, que fueron acordadas con especialistas (internos/externos) y/o Jefe de Ciclo, para favorecer a aquellos niños con NEE transitorias', 'Ninguna de las estrategias entregadas en jornadas y/o talleres por especialistas internos y/o Jefe de Ciclo, son implementadas en el aula y el patio, para favorecer a niños con NEE transitorias', 'No todas las estrategias entregadas en jornadas y/o talleres por especialistas internos y/o Jefe de Ciclo, son implementadas en el aula y el patio, para favorecer a niños con NEE transitorias', 'Todas las estrategias entregadas en jornadas y/o talleres por especialistas internos y/o Jefe de Ciclo, son implementadas en el aula y el patio, para favorecer a niños con NEE transitorias', 'Todas las estrategias entregadas en jornadas y/o talleres por especialistas internos y/o Jefe de Ciclo, son implementadas en el aula y el patio, para favorecer a niños con NEE transitorias, más una propuesta de una mejora y/o estrategia nueva para apoyar al niño con dificultades.', 30),
(15, 2, 'N° de estrategias y/o actividades que promuevan la Espiritualidad de la Preciosa Sangre.', 'Ninguna estrategia y/o actividad realizada al año para promover la Espiritualidad de la Preciosa Sangre.', '1 estrategia y/o actividad realizada al año para promover la Espiritualidad de la Preciosa Sangre.', '2 estrategias y/o actividades realizadas al año para promover la Espiritualidad de la Preciosa Sangre.', '3 estrategias y/o actividades realizadas al año para promover la Espiritualidad de la Preciosa Sangre.', 10),
(16, 3, 'N° de clases observadas por la Jefa de ciclo que cumplen con el estándar del nivel: uso de recursos y metodologías activas, protagonismo de alumnos, uso efectivo del tiempo, actividades de inicio (aprendizajes previos), desarrollo y cierre, metacognición y desarrollo del pensamiento.', 'Ninguna de las clases observadas por la Jefa de Ciclo cumple con los criterios del estándar requerido en el nivel.', 'De las dos clases observadas por la Jefa de Ciclo, 1 o ambas cumplen solo con algunos de los criterios del estándar requerido en el nivel.', '2 clases observadas por la Jefa de Ciclo cumplen con el estándar requerido para del nivel (uso de recursos o metodologías activas, uso efectivo del tiempo, otros).', '2 clases observadas por la Jefa de Ciclo que cumplen con el estándar del nivel, más un aporte o propuesta de la educadora para mejorar algún aspecto de su clase y/o estrategia desarrollada', 30),
(17, 2, 'N° de acciones para promover la participación y el compromiso de los apoderados en actividades del colegio.', '1 acción realizada al año para promover la participación y el compromiso de los apoderados en actividades del colegio.', '2 a 3 acciones realizadas al año para promover la participación y el compromiso de los apoderados en actividades del colegio.', '4 acciones realizadas al año para promover la participación y el compromiso de los apoderados en actividades del colegio.', '5 acciones realizadas al año para promover la participación y el compromiso de los apoderados en actividades del colegio.', 10),
(18, 2, '% de actividades solidarias del Plan de Pastoral propias de la Misión, a las que asiste y colabora, son implementadas en los plazos establecidos.', '89 % o menos de las actividades solidarias del Plan de Pastoral propias de la Misión, a las que asiste y colabora, son implementadas en los plazos establecidos.', '90 % a 99% de las actividades solidarias del Plan de Pastoral propias de la Misión, a las que asiste y colabora, son implementadas en los plazos establecidos.', '100% de las actividades solidarias del Plan de Pastoral propias de la Misión, a las que asiste y colabora, son implementadas en los plazos establecidos.', '100 % de las actividades solidarias del Plan de Pastoral propias de la Misión, a las que asiste y colabora, son implementadas en los plazos establecidos, más una evaluación de las actividades implementadas.', 10),
(19, 2, 'N° de jornadas pastorales realizadas con docentes y familias, para fortalecer las espiritualidad misionera.\n', '6 jornadas pastorales o menos son realizadas al año con docentes y familias, para fortalecer las espiritualidad misionera.\r\n', '7 u 8 jornadas pastorales son realizadas al año con docentes y familias, para fortalecer la espiritualidad misionera.\r\n', '9 jornadas pastorales son realizadas al año con docentes y familias, para fortalecer la espiritualidad misionera.\r\n', '9 jornadas pastorales son realizadas al año con docentes y familias, para fortalecer las espiritualidad misionera, más una evaluación de las jornadas realizadas.\r\n', 15),
(20, 2, '% de estrategias implementadas con cada estamento para promover los principios y valores institucionales y cultivar la identidad Católica Misionera en la comunidad gasparina.', '79 % o menos de las estrategias implementadas al año con cada estamento son para promover los principios y valores institucionales y cultivar la identidad Católica Misionera en la comunidad gasparina.', '80% a 99% de las estrategias implementadas al año con cada estamento son para promover los principios y valores institucionales y cultivar la identidad Católica Misionera en la comunidad gasparina.', '100% de las estrategias implementadas al año con cada estamento son para promover los principios y valores institucionales y cultivar la identidad Católica Misionera en la comunidad gasparina,', '100% de las estrategias implementadas al año con cada estamento son para promover los principios y valores institucionales y cultivar la identidad Católica Misionera en la comunidad gasparina, más una propuesta de mejora a las estrategias implementadas', 20),
(21, 2, 'N° de acciones para la elaboración, socialización y monitoreo del Plan Pastoral en todos los niveles del establecimiento (preescolar - IV° medio)', '1 acción para la elaboración, socialización y monitoreo del Plan Pastoral cumplidas en diciembre del 2016, en todos los niveles del establecimiento (preescolar - IV° medio)', '2 acciones para la elaboración, socialización y monitoreo del Plan Pastoral cumplidas en diciembre del 2016, en todos los niveles del establecimiento (preescolar - IV° medio)', '3 acciones para la elaboración, socialización y monitoreo del Plan Pastoral cumplidas en diciembre del 2016, en todos los niveles del establecimiento (preescolar - IV° medio)', '3 acciones para la elaboración, socialización y monitoreo del Plan Pastoral cumplidas en diciembre del 2016, en todos los niveles del establecimiento (preescolar - IV° medio), más la entrega de un informe de evaluación por nivel', 20),
(22, 2, 'N° de reuniones con Agentes de Pastoral realizadas para comunicar, promover y articular la implementación del Plan de Pastoral y entregar lineamientos institucionales claros.', '1 reunión realizada al año con Agentes de Pastoral para comunicar, promover y articular la implementación del Plan de Pastoral y entregar lineamientos institucionales claros.', '2 reuniones realizadas al semestre con Agentes de Pastoral para comunicar, promover y articular la implementación del Plan de Pastoral y entregar lineamientos institucionales claros.', '3 a 4 reuniones realizadas al semestre con Agentes de Pastoral para comunicar, promover y articular la implementación del Plan de Pastoral y entregar lineamientos institucionales claros.', '3 a 4 reuniones realizadas al semestre con Agentes de Pastoral para comunicar, promover y articular la implementación del Plan de Pastoral y entregar lineamientos institucionales claros, más una propuesta de ajuste al Plan según necesidad.', 15),
(23, 4, '% de personas a su cargo, evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor cuando corresponda.\n', '89% o menos de las personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor cuando corresponda.\r\n', '90% a 99% de las personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor cuando corresponda.\r\n', '100 % de las personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor cuando corresponda.\r\n', '100 % de las personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor cuando corresponda, más una propuesta de mejora para la próxima aplicación del Sistema de Evaluación de Desempeño del colegio\r\n', 20),
(24, 3, '% de Planificaciones elaboradas que propician integralmente el desarrollo de los ámbitos de aprendizaje y cumplen con los estándares del nivel (características de los alumnos, estructura de inicio, desarrollo y cierre)\r\n', '79% o menos de las Planificaciones son elaboradas propiciando integralmente el desarrollo de los ámbitos de aprendizaje y cumplen con los estándares del nivel (características de los alumnos, estructura de inicio, desarrollo y cierre),\r\n', '89% a 99% de las Planificaciones son elaboradas propiciando integralmente el desarrollo de los ámbitos de aprendizaje y cumplen con los estándares del nivel (características de los alumnos, estructura de inicio, desarrollo y cierre),\r\n', '100% de las Planificaciones son elaboradas propiciando integralmente el desarrollo de los ámbitos de aprendizaje y cumplen con los estándares del nivel (características de los alumnos, estructura de inicio, desarrollo y cierre),\r\n', '100% de % de las Planificaciones son elaboradas propiciando integralmente el desarrollo de los ámbitos de aprendizaje y cumplen con los estándares del nivel (características de los alumnos, estructura de inicio, desarrollo y cierre), más una propuesta de mejora para el desarrollo de las planificaciones en el aula.\r\n', 25),
(25, 3, 'N° de registro de entrevistas de apoderados que son estructuradas cumpliendo los siguientes requisitos: objetivo (motivo de entrevista), redacción, seguimiento, sugerencias y acuerdos personalizados que den cuenta de las características y necesidades del niño/a.\r\n', '5 o menos registros de entrevistas, de los 10 revisados, son estructurados cumpliendo los requisitos establecidos.\r\n', 'Al menos 6 registros de entrevistas, de los 10 revisados, son estructurados cumpliendo los requisitos establecidos.\r\n', 'Al menos 7 registros de entrevistas, de los 10 revisados, son estructurados cumpliendo los requisitos establecidos.\r\n', '8 registros de entrevistas o más, de los 10 revisados, son estructurados cumpliendo los requisitos establecidos.\r\n', 10),
(26, 5, 'N° de estrategias implementadas que aseguren el pago completo y al contado de los aranceles\r\n', '1 estrategia implementada al año para asegurar el pago completo y al contado de los aranceles\r\n', '2 estrategias implementadas al año para asegurar el pago completo y al contado de los aranceles\r\n', '3 estrategias implementadas al año para asegurar el pago completo y al contado de los aranceles,\r\n', '3 estrategias implementadas al año para asegurar el pago completo y al contado de los aranceles, más una evaluación de las estrategias implementadas.\r\n', 15),
(27, 5, 'N° de estrategias implementadas y evaluadas que aseguran la permanencia del alumnado en el establecimiento y que miden la calidad del servicio del área de administración y finanzas\r\n', '1 estrategias implementada y evaluada para asegurar la permanencia del alumnado en el establecimiento y que mida la calidad del servicio del área de administración y finanzas\r\n', '2 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que midan la calidad del servicio del área de administración y finanzas\r\n', '3 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que midan la calidad del servicio del área de administración y finanzas\r\n', '3 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que midan la calidad del servicio del área de administración y finanzas, más una propuesta de mejora de las estrategias implementadas.\r\n', 15),
(28, 5, 'N° de estrategias implementadas para disminuir el gasto anual\r\n', '1 estrategia implementada al año para disminuir el gasto anual\r\n', '2 estrategias implementadas al año para disminuir el gasto anual\r\n', '3 estrategias implementadas al año para disminuir el gasto anual\r\n', '3 estrategias implementadas al año para disminuir el gasto anual, más la entrega de nuevas estrategias para control de gastos.\r\n', 20),
(29, 1, 'N° de acciones de rendición de cuenta económica asociadas a montos de ingresos, gastos e inversiones del establecimiento efectuados al Directorio de la Fundación Educacional SGC\r\n', '1 a 2 acciones de rendición de cuenta económica asociadas a montos de ingresos, gastos e inversiones del establecimiento efectuados al año al Directorio de la Fundación Educacional\r\n', '3 a 4 acciones de rendición de cuenta económica asociadas a montos de ingresos, gastos e inversiones del establecimiento efectuados al año al Directorio de la Fundación\r\n', '5 a 6 acciones de rendición de cuenta económica asociadas a montos de ingresos, gastos e inversiones del establecimiento efectuados al año al Directorio de la Fundación Educacional\r\n', '5 a 6 acciones de rendición de cuenta económica asociadas a montos de ingresos, gastos e inversiones del establecimiento efectuados al año al Directorio de la Fundación Educacional, más la entrega de un informe para cada rendición de cuentas.\r\n', 15),
(30, 5, 'Ejecución Presupuestaria calzada (o % del gasto realizado en relación al gasto presupuestado para el año 2015)\r\n', '79% o menos de la ejecución presupuestaria calzada\r\n', '80% a 89% de la ejecución presupuestaria calzada\r\n', '90% a 100% de la ejecución presupuestaria calzada\r\n', '90% a 100% de la ejecución presupuestaria calzada, más una propuesta para mejorar los procesos financieros.\r\n', 10),
(31, 1, 'N° de propuestas realizadas para mejorar la eficiencia de los sistemas internos en la institución\r\n', '2 o menos propuestas realizadas para mejorar la eficiencia de los sistemas internos en la institución\r\n', '3 propuestas realizadas para mejorar la eficiencia de los sistemas internos en la institución\r\n', '4 propuestas realizadas para mejorar la eficiencia de los sistemas internos en la institución\r\n', '4 propuestas realizadas para mejorar la eficiencia de los sistemas internos en la institución, más una evaluación de la implementación de las propuestas realizadas.\r\n', 10),
(32, 4, 'N° de personas evaluadas y retroalimentadas en su cargo\r\n', '7 personas evaluadas y retroalimentadas en su cargo en abril del 2017\r\n', '7 personas evaluadas y retroalimentadas en su cargo en marzo del 2017\r\n', '7 personas evaluadas y retroalimentadas en su cargo en diciembre del 2016\r\n', '7 personas evaluadas y retroalimentadas en su cargo en diciembre del 2016, más una propuesta para fortalecer el trabajo de su equipo de trabajo.\r\n', 15),
(33, 3, '% de alumnos que requieren apoyo y son derivados a tiempo, realizando un seguimiento de cada caso, a través de entrevistas a especialistas externos y apoderados.\r\n', '89% o menos de los alumnos que requieren apoyo son derivados a tiempo, realizando un seguimiento de cada caso a través de entrevistas a especialistas externos y apoderados.\r\n', '90% a 99% de los alumnos que requieren apoyo son derivados a tiempo, realizando un seguimiento de cada caso a través de entrevistas a especialistas externos y apoderados.\r\n', '100%% de los alumnos que requieren apoyo son derivados a tiempo, realizando un seguimiento de cada caso a través de entrevistas a especialistas externos y apoderados.\r\n', '100%% de los alumnos que requieren apoyo son derivados a tiempo, realizando un seguimiento de cada caso a través de entrevistas a especialistas externos y apoderados, más una propuesta de mejora de los procedimientos establecidos\r\n', 10),
(34, 3, 'Protocolo de Psicopedagogía 2015 implementado y evaluado\r\n', 'Protocolo de Psicopedagogía implementado y evaluado, en marzo del 2017\r\n', 'Protocolo de Psicopedagogía implementado y evaluado, en enero del 2017\r\n', 'Protocolo de Psicopedagogía implementado y evaluado, en diciembre del 2016\r\n', 'Protocolo de Psicopedagogía implementado y evaluado, en diciembre del 2016, más una propuesta para su socialización e implementación\r\n', 10),
(35, 3, '% de Consejos de casos especiales y generales con Profesores Jefes, de Asignatura y equipo de gestión, que son realizados para analizar el desempeño académico y el proceso formativo de los alumnos del ciclo.\r\n', '89% o menos de los Consejos de casos especiales y generales con Profesores Jefes, de Asignatura y equipo de gestión, son realizados para analizar el desempeño académico y el proceso formativo de los alumnos del ciclo.\r\n', '90% a 99% de los Consejos de casos especiales y generales con Profesores Jefes, de Asignatura y equipo de gestión, son realizados para analizar el desempeño académico y el proceso formativo de los alumnos del ciclo.\r\n', '100%% de los Consejos de casos especiales y generales con Profesores Jefes, de Asignatura y equipo de gestión, son realizados para analizar el desempeño académico y el proceso formativo de los alumnos del ciclo.\r\n', '100%% de los Consejos de casos especiales y generales con Profesores Jefes, de Asignatura y equipo de gestión, son realizados para analizar el desempeño académico y el proceso formativo de los alumnos del ciclo, más una propuesta de mejora a la estructura de los consejos.\r\n', 20),
(36, 2, '% de planes de Jefatura de curso que son revisados y retroalimentados en el plazo correspondiente.\r\n', '89% o menos de los planes de Jefatura de curso son revisados y retroalimentados en el plazo correspondiente.\r\n', '90% a 99% de los planes de Jefatura de curso son revisados y retroalimentados en el plazo correspondiente.\r\n', '100% de los planes de Jefatura de curso son revisados y retroalimentados en el plazo correspondiente.\r\n', '100% de los planes de Jefatura de curso son revisados y retroalimentados en el plazo correspondiente, más una propuesta de monitoreo para la implementación.\r\n', 20),
(37, 1, 'N° de acciones que permiten coordinar y atender a los apoderados, promoviendo una alianza familia-escuela, en coherencia con el PEI y los objetivos en desarrollo.\r\n', '2 acciones o menos que permitan coordinar y atender a los apoderados, promoviendo una alianza familia-escuela, en coherencia con el PEI y los objetivos en desarrollo.\r\n', '3 acciones que permitan coordinar y atender a los apoderados, promoviendo una alianza familia-escuela, en coherencia con el PEI y los objetivos en desarrollo.\r\n', '4 acciones que permitan coordinar y atender a los apoderados, promoviendo una alianza familia-escuela, en coherencia con el PEI y los objetivos en desarrollo.\r\n', '4 acciones que permitan coordinar y atender a los apoderados, promoviendo una alianza familia-escuela, en coherencia con el PEI y los objetivos en desarrollo, más una propuesta de mejora de las acciones implementadas.\r\n', 20),
(38, 4, '% de docentes a su cargo, observados en aula en sus funciones y retroalimentados, con reconocimiento a su labor cuando corresponda.\n', '79% o menos de los docentes a su cargo son observadas a lo menos 1 vez cada semestre en sus funciones y retroalimentados, con reconocimiento a su labor cuando corresponda.\r\n', '80 % a 99% de los docentes a su cargo son observadas a lo menos 1 vez cada semestre en sus funciones y retroalimentados, con reconocimiento a su labor cuando corresponda.\r\n', '100% de los docentes a su cargo son observadas a lo menos 1 vez cada semestre en sus funciones y retroalimentados, con reconocimiento a su labor cuando corresponda.\r\n', '100 % de los docentes a su cargo son observadas a lo menos 1 vez cada semestre en sus funciones y retroalimentados, con reconocimiento a su labor cuando corresponda, más 1 vez más a quienes lo necesitan (más débiles)\r\n', 20),
(39, 3, 'N° de estrategias de mejora para potenciar los aprendizajes de los estudiantes\r\n', '1 estrategia de mejora implementada al año para potenciar los aprendizajes de los estudiantes.\r\n', '2 estrategias de mejora implementadas al año para potenciar los aprendizajes de los estudiantes.\r\n', '3 estrategias de mejora implementadas al año para potenciar los aprendizajes de los estudiantes.\r\n', '3 estrategias de mejora implementadas al año para potenciar los aprendizajes de los estudiantes, más una evaluación de impacto de las estrategias implementadas.\r\n', 20),
(40, 3, '% de instrumentos de evaluación que fueron revisados y retroalimentados a los docentes, en los plazos correspondientes.\n', '79% o menos de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes.\r\n', '80% a 99% de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes.\r\n', '100% de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes.\r\n', '100% de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, más una propuesta de mejora a la elaboración de instrumentos.\r\n', 15),
(41, 3, '% de planificaciones y cronogramas que son revisados y retroalimentados en plazos correspondientes, a los docentes de su equipo.\r\n', '59% o menos de las planificaciones y cronogramas son revisados y retroalimentados en los plazos correspondientes, a los docentes de su equipo\r\n', '60% a 89% de las planificaciones y cronogramas son revisados y retroalimentados en los plazos correspondientes, a los docentes de su equipo\r\n', '100% de las planificaciones y cronogramas son revisados y un 90% son retroalimentados en los plazos correspondientes a los docentes de su equipo.\r\n', '100% de las planificaciones y cronogramas son revisados y retroalimentados en los plazos correspondientes, a los docentes de su equipo.\r\n', 20),
(42, 1, 'N° de reuniones de Departamento realizadas para enfatizar la reflexión pedagógica y fortalecer la interdisciplinariedad entre departamentos.\r\n', '1 o ninguna reunión al mes para enfatizar la reflexión pedagógica y fortalecer la interdisciplinariedad entre departamentos.\r\n', '2 reuniones al mes para enfatizar la reflexión pedagógica y fortalecer la interdisciplinariedad entre departamentos.\r\n', '1 reunión semanal para enfatizar la reflexión pedagógica y fortalecer la interdisciplinariedad entre departamentos.\r\n', '1 reunión semanal para enfatizar la reflexión pedagógica y fortalecer la interdisciplinariedad entre departamentos., con tareas asignadas a sus profesores.\r\n', 10),
(43, 3, '% de actividades o proyectos que son implementados y evaluados según el plan anual del departamento para la comunidad.\r\n', '79% o menos de las actividades o proyectos son implementados y evaluados según el plan anual del departamento para la comunidad.\r\n', '80% a 99% de las actividades o proyectos son implementados y evaluados según el plan anual del departamento para la comunidad.\r\n', '100% de las actividades o proyectos son implementados y evaluados según el plan anual del departamento para la comunidad, más una evaluación de las actividades y proyectos desarrollados.\r\n', '100% de las actividades o proyectos son implementados y evaluados según el plan anual del departamento para la comunidad, más una evaluación de las actividades y proyectos desarrollados y una propuesta nueva de trabajo en proyectos\r\n', 15),
(44, 4, 'N° de acciones implementadas al año para facilitar la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', '3 acciones o menos son implementadas en el año para facilitar la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', '4 o 5 acciones implementadas en el año para facilitar la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', '6 acciones implementadas en el año para facilitar la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', '6 acciones implementadas en el año para facilitar la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares, más propuesta de mejoramiento de las estrategias utilizadas\r\n', 10),
(45, 3, 'N° de reuniones al semestre para el monitoreo de logros de aprendizajes de cursos, niveles y establecer acciones de mejora.\r\n', '1 reunión al año para el monitoreo de logros de aprendizajes de cursos, niveles y establecer acciones de mejora.\r\n', '1 reunión al semestre para el monitoreo de logros de aprendizajes de cursos, niveles y establecer acciones de mejora.\r\n', '2 reuniones al semestre para el monitoreo de logros de aprendizajes de cursos, niveles y establecer acciones de mejora.\r\n', '3 reuniones o más al semestre para el monitoreo de logros de aprendizajes de cursos, niveles y establecer acciones de mejora, más una propuesta de estrategias para potenciar el seguimiento de los alumnos.\r\n', 10),
(46, 3, 'N° de reuniones para promover y generar espacios de programación, realización y evaluación de trabajos interdisciplinarios de los departamentos de aprendizaje.\r\n', '1 reunión al año para promover y generar espacios de programación, realización y evaluación de trabajos interdisciplinarios de los departamentos de aprendizaje.\r\n', '1 reunión al semestre para promover y generar espacios de programación, realización y evaluación de trabajos interdisciplinarios de los departamentos de aprendizaje.\r\n', '2 reuniones al semestre para promover y generar espacios de programación, realización y evaluación de trabajos interdisciplinarios de los departamentos de aprendizaje.\r\n', '2 reuniones al semestre para promover y generar espacios de programación, realización y evaluación de trabajos interdisciplinarios de los departamentos de aprendizaje, más una propuesta de mejora para la planificación e implementación de proyectos interdisciplinarios.\r\n', 10),
(47, 3, '% de planificaciones entregadas que son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente\r\n', '69% o menos de las planificaciones entregadas son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '70 % a 89% de las planificaciones entregadas son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '90% a 100 % de las planificaciones entregadas son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '100 % de las planificaciones entregadas son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente, más una propuesta de mejora al modelo de evaluación para potenciar los aprendizajes de los alumnos.\r\n', 25),
(48, 3, '% de informes de resultados de las evaluaciones externas e internas aplicadas que son realizados en los plazos correspondientes, considerando estrategias remédiales según necesidad.\r\n', '79% o menos de los informes de resultados de las evaluaciones externas e internas aplicadas son realizados en los plazos correspondientes, considerando estrategias remédiales según necesidad.\r\n', '80% a 99% de los informes de resultados de las evaluaciones externas e internas aplicadas son realizados en los plazos correspondientes, considerando estrategias remédiales según necesidad.\r\n', '100 % de los informes de resultados de las evaluaciones externas e internas aplicadas son realizados en los plazos correspondientes, considerando estrategias remédiales según necesidad.\r\n', '100 % de los informes de resultados de las evaluaciones externas e internas aplicadas son realizados en los plazos correspondientes, considerando estrategias remédiales según necesidad, más una propuesta del registro histórico que promueva la mejora continua.\r\n', 20),
(49, 1, 'N° de acciones realizadas para acompañar a los Jefes de Departamento en la gestión de su área, promoviendo y articulando la gestión pedagógica curricular y entregando lineamientos pedagógicos institucionales claros.\r\n', '5 acciones o menos son realizadas para acompañar a los Jefes de Departamento en la gestión de su área, promoviendo y articulando la gestión pedagógica curricular y entregando lineamientos pedagógicos institucionales claros.\r\n', '6 o 7 acciones realizadas para acompañar a los Jefes de Departamento en la gestión de su área, promoviendo y articulando la gestión pedagógica curricular y entregando lineamientos pedagógicos institucionales claros.\r\n', '8 acciones realizadas para acompañar a los Jefes de Departamento en la gestión de su área, promoviendo y articulando la gestión pedagógica curricular y entregando lineamientos pedagógicos institucionales claros.\r\n', '8 o más acciones realizadas para acompañar a los Jefes de Departamento en la gestión de su área, promoviendo y articulado la gestión pedagógica curricular y entregar lineamientos pedagógicos institucionales claros, más una evaluación de cada una de las acciones realizadas para evaluar su impacto.\r\n', 25),
(50, 4, '% de reuniones con su equipo en donde se facilita la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', 'En 49 % o menos de las reuniones con su equipo se facilita la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', 'En 50% a 59 % de las reuniones con su equipo se facilita la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', 'En 60 % de las reuniones con su equipo se facilita la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares.\r\n', 'En más de 60 % de las reuniones con su equipo se facilita la reflexión pedagógica, el intercambio de buenas prácticas y/o experiencias exitosas entre pares, más una propuesta de seguimiento de la transferencia al aula de las buenas prácticas compartidas.\r\n', 10),
(51, 3, 'N° de estrategias realizadas al semestre para el seguimiento curricular, incluyendo cumplimiento de cobertura, uso de recursos, planificaciones y actividades de evaluación.\r\n', '2 o menos estrategias realizadas al semestre para el seguimiento curricular, incluyendo cumplimiento de cobertura, uso de recursos, planificaciones, y actividades de evaluación.\r\n', '3 a 4 estrategias realizadas al semestre para el seguimiento curricular, incluyendo cumplimiento de cobertura, uso de recursos, planificaciones y actividades de evaluación.\r\n', '5 estrategias realizadas al semestre para el seguimiento curricular, incluyendo cumplimiento de cobertura, uso de recursos, planificaciones y actividades de evaluación.\r\n', '5 o más estrategias realizadas al semestre para el seguimiento curricular, incluyendo cumplimiento de cobertura , uso de recursos, planificaciones y actividades de evaluación, más una propuesta para mejorar las estrategias implementadas.\r\n', 10),
(52, 3, 'N° de acciones realizadas al semestre para el monitoreo de logros de aprendizajes de cursos y niveles y establecer acciones de mejora.\r\n', '2 o menos acciones realizadas al semestre para el monitoreo de logros de aprendizajes de cursos y niveles y establecer acciones de mejora.\r\n', '3 a 4 acciones realizadas al semestre para el monitoreo de logros de aprendizajes de cursos y niveles y establecer acciones de mejora.\r\n', '5 acciones realizadas al semestre para el monitoreo de logros de aprendizajes de cursos y niveles y establecer acciones de mejora.\r\n', '5 acciones realizadas al semestre para el monitoreo de logros de aprendizajes de cursos y niveles y establecer acciones de mejora, más 1 acción más en cada nivel que rinde SIMCE.\r\n', 15),
(53, 3, '% de instrumentos de evaluación que fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, considerando la normativa del Reglamento de Evaluación.\r\n', '79 % o menos de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, considerando la normativa del Reglamento de Evaluación del colegio.\r\n', '80% a 99% de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, considerando la normativa del Reglamento de Evaluación del colegio.\r\n', '100 % de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, considerando la normativa del Reglamento de Evaluación del colegio.\r\n', '100 % de los instrumentos de evaluación fueron revisados y retroalimentados a los docentes, en los plazos correspondientes, considerando la normativa del Reglamento de Evaluación del colegio, más genera nueva/s orientación/es para la mejora de los instrumentos.\r\n', 15),
(54, 3, '% de planificaciones revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '79% o menos de las planificaciones son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '80% a 99% de las planificaciones son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '100 % de las planificaciones son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente.\r\n', '100 % de las planificaciones son revisadas y retroalimentadas en los plazos correspondientes, monitoreando la implementación y evaluación de los Planes y Programas de estudio vigente, más una propuesta para alinear las planificaciones con el modelo pedagógico del colegio.\r\n', 10),
(55, 3, '% de estrategias remédiales aplicadas para los alumnos y cursos que presentan bajos niveles de logro, considerando la información de evaluaciones internas y externas.\r\n', '79% o menos de las estrategias remédiales aplicadas para los alumnos y cursos que presentan bajos niveles de logro, consideran la información de evaluaciones internas y externas.\r\n', '80 % a 99% de las estrategias remédiales aplicadas para los alumnos y cursos que presentan bajos niveles de logro, consideran la información de evaluaciones internas y externas.\r\n', '100 % de las estrategias remédiales aplicadas para los alumnos y cursos que presentan bajos niveles de logro, consideran la información de evaluaciones internas y externas.\r\n', '100 % de las estrategias remédiales aplicadas para los alumnos y cursos que presentan bajos niveles de logro, consideran la información de evaluaciones internas y externas, más una evaluación de impacto de las estrategias aplicadas.\r\n', 20),
(56, 1, '% de acciones del proceso de selección y admisión implementadas en el plazo correspondiente (calendario de exámenes, evaluación, informes de resultados, etc.)\n', '79 % o menos de las acciones del proceso de selección y admisión son implementadas en el plazo correspondiente (calendario de exámenes, evaluación, informes de resultados, etc.)\r\n', '80% a 89 % de las acciones del proceso de selección y admisión son implementadas en el plazo correspondiente (calendario de exámenes, evaluación, informes de resultados, etc.)\r\n', '90% a 99% de las acciones del proceso de selección y admisión son implementadas en el plazo correspondiente (calendario de exámenes, evaluación, informes de resultados, etc.)\r\n', '100 % de las acciones del proceso de selección y admisión son implementadas en el plazo correspondiente (calendario de exámenes, evaluación, informes de resultados, etc.), más una evaluación del proceso realizado\r\n', 15),
(57, 1, 'N° de reuniones con profesores Jefes para monitorear a su curso, dejando constancia de la temática tratada.\n', '2 o menos reuniones con profesores Jefes al semestre para monitorear a su curso, dejando constancia de la temática tratada.\r\n', '3 reuniones con profesores Jefes al semestre para monitorear a su curso, dejando constancia de la temática tratada.\r\n', '4 reuniones con profesores Jefes al semestre para monitorear a su curso, dejando constancia de la temática tratada.\r\n', '5o más reuniones con profesores Jefes al semestre para monitorear a su curso, dejando constancia de la temática tratada.\r\n', 10);
INSERT INTO `indicadores` (`id`, `meta_id`, `descripcion`, `no_cumplido`, `minimo`, `esperado`, `sobre_esperado`, `ponderacion`) VALUES
(58, 2, '% de talleres para padres planificados y modelados a los profesores Jefes , que fomentan la formación integral, valórica y espiritual de los estudiantes y sus familias\r\n', '79% o menos de los talleres para padres son planificados y modelados a los profesores Jefes , que fomentan la formación integral, valórica y espiritual de los estudiantes y sus familias\r\n', '80% a 89% de los talleres para padres son planificados y modelados a los profesores Jefes , que fomentan la formación integral, valórica y espiritual de los estudiantes y sus familias\r\n', '90% a 99% de los talleres para padres son planificados y modelados a los profesores Jefes , que fomentan la formación integral, valórica y espiritual de los estudiantes y sus familias\r\n', '100% de los talleres para padres son planificados y modelados a los Profesores Jefes, que fomentan la formación integral, valórica y espiritual de los estudiantes y sus familias, más una propuesta para evaluar los talleres.\r\n', 10),
(59, 2, '% de implementación del Plan de Orientación en cada nivel, en coordinación con Profesores Jefes.\r\n', '69 % o menos del Plan de Orientación en cada nivel es implementado, en coordinación con Profesores Jefes.\r\n', '70% a 79% del Plan de Orientación en cada nivel es implementado, en coordinación con Profesores Jefes.\r\n', '80 % a 89% del Plan de Orientación en cada nivel es implementado, en coordinación con Profesores Jefes.\r\n', '90% al 100 % del Plan de Orientación en cada nivel es implementado, en coordinación con Profesores Jefes, más una propuesta de mejora de los planes para el año siguiente.\r\n', 10),
(60, 3, '% de acciones realizadas para la motivación a la prueba SIMCE que se realizan considerando las necesidades de los alumnos y los objetivos formativos del colegio.\n', 'En 79% o menos de las acciones realizadas para la motivación a la prueba SIMCE que se realizan, se considerando las necesidades de los alumnos y los objetivos formativos del colegio.\r\n', 'En 80% a 89 % de las acciones realizadas para la motivación a la prueba SIMCE que se realizan, se considerando las necesidades de los alumnos y los objetivos formativos del colegio.\r\n', 'En 90% a 99 % de las acciones realizadas para la motivación a la prueba SIMCE que se realizan, se considerando las necesidades de los alumnos y los objetivos formativos del colegio.\r\n', 'En 100 % de las acciones realizadas para la motivación a la prueba SIMCE que se realizan, se considerando las necesidades de los alumnos y los objetivos formativos del colegio, más una evaluación de las acciones realizadas.\r\n', 15),
(61, 3, '% de estrategias de apoyo solicitadas en reuniones de seguimiento de curso con profesores jefes, que son efectivamente desarrolladas en el semestre para los alumnos con dificultades conductuales y socioemocionales (derivaciones con especialistas externos, intervención grupal y/o individual, acuerdos trabajo familia colegio, etc.)\n', '70% a 80% de las estrategias de apoyo solicitadas en reuniones de seguimiento de curso con profesores jefes, son efectivamente desarrolladas en el semestre para los alumnos con dificultades conductuales y emocionales\r\n', '81% a 90% de las estrategias de apoyo solicitadas en reuniones de seguimiento de curso con profesores jefes, son efectivamente desarrolladas en el semestre para los alumnos con dificultades conductuales y emocionales (derivaciones con especialistas externos, intervención grupal y/o individual, acuerdos trabajo familia colegio, etc.)\r\n', '91% a 99% de las estrategias de apoyo solicitadas en reuniones de seguimiento de curso con profesores jefes, son efectivamente desarrolladas en el semestre para los alumnos con dificultades conductuales y emocionales (derivaciones con especialistas externos, intervención grupal y/o individual, acuerdos trabajo familia colegio, etc.)\r\n', '100% de las estrategias de apoyo solicitadas en reuniones de seguimiento de curso con profesores jefes, son efectivamente desarrolladas en el semestre para los alumnos con dificultades conductuales y emocionales, más una evaluación de impacto de las estrategias de apoyo al finalizar el año escolar (derivaciones con especialistas externos, intervención grupal y/o individual, acuerdos trabajo familia colegio, etc.)\r\n', 20),
(62, 2, '% de actividades realizadas para la formación integral, de acuerdo a los lineamientos y solicitudes de Dirección, en coordinación con equipo de gestión (inicio del año, celebraciones institucionales, etc.)\r\n', '70 al 79% o menos de las actividades para la formación integral, son realizadas de acuerdo a los lineamientos y solicitudes de Dirección, en coordinación con equipo de gestión. (inicio del año, celebraciones institucionales, etc.)\r\n', '80% a 89% de las actividades para la formación integral, son realizadas de acuerdo a los lineamientos y solicitudes de Dirección, en coordinación con equipo de gestión. (inicio del año, celebraciones institucionales, etc.)\r\n', '90% al 99% de las actividades para la formación integral, son realizadas de acuerdo a los lineamientos y solicitudes de Dirección, en coordinación con equipo de gestión. (inicio del año, celebraciones institucionales, etc.)\r\n', '100 % de las actividades para la formación integral, son realizadas de acuerdo a los lineamientos y solicitudes de Dirección, en coordinación con equipo de gestión, más una evaluación de las actividades realizadas. (inicio del año, celebraciones institucionales, etc.),\r\n', 20),
(63, 2, '% de acciones realizadas de orientación vocacional y de preparación para la PSU, considerando los intereses de los alumnos y los objetivos formativos del colegio (charlas de Educación Superior, inscripción al DEMRE, estadísticas, etc).\r\n', '79% o menos de las acciones realizadas de orientación vocacional y de preparación para la PSU, consideran los intereses de los alumnos y los objetivos formativos del colegio ( charlas de Educación Superior, inscripción al DEMRE, estadísticas, etc).\r\n', '80% a 89 % de las acciones realizadas de orientación vocacional y de preparación para la PSU, consideran los intereses de los alumnos y los objetivos formativos del colegio (charlas de Educación Superior, inscripción al DEMRE, estadísticas, etc).\r\n', '90% a 99 % de las acciones realizadas de orientación vocacional y de preparación para la PSU, consideran los intereses de los alumnos y los objetivos formativos del colegio (charlas de Educación Superior, inscripción al DEMRE, estadísticas, etc).\r\n', '100 % de las acciones realizadas de orientación vocacional y de preparación para la PSU, consideran los intereses de los alumnos y los objetivos formativos del colegio. (Charlas de Educación Superior, inscripción al DEMRE, estadísticas, etc), más una evaluación de las acciones realizadas.\r\n', 10),
(64, 3, 'Registro de asistencia, contenidos, actividades, calificaciones y observaciones de alumnos actualizada, en la carpeta de su ACLE\n', 'Registro de asistencia, contenidos, actividades, calificaciones y observaciones de los alumnos actualizados cada dos meses, en la carpeta de su ACLE\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones y observaciones de los alumnos actualizados mensualmente, en la carpeta de su ACLE que el docente debe completar.\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones y observaciones de los alumnos, actualizados quincenalmente, en la carpeta de su ACLE que el docente debe completar.\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones y observaciones de los alumnos, actualizados semanalmente, en la carpeta de su ACLE que el docente debe completar.\r\n', 10),
(65, 2, '% de estrategias implementadas a tiempo, para apoyar los alumnos en la preparación de la muestra final de Acle y/ o participación en torneos amistosos y/o competitivos.\n', '79% o menos de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos en la preparación de la muestra final de Acle y/ o participación en torneos amistosos y/o competitivos.\r\n', '80% a 99% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos en la preparación de la muestra final de Acle y/ o participación en torneos amistosos y/o competitivos.\r\n', '100% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos en la preparación de la muestra final de Acle y/ o participación en torneos amistosos y/o competitivos.\r\n', '100% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos en la preparación de la muestra final de Acle y/ o participación en torneos amistosos y/o competitivos, más una evaluación de impacto de las estrategias implementadas.\r\n', 20),
(66, 2, '% de cronograma anual elaborado y aprobado, según los plazos establecidos, de acuerdo a los requerimientos y los lineamientos pedagógicos de cada acle y del colegio. (incorporando Carta de presentación del Acle, * registro del montaje de la exposición informativa Acle)\r\n', '79% o menos de las planificaciones anuales son elaboradas y aprobadas, según los plazos establecidos, de acuerdo a los requerimientos y los lineamientos pedagógicos de cada ACLE y del colegio.\r\n', '80% a 99% de las planificaciones anuales son elaboradas y aprobadas, según los plazos establecidos, de acuerdo a los requerimientos y los lineamientos pedagógicos de cada ACLE y del colegio.\r\n', '100% de las planificaciones anuales son elaboradas y aprobadas, según los plazos establecidos, de acuerdo a los requerimientos y los lineamientos pedagógicos de cada ACLE y del colegio.\r\n', '100% de las planificaciones anuales son elaboradas y aprobadas, según los plazos establecidos, de acuerdo a los requerimientos y los lineamientos pedagógicos de cada ACLE y del colegio, más una propuesta de ajuste a las planificaciones según necesidad.\r\n', 30),
(67, 3, '% de instrumentos de evaluación, diagnósticos, informes deportivos y citaciones, son entregados en los plazos correspondientes y aprobados por el Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de las actividades Curriculares de libre Elección.\r\n', '79% o menos de los instrumentos de evaluación, diagnósticos, informes deportivos y citaciones, son entregados en los plazos correspondientes y aprobados por el Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de las actividades Curriculares de libre Elección.\r\n', '80% a 99 % de los instrumentos de evaluación, diagnósticos, informes deportivos y citaciones, son entregados en los plazos correspondientes y aprobados por el Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de las actividades Curriculares de libre Elección.\r\n', '100 % % de los instrumentos de evaluación, diagnósticos, informes deportivos y citaciones, son entregados en los plazos correspondientes y aprobados por el Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de las actividades Curriculares de libre Elección.\r\n', '100 % de los instrumentos de evaluación, diagnósticos, informes deportivos y citaciones, son entregados en los plazos correspondientes y aprobados por el Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de las actividades Curriculares de libre Elección, más una propuesta de mejora para el próximo año.\r\n', 20),
(68, 3, '% de las clases observadas que cumplen con los estándares de ACLE y del colegio .\n', '69% o menos de las clases observadas cumplen con los estándares de ACLE y del colegio.\r\n', '70% a 99% de las clases observadas cumplen con los estándares de ACLE y del colegio.\r\n', '90% a 100% de las clases observadas cumplen con los estándares de ACLE y del colegio.\r\n', '100% de las clases observadas cumplen con los estándares de ACLE y del colegio, más una propuesta de mejora de las prácticas de enseñanza en su ACLE.\r\n', 20),
(69, 1, 'Registro de asistencia, contenidos, actividades, calificaciones, observaciones del alumnos y firmas actualizada, en todos los libros de clases que el docente debe completar.\n', 'Registro de asistencia, contenidos, actividades, calificaciones, observaciones de los alumnos y firmas actualizados cada dos meses, en todos los libros de clases que el docente debe completar.\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones, observaciones de los alumnos y firmas actualizados mensualmente, en todos los libros de clases que el docente debe completar.\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones, observaciones de los alumnos y firmas actualizados quincenalmente, en todos los libros de clases que el docente debe completar.\r\n', 'Registro de asistencia, contenidos, actividades, calificaciones, observaciones de los alumnos y firmas actualizados semanalmente, en todos los libros de clases que el docente debe completar.\r\n', 15),
(70, 3, '% de estrategias solicitadas que son implementadas a tiempo, para apoyar los alumnos con dificultades de aprendizaje.\n', '79% o menos de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos con dificultades de aprendizaje.\r\n', '80% a 99% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos con dificultades de aprendizaje.\r\n', '100% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos con dificultades de aprendizaje.\r\n', '100% de las estrategias solicitadas son implementadas a tiempo, para apoyar los alumnos con dificultades de aprendizaje, más una evaluación de impacto de las estrategias implementadas.\r\n', 20),
(71, 3, '% de planificaciones elaboradas y aprobadas, según los plazos establecidos, de acuerdo a las bases curriculares y los lineamientos pedagógicos del colegio.\r\n', '79% o menos de las planificaciones son elaboradas y aprobadas en los plazos establecidos, de acuerdo a las bases curriculares y los lineamientos pedagógicos del colegio.\r\n', '80% a 99% de las planificaciones son elaboradas y aprobadas en los plazos establecidos, de acuerdo a las bases curriculares y los lineamientos pedagógicos del colegio.\r\n', '100% de las planificaciones son elaboradas y aprobadas en los plazos establecidos, de acuerdo a las bases curriculares y los lineamientos pedagógicos del colegio.\r\n', '100% de las planificaciones son elaboradas y aprobadas en los plazos establecidos, de acuerdo a las bases curriculares y los lineamientos pedagógicos del colegio, más una propuesta de ajuste a las planificaciones según necesidad.\r\n', 25),
(72, 3, '% de instrumentos de evaluación y guías de trabajo que son entregados en los plazos correspondientes y aprobados por Jefe de Ciclo, Psicopedagoga, y/o Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de Evaluación.\n', '79% o menos de los instrumentos de evaluación y guías de trabajo son entregados en los plazos correspondientes y aprobados por Jefe de Ciclo , Psicopedagoga, y/o Jefe de Departamento, , de acuerdo a los lineamientos pedagógicos y/o al Reglamento de Evaluación.\r\n', '80% a 99 % de los instrumentos de evaluación y guías de trabajo son entregados en los plazos correspondientes y aprobados por Jefe de Ciclo, Psicopedagoga, y/o Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de Evaluación.\r\n', '100 % de los instrumentos de evaluación y guías de trabajo son entregados en los plazos correspondientes y aprobados por Jefe de Ciclo, Psicopedagoga, y/o Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de Evaluación.\r\n', '100 % de los instrumentos de evaluación y guías de trabajo son entregados en los plazos correspondientes y aprobados por Jefe de Ciclo, Psicopedagoga, y/o Jefe de Departamento, de acuerdo a los lineamientos pedagógicos y/o al Reglamento de Evaluación, más una propuesta de mejora para la elaboración de los instrumentos en la asignatura.\r\n', 20),
(73, 3, '% de las clases observadas que cumplen con los estándares del colegio\n', '69% o menos de las clases observadas cumplen con los estándares del colegio\r\n', '70% a 89% de las clases observadas cumplen con los estándares del colegio\r\n', '90% a 100% de las clases observadas cumplen con los estándares del colegio\r\n', '100% de las clases observadas cumplen con los estándares del colegio, más una propuesta de mejora de las prácticas de enseñanza en su asignatura.\r\n', 20),
(74, 1, '% de remplazos y supervisión de alumnos que son cumplidos y ejecutados según los requerimientos del departamento.\r\n', '79% o menos de los remplazos y supervisión de alumnos son cumplidos y ejecutados según los requerimientos del departamento.\r\n', '80% a 99% de los remplazos y supervisión de alumnos son cumplidos y ejecutados según los requerimientos del departamento.\r\n', '100% de los remplazos y supervisión de alumnos son cumplidos y ejecutados según los requerimientos del departamento.\r\n', '100% de los remplazos y supervisión de alumnos son cumplidos y ejecutados según los requerimientos del departamento, más un informe semestral al Jefe de Ciclo y UTP de los remplazos realizados\r\n', 10),
(75, 3, '% de informes realizados que cumplen con los plazos establecidos y los requerimientos solicitados para el seguimiento de los procesos de aprendizaje. (estadísticas con datos por cursos y nivel de mediciones externas)\r\n', '79% o menos de los informes realizados cumplen con los plazos establecidos y los requerimientos solicitados para el seguimiento de los procesos de aprendizaje. (estadísticas con datos por cursos y nivel de mediciones externas)\r\n', '80% a 99% de los informes realizados cumplen con los plazos establecidos y los requerimientos solicitados para el seguimiento de los procesos de aprendizaje. (estadísticas con datos por cursos y nivel de mediciones externas)\r\n', '100 % de los informes realizados cumplen con los plazos establecidos y los requerimientos solicitados para el seguimiento de los procesos de aprendizaje. (estadísticas con datos por cursos y nivel de mediciones externas)\r\n', '100 % de los informes realizados cumplen con los plazos establecidos y los requerimientos solicitados para el seguimiento de los procesos de aprendizaje. (estadísticas con datos por cursos y nivel de mediciones externas), más una propuesta de mejor uso de de la información para la toma de decisiones.\r\n', 30),
(76, 1, 'N° de estrategias realizadas con alumnos y apoderados para difundir y promover la apropiación de protocolos y procedimientos internos del establecimiento (reglamento de evaluación, convivencia escolar, bullying, atrasos e inasistencias).\r\n', '2 o menos estrategias realizadas con alumnos y apoderados para difundir y promover la apropiación de protocolos y procedimientos internos del establecimiento.\r\n', '3 estrategias realizadas con alumnos y apoderados para difundir y promover la apropiación de protocolos y procedimientos internos del establecimiento.\r\n', '4 estrategias realizadas con alumnos y apoderados para difundir y promover la apropiación de protocolos y procedimientos internos del establecimiento.\r\n', '4 estrategias realizadas con alumnos y apoderados para difundir y promover la apropiación de protocolos y procedimientos internos del establecimiento, más una propuesta de mejora a las estrategias implementadas.\r\n', 10),
(77, 3, '% de estudiantes con estrategias de apoyo que mejoran respecto a su situación inicial, en su rendimiento académico y/o dificultades socio-afectivas o conductuales.\r\n', '3 o menos de los estudiantes con estrategias de apoyo mejoran respecto a su situación inicial, en su rendimiento académico y/o dificultades socio-afectivas o conductuales.\r\n', '4 a 6 de los estudiantes con estrategias de apoyo mejoran respecto a su situación inicial, en su rendimiento académico y/o dificultades socio-afectivas o conductuales.\r\n', '7 a 10 de los estudiantes con estrategias de apoyo mejoran respecto a su situación inicial, en su rendimiento académico y/o dificultades socio-afectivas o conductuales.\r\n', '10 o más de los estudiantes con estrategias de apoyo mejoran respecto a su situación inicial, en su rendimiento académico y/o dificultades socio-afectivas o conductuales, más una evaluación de las estrategias implementadas\r\n', 25),
(78, 1, 'Apoderados de su curso entrevistados en el año para informar aspectos relevantes del colegio, comunicar avances de los alumnos y/o realizar seguimiento de caso.\r\n', 'No todos los apoderados de su curso son entrevistados una vez al año para informar aspectos relevantes del colegio, comunicar avances de los alumnos y/o realizar seguimiento de caso.\r\n', 'No todos los apoderados de su curso son entrevistados dos veces al año para informar aspectos relevantes del colegio, comunicar avances de los alumnos y/o realizar seguimiento de caso.\r\n', 'Todos los apoderados de su curso son entrevistados dos veces al año para informar aspectos relevantes del colegio, comunicar avances de los alumnos y/o realizar seguimiento de caso.\r\n', 'Todos los apoderados de su curso son entrevistados dos veces al año para informar aspectos relevantes del colegio, comunicar avances de los alumnos y/o realizar seguimiento de caso, más entrevistas extras de seguimiento a los apoderados de los estudiantes que lo requieran.\r\n', 15),
(79, 2, '% de actividades y proyectos en los que participa activamente acompañando a su curso, potenciando su formación integral (misa, hitos, salidas pedagógicas y solidarias, oración de la mañana, semana del colegio)\r\n', 'Participa activamente acompañando a su curso y potenciando su formación integral en un 79% o menos de las actividades y proyectos escolares.\r\n', 'Participa activamente acompañando a su curso y potenciando su formación integral en un 80% a 89% % de las actividades y proyectos escolares.\r\n', 'Participa activamente acompañando a su curso y potenciando su formación integral en un 90% a 100% % de las actividades y proyectos escolares.\r\n', 'Participa activamente acompañando a su curso y potenciando su formación integral en un 90% a 100% % de las actividades y proyectos escolares, más una propuesta para mejorar las actividades escolares.\r\n', 15),
(80, 2, '% de estrategias acordadas con el equipo de gestión de ciclo que son aplicadas para detectar, apoyar e informar a los apoderados y/o alumnos sobre aspectos intelectuales, emocionales, físicos y conductuales que interfieren en el proceso de enseñanza-aprendizaje de los estudiantes.\r\n', '59% o menos de las estrategias acordadas con el equipo de gestión de ciclo son aplicadas a tiempo para detectar, apoyar e informar a los apoderados y/o alumnos sobre aspectos intelectuales, emocionales, físicos y conductuales que interfieren en el proceso de enseñanza-aprendizaje de los estudiantes.\r\n', '60% a 89% de las estrategias acordadas con el equipo de gestión de ciclo son aplicadas a tiempo para detectar, apoyar e informar a los apoderados y/o alumnos sobre aspectos intelectuales, emocionales, físicos y conductuales que interfieren en el proceso de enseñanza-aprendizaje de los estudiantes.\r\n', '90% a 100 % de las estrategias acordadas con el equipo de gestión de ciclo son aplicadas a tiempo para detectar, apoyar e informar a los apoderados y/o alumnos sobre aspectos intelectuales, emocionales, físicos y conductuales que interfieren en el proceso de enseñanza-aprendizaje de los estudiantes.\r\n', '100 % de las estrategias acordadas con el equipo de gestión de ciclo son aplicadas a tiempo para detectar, apoyar e informar a los apoderados y/o alumnos sobre aspectos intelectuales, emocionales, físicos y conductuales que interfieren en el proceso de enseñanza-aprendizaje de los estudiantes, más una evaluación de las estrategias aplicadas.\r\n', 20),
(81, 2, 'Plan de jefatura de curso elaborado, implementado y evaluado durante el año escolar 2016, considerando el levantamiento de un diagnóstico y desarrollo de los objetivos académicos y formativos.\r\n', 'Plan de jefatura de curso elaborado y entregado en julio, considerando el levantamiento de un diagnóstico y desarrollo de los objetivos académicos y formativos, y evaluado al término de cada semestre.\r\n', 'Plan de jefatura de curso elaborado y entregado en junio, considerando el levantamiento de un diagnóstico y desarrollo de los objetivos académicos y formativos, y evaluado al término de cada semestre.\r\n', 'Plan de jefatura de curso elaborado y entregado en mayo, considerando el levantamiento de un diagnóstico y desarrollo de los objetivos académicos y formativos y evaluados al término de cada semestre.\r\n', 'Plan de jefatura de curso elaborado y entregado en mayo, considerando el levantamiento de un diagnóstico y desarrollo de los objetivos académicos y formativos, más un propuesta de mejoramiento para la elaboración de los planes de jefatura.\r\n', 15),
(82, 3, '% de alumnos con dificultades conductuales y/o socio-afectivas detectados que son atendidos entregando información al profesor jefe y/o derivados a especialistas, coordinando el seguimiento que corresponda.\r\n', '79% o menos de los alumnos con dificultades conductuales y/o socio-afectivas detectados son atendidos entregando información al profesor jefe y/o derivados a especialistas, coordinando el seguimiento que corresponda.\r\n', '80% a 99% de los alumnos con dificultades conductuales y/o socio-afectivas detectados son atendidos entregando información al profesor jefe y/o derivados a especialistas, coordinando el seguimiento que corresponda.\r\n', '100% de los alumnos con dificultades conductuales y/o socio-afectivas detectados son atendidos entregando información al profesor jefe y/o derivados a especialistas, coordinando el seguimiento que corresponda.\r\n', '100% de los alumnos con dificultades conductuales y/o socio-afectivas detectados son atendidos entregando información al profesor jefe y/o derivados a especialistas, coordinando el seguimiento que corresponda, más un reporte de seguimiento de los alumnos al Jefe de Ciclo, en Consejo de Profesores\r\n', 25),
(83, 3, '% de padres y/o apoderados de los alumnos derivados que son entrevistados para entregarles información de la evaluación y dar sugerencias de estrategias a aplicar.\r\n', '79% o menos de los padres y/o apoderados de los alumnos derivados son entrevistados, para entregarles información de la evaluación y dar sugerencias de estrategias a aplicar.\r\n', '80% a 99% de los padres y/o apoderados de los alumnos derivados son entrevistados para entregarles información de la evaluación y dar sugerencias de estrategias a aplicar.\r\n', '100 % de los padres y/o apoderados de los alumnos derivados son entrevistados para entregarles información de la evaluación y dar sugerencias de estrategias a aplicar.\r\n', '100 % de los padres y/o apoderados de los alumnos derivados son entrevistados para entregarles información de la evaluación y dar sugerencias de estrategias a aplicar, más un seguimiento a través de los profesores jefes.\r\n', 15),
(84, 3, '% talleres socio-educativos grupales implementados y evaluados, de acuerdo a las solicitudes recibidas de los Profesores Jefes.\r\n', '79% o menos de los talleres socio-educativos grupales son implementados y evaluados, de acuerdo a las solicitudes recibidas de los Profesores Jefes.\r\n', '80% a 99% de los talleres socio-educativos grupales son implementados y evaluados, de acuerdo a las solicitudes recibidas de los Profesores Jefes.\r\n', '100% de los talleres socio-educativos grupales son implementados y evaluados, de acuerdo a las solicitudes recibidas de los Profesores Jefes.\r\n', '100% de los talleres socio-educativos grupales son implementados y evaluados, de acuerdo a las solicitudes recibidas de los Profesores Jefes, más un reporte en entrevista de profesor jefe y un reporte general a Jefa de Ciclo.\r\n', 15),
(85, 1, '% de conflictos abordados e informados a tiempo de acuerdo al protocolo de Maltrato y Abuso Sexual Infantil y/o directrices del Manual de Convivencia Escolar.\n', '79% o menos de los conflictos son abordados e informados a tiempo de acuerdo al protocolo de Maltrato y Abuso Sexual Infantil y/o directrices del Manual de Convivencia Escolar.\r\n', '80% a 99% de los conflictos son abordados e informados a tiempo de acuerdo al protocolo de Maltrato y Abuso Sexual Infantil y/o directrices del Manual de Convivencia Escolar.\r\n', '100% de los conflictos son abordados e informados a tiempo de acuerdo al protocolo de Maltrato y Abuso Sexual Infantil y/o directrices del Manual de Convivencia Escolar.\r\n', '100 % de los conflictos son abordados e informados a tiempo de acuerdo al protocolo de Maltrato y Abuso Sexual Infantil y/o directrices del Manual de Convivencia Escolar, más la actualización de los temas año a año con los profesores.\r\n', 20),
(86, 1, '% de estrategias de intervención para padres y/o apoderados implementadas según las necesidades de los ciclos.\r\n', '79% o menos de las estrategias de intervención para padres y/o apoderados son implementadas según las necesidades de los ciclos.\r\n', '80% a 99% de las estrategias de intervención para padres y/o apoderados son implementadas según las necesidades de los ciclos.\r\n', '100% de las estrategias de intervención para padres y/o apoderados son implementadas según las necesidades de los ciclos.\r\n', '100 % de las estrategias de intervención para padres y/o apoderados son implementadas según las necesidades de los ciclos, más un seguimiento de las estrategias implementadas, en entrevista con los profesores jefes.\r\n', 15),
(87, 3, '% de acciones de coordinación con redes internas y/o externas para la gestión de casos y/o actividades al interior del establecimiento realizadas de acuerdo a los lineamientos institucionales.\r\n', '79% o menos de las acciones de coordinación con redes internas y/o externas para la gestión de casos y/o actividades al interior del establecimiento son realizadas de acuerdo a los lineamientos institucionales.\r\n', '80% a 99% de las acciones de coordinación con redes internas y/o externas para la gestión de casos y/o actividades al interior del establecimiento son realizadas de acuerdo a los lineamientos institucionales.\r\n', '100 % de las acciones de coordinación con redes internas y/o externas para la gestión de casos y/o actividades al interior del establecimiento son realizadas de acuerdo a los lineamientos institucionales.\r\n', '100 % de las acciones de coordinación con redes internas y/o externas para la gestión de casos y/o actividades al interior del establecimiento, son realizadas de acuerdo a los lineamientos institucionales, más una propuesta para la mejora de acciones de coordinación.\r\n', 10),
(88, 3, '% de alumnos que fueron derivados por el profesor jefe y son atendidos a través de un plan de acción especifico, realizando un seguimiento en conjunto con la familia.\r\n', '79% o menos de los alumnos que fueron derivados por el profesor jefe y son atendidos a través de un plan de acción específico, realizando un seguimiento en conjunto con la familia.\r\n', '80% a 99% de los alumnos que fueron derivados por el profesor jefe y son atendidos a través de un plan de acción específico, realizando un seguimiento en conjunto con la familia.\r\n', '100% de los alumnos que fueron derivados por el profesor jefe y son atendidos a través de un plan de acción específico, realizando un seguimiento en conjunto con la familia.\r\n', '100% de los alumnos que fueron derivados por el profesor jefe y son atendidos a través de un plan de acción específico, realizando un seguimiento en conjunto con la familia, más una evaluación de los planes de acción implementados.\r\n', 25),
(89, 3, '% de alumnos tratados por especialistas externos con los cuáles se realiza un seguimiento a través de un trabajo articulado con el colegio.\r\n', '79% o menos de los alumnos con tratamiento con especialistas externos reciben un seguimiento a través de un trabajo articulado con el colegio.\r\n', '80% a 99% de los alumnos con tratamiento con especialistas externos reciben un seguimiento a través de un trabajo articulado con el colegio.\r\n', '100 % de los alumnos con tratamiento con especialistas externos reciben un seguimiento a través de un trabajo articulado con el colegio.\r\n', '100 % de los alumnos con tratamiento con especialistas externos reciben un seguimiento a través de un trabajo articulado con el colegio, más una propuesta para optimar el apoyo a los alumnos.\r\n', 20),
(90, 3, 'Elaboración e implementación de diferentes estrategias para la potenciación del aprendizaje de los alumnos de cada ciclo.\r\n', 'Elaboración de estrategias para la potenciación del aprendizaje de los alumnos en Mayo e implementados en el transcurso del año escolar.\r\n', 'Elaboración de estrategias para la potenciación del aprendizaje de los alumnos en Abril e implementados en el transcurso del año escolar.\r\n', 'Elaboración de estrategias para la potenciación del aprendizaje de los alumnos en Marzo e implementados en el transcurso del año escolar.\r\n', 'Elaboración de estrategias para la potenciación del aprendizaje de los alumnos en Marzo e implementados en el transcurso del año escolar, más una propuesta de mejora de las estrategias para el siguiente año.\r\n', 20),
(91, 3, 'Implementación de adecuaciones curriculares y/o talleres para la atención de alumnos con NEE.\r\n', 'Implementación de adecuaciones curriculares y/o talleres para la atención de alumnos con NEE a partir del mes de Junio.\r\n', 'Implementación de adecuaciones curriculares y/o talleres para la atención de alumnos con NEE a partir del mes de Mayo.\r\n', 'Implementación de adecuaciones curriculares y/o talleres para la atención de alumnos con NEE a partir del mes de Abril.\r\n', 'Implementación de adecuaciones curriculares y/o talleres para la atención de alumnos con NEE a partir del mes de Abril, más una propuesta de mejora para las adecuaciones curriculares y/o talleres.\r\n', 20),
(92, 3, '% de jornadas, charlas y/o talleres realizadas para docentes, padres y apoderados que apunten a la entrega de estrategias de apoyo para los alumnos con NEE, según requerimientos y criterios (objetivos, temáticas, etcétera) solicitados por el establecimiento.\r\n', '79% o menos de jornadas, charlas y/o talleres realizadas para docentes, padres y apoderados que apunten a la entrega de estrategias de apoyo para los alumnos con NEE, según requerimientos y criterios (objetivos, temáticas, etcétera) solicitados por el del establecimiento.\r\n', '80% al 99% de jornadas, charlas y/o talleres realizadas para docentes, padres y apoderados que apunten a la entrega de estrategias de apoyo para los alumnos con NEE, según requerimientos y criterios (objetivos, temáticas, etcétera) solicitados por el establecimiento.\r\n', '100% de jornadas, charlas y/o talleres realizadas para docentes, padres y apoderados que apunten a la entrega de estrategias de apoyo para los alumnos con NEE, según requerimientos y criterios (objetivos, temáticas, etcétera) solicitados por el establecimiento.\r\n', '100% de jornadas, charlas y/o talleres realizadas para docentes, padres y apoderados que apunten a la entrega de estrategias de apoyo para los alumnos con NEE, según requerimientos y criterios (objetivos, temáticas, etcétera) solicitados por el establecimiento, más una evaluación del nivel de satisfacción de los participantes y propuesta para implementar estrategias en el colegio de acuerdo a lo evaluado.\r\n', 15),
(93, 5, 'N° de estrategias implementadas y evaluadas que aseguran la permanencia del alumnado en el establecimiento y que miden la calidad del servicio institucional\n', 'Menos de 4 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que miden la calidad del servicio institucional.\r\n', '4 o 5 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que miden la calidad del servicio institucional.\r\n', '6 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que miden la calidad del servicio institucional.\r\n', 'Más de 6 estrategias implementadas y evaluadas para asegurar la permanencia del alumnado en el establecimiento y que miden la calidad del servicio institucional, más una propuesta de mejora de las estrategias implementadas.\r\n', 20),
(94, 4, 'Sistema de Evaluación del Desempeño, socializado, implementado y con monitoreo en su aplicación, de acuerdo a los procedimientos definidos por el Colegio.\r\n', 'Sistema de Evaluación del Desempeño, socializado, implementado y con monitoreo en su aplicación, de acuerdo a los procedimientos definidos por el Colegio a marzo de 2017\r\n', 'Sistema de Evaluación del Desempeño, socializado, implementado y con monitoreo en su aplicación, de acuerdo a los procedimientos definidos por el Colegio a enero de 2017\r\n', 'Sistema de Evaluación del Desempeño, socializado, implementado y con monitoreo en su aplicación, de acuerdo a los procedimientos definidos por el Colegio a diciembre de 2016\r\n', 'Sistema de Evaluación del Desempeño, socializado, implementado y con monitoreo en su aplicación, de acuerdo a los procedimientos definidos por el Colegio a diciembre de 2016, y una propuesta de mejora para la próxima aplicación\r\n', 10),
(95, 4, 'N° de personas a su cargo, evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor en enero del 2016\r\n', '6 personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor en abril del 2017\r\n', '6 personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor en marzo del 2017\r\n', '6 personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor en enero del 2017\r\n', '6 personas a su cargo son evaluadas y retroalimentadas en sus funciones, con reconocimiento a su labor en enero del 2017, más una propuesta para fortalecer el trabajo del equipo directivo en su conjunto\r\n', 20),
(96, 1, 'N° de estrategias de difusión realizadas oportunamente para mantener informada a la Comunidad escolar a través de distintos medios.\r\n', '3 o menos estrategias de difusión son realizadas oportunamente para mantener informada a la Comunidad escolar a través de distintos medios.\r\n', '4 estrategias de difusión son realizadas oportunamente para mantener informada a la Comunidad escolar a través de distintos medios.\r\n', '5 estrategias de difusión son realizadas oportunamente para mantener informada a la Comunidad escolar a través de distintos medios.\r\n', '5 estrategias de difusión son realizadas oportunamente para mantener informada a la Comunidad escolar a través de distintos medios, más una propuesta de mejoramiento de las estrategias utilizadas.\r\n', 10),
(97, 2, 'N° de acciones realizadas para inducir al personal que se incorpora al establecimiento en los lineamientos del PEI.\r\n', '1 acción realizada para inducir al personal que se incorpora al establecimiento en los lineamientos del PEI.\r\n', '2 acciones realizadas para inducir al personal que se incorpora al establecimiento en los lineamientos del PEI.\r\n', '3 acciones realizadas para inducir al personal que se incorpora al establecimiento en los lineamientos del PEI.\r\n', '3 acciones realizadas para inducir al personal que se incorpora al establecimiento en los lineamientos del PEI, más una propuesta para elaborar un protocolo de Inducción\r\n', 20),
(98, 3, 'N° de acciones para evaluar el logro de aprendizaje, a través de informes y/o reuniones de seguimiento, solicitando análisis de resultados de aprendizaje en mediciones internas y externas, de acuerdo a los Planes y Programas de Estudio de las distintas áreas.\r\n', '1 o 2 acciones al año para evaluar el logro de aprendizaje, a través de informes y/o reuniones de seguimiento, solicitando análisis de resultados de aprendizaje en mediciones internas y externas, de acuerdo a los Planes y Programas de Estudio de las distintas áreas.\r\n', '3 acciones al año para evaluar el logro de aprendizaje, a través de informes y/o reuniones de seguimiento, solicitando análisis de resultados de aprendizaje en mediciones internas y externas, de acuerdo a los Planes y Programas de Estudio de las distintas áreas.\r\n', '4 acciones al año para evaluar el logro de aprendizaje, a través de informes y/o reuniones de seguimiento, solicitando análisis de resultados de aprendizaje en mediciones internas y externas, de acuerdo a los Planes y Programas de Estudio de las distintas áreas.\r\n', '4 acciones al año para evaluar el logro de aprendizaje, a través de informes y/o reuniones de seguimiento, solicitando análisis de resultados de aprendizaje en mediciones internas y externas, de acuerdo a los Planes y Programas de Estudio de las distintas áreas, más una propuesta de mejora a las acciones implementadas\r\n', 10),
(99, 1, 'N° de acciones que coordina con su equipo de dirección para informar la rendición de cuenta académica al Directorio de la Fundación y apoderados.\r\n', '1 o 2 acciones coordinadas con su equipo para informar la rendición de cuenta académica al Directorio de la Fundación y apoderados.\r\n', '3 acciones coordinadas con su equipo para informar la rendición de cuenta académica a Directorio de la Fundación y apoderados.\r\n', '4 acciones coordinadas con su equipo para informar la rendición de cuenta académica a Directorio de la Fundación y apoderados.\r\n', '4 acciones coordinadas con su equipo para informar la rendición de cuenta académica a Directorio de la Fundación y apoderados, más una propuesta para fortalecer la Rendición de cuentas.\r\n', 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `indicador_cargos`
--

CREATE TABLE `indicador_cargos` (
  `indicador_id` int(10) NOT NULL,
  `cargo_id` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `indicador_cargos`
--

INSERT INTO `indicador_cargos` (`indicador_id`, `cargo_id`) VALUES
(1, 2),
(2, 2),
(3, 2),
(4, 2),
(5, 2),
(6, 2),
(7, 2),
(6, 3),
(8, 3),
(9, 3),
(10, 3),
(11, 3),
(12, 3),
(13, 6),
(14, 6),
(15, 6),
(16, 6),
(17, 10),
(18, 10),
(19, 10),
(20, 10),
(21, 10),
(22, 10),
(23, 10),
(14, 11),
(15, 11),
(16, 11),
(24, 11),
(25, 11),
(26, 14),
(27, 14),
(28, 14),
(29, 14),
(30, 14),
(31, 14),
(32, 14),
(23, 15),
(33, 15),
(34, 15),
(35, 15),
(36, 15),
(37, 15),
(38, 17),
(39, 17),
(40, 17),
(41, 17),
(42, 17),
(43, 17),
(44, 18),
(45, 18),
(46, 18),
(47, 18),
(48, 18),
(49, 18),
(38, 19),
(50, 19),
(51, 19),
(52, 19),
(53, 19),
(54, 19),
(55, 19),
(56, 21),
(57, 21),
(58, 21),
(59, 21),
(60, 21),
(61, 21),
(62, 21),
(56, 31),
(57, 31),
(58, 31),
(59, 31),
(60, 31),
(61, 31),
(62, 31),
(63, 31),
(64, 22),
(65, 22),
(66, 22),
(67, 22),
(68, 22),
(70, 24),
(72, 24),
(73, 24),
(74, 24),
(75, 24),
(76, 25),
(77, 25),
(78, 25),
(79, 25),
(80, 25),
(81, 25),
(88, 26),
(89, 26),
(90, 26),
(91, 26),
(92, 26),
(82, 27),
(83, 27),
(84, 27),
(85, 27),
(86, 27),
(87, 27),
(93, 29),
(94, 29),
(95, 29),
(96, 29),
(97, 29),
(98, 29),
(99, 29);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metas`
--

CREATE TABLE `metas` (
  `id` int(10) NOT NULL,
  `descripcion` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `metas`
--

INSERT INTO `metas` (`id`, `descripcion`) VALUES
(1, 'Contribuir al desarrollo de sistemas de gestión de calidad que apunten al mejoramiento continuo'),
(2, 'Potenciar la formación integral, misionera y cristiana de los miembros de la comunidad educativa'),
(3, 'Potenciar los aprendizajes de los alumnos/as asegurando su calidad'),
(4, 'Fortalecer la gestión del personal del colegio promoviendo su crecimiento profesional'),
(5, 'Asegurar la sustentabilidad del Proyecto Educativo institucional');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `opinantes`
--

CREATE TABLE `opinantes` (
  `tipo_id` int(10) NOT NULL,
  `evaluado_id` int(10) NOT NULL,
  `perfil_id` int(11) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `ciclo_id` int(10) NOT NULL,
  `asignatura_id` int(10) NOT NULL,
  `evaluador_id` int(10) NOT NULL,
  `perfil_sup` int(11) NOT NULL,
  `cargo_sup` int(10) NOT NULL,
  `ciclo_sup` int(10) NOT NULL,
  `asignatura_sup` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `opinantes`
--

INSERT INTO `opinantes` (`tipo_id`, `evaluado_id`, `perfil_id`, `cargo_id`, `ciclo_id`, `asignatura_id`, `evaluador_id`, `perfil_sup`, `cargo_sup`, `ciclo_sup`, `asignatura_sup`) VALUES
(1, 2, 1, 13, 0, 0, 2, 1, 13, 0, 0),
(1, 3, 2, 26, 2, 0, 3, 2, 26, 2, 0),
(1, 4, 2, 31, 2, 0, 4, 2, 31, 2, 0),
(1, 5, 2, 3, 3, 0, 5, 2, 3, 3, 0),
(1, 6, 4, 17, 2, 14, 6, 4, 17, 2, 14),
(1, 7, 4, 23, 1, 0, 7, 4, 23, 1, 0),
(1, 7, 4, 25, 1, 0, 7, 4, 25, 1, 0),
(1, 8, 4, 22, 1, 0, 8, 4, 22, 1, 0),
(1, 9, 4, 25, 1, 0, 9, 4, 25, 1, 0),
(1, 9, 4, 23, 1, 0, 9, 4, 23, 1, 0),
(1, 10, 4, 22, 2, 0, 10, 4, 22, 2, 0),
(1, 10, 4, 23, 2, 0, 10, 4, 23, 2, 0),
(1, 10, 4, 25, 2, 0, 10, 4, 25, 2, 0),
(1, 11, 4, 22, 1, 0, 11, 4, 22, 1, 0),
(1, 11, 4, 23, 1, 0, 11, 4, 23, 1, 0),
(1, 12, 4, 23, 3, 0, 12, 4, 23, 3, 0),
(1, 13, 1, 30, 0, 0, 13, 1, 30, 0, 0),
(1, 14, 4, 6, 3, 0, 14, 4, 6, 3, 0),
(1, 15, 4, 22, 0, 0, 15, 4, 22, 0, 0),
(1, 16, 2, 26, 1, 0, 16, 2, 26, 1, 0),
(1, 17, 4, 23, 2, 0, 17, 4, 23, 2, 0),
(1, 17, 4, 25, 2, 0, 17, 4, 25, 2, 0),
(1, 19, 4, 22, 0, 0, 19, 4, 22, 0, 0),
(1, 18, 4, 24, 1, 0, 18, 4, 24, 1, 0),
(1, 20, 4, 23, 2, 0, 20, 4, 23, 2, 0),
(1, 20, 4, 24, 2, 0, 20, 4, 24, 2, 0),
(1, 21, 1, 28, 0, 0, 21, 1, 28, 0, 0),
(1, 22, 4, 23, 2, 0, 22, 4, 23, 2, 0),
(1, 22, 4, 25, 2, 0, 22, 4, 25, 2, 0),
(1, 23, 4, 23, 2, 0, 23, 4, 23, 2, 0),
(1, 23, 4, 25, 2, 0, 23, 4, 25, 2, 0),
(1, 24, 4, 23, 1, 0, 24, 4, 23, 1, 0),
(1, 24, 4, 25, 1, 0, 24, 4, 25, 1, 0),
(1, 25, 4, 11, 3, 0, 25, 4, 11, 3, 0),
(1, 26, 4, 17, 1, 0, 26, 4, 17, 1, 0),
(1, 26, 4, 25, 1, 0, 26, 4, 25, 1, 0),
(1, 27, 4, 11, 3, 0, 27, 4, 11, 3, 0),
(1, 28, 4, 24, 2, 0, 28, 4, 24, 2, 0),
(1, 29, 4, 23, 1, 0, 29, 4, 23, 1, 0),
(1, 29, 4, 25, 1, 0, 29, 4, 25, 1, 0),
(1, 30, 3, 15, 2, 0, 30, 3, 15, 2, 0),
(1, 31, 4, 22, 0, 0, 31, 4, 22, 0, 0),
(1, 32, 4, 11, 3, 0, 32, 4, 11, 3, 0),
(1, 33, 4, 11, 3, 0, 33, 4, 11, 3, 0),
(1, 34, 4, 22, 0, 0, 34, 4, 22, 0, 0),
(1, 35, 4, 23, 1, 0, 35, 4, 23, 1, 0),
(1, 35, 4, 25, 1, 0, 35, 4, 25, 1, 0),
(1, 36, 4, 23, 2, 0, 36, 4, 23, 2, 0),
(1, 37, 4, 5, 1, 0, 37, 4, 5, 1, 0),
(1, 38, 4, 22, 0, 0, 38, 4, 22, 0, 0),
(1, 39, 2, 2, 2, 0, 39, 2, 2, 2, 0),
(1, 40, 4, 23, 2, 0, 40, 4, 23, 2, 0),
(1, 40, 4, 25, 2, 0, 40, 4, 25, 2, 0),
(1, 41, 1, 1, 0, 0, 41, 1, 1, 0, 0),
(1, 42, 4, 11, 3, 0, 42, 4, 11, 3, 0),
(1, 43, 1, 9, 0, 0, 43, 1, 9, 0, 0),
(1, 44, 4, 23, 1, 0, 44, 4, 23, 1, 0),
(1, 44, 4, 25, 1, 0, 44, 4, 25, 1, 0),
(1, 45, 2, 3, 1, 0, 45, 2, 3, 1, 0),
(1, 45, 4, 23, 1, 0, 45, 4, 23, 1, 0),
(1, 46, 1, 30, 0, 0, 46, 1, 30, 0, 0),
(1, 47, 2, 3, 2, 0, 47, 2, 3, 2, 0),
(1, 47, 4, 23, 2, 0, 47, 4, 23, 2, 0),
(1, 48, 4, 23, 1, 0, 48, 4, 23, 1, 0),
(1, 48, 4, 25, 1, 0, 48, 4, 25, 1, 0),
(1, 49, 4, 23, 2, 0, 49, 4, 23, 2, 0),
(1, 49, 4, 24, 2, 0, 49, 4, 24, 2, 0),
(1, 50, 3, 14, 0, 0, 50, 3, 14, 0, 0),
(1, 51, 3, 29, 0, 0, 51, 3, 29, 0, 0),
(1, 52, 2, 3, 2, 0, 52, 2, 3, 2, 0),
(1, 52, 4, 22, 2, 0, 52, 4, 22, 2, 0),
(1, 53, 4, 22, 1, 0, 53, 4, 22, 1, 0),
(1, 54, 4, 23, 2, 0, 54, 4, 23, 2, 0),
(1, 54, 4, 24, 2, 0, 54, 4, 24, 2, 0),
(1, 55, 4, 11, 3, 0, 55, 4, 11, 3, 0),
(1, 56, 4, 23, 1, 0, 56, 4, 23, 1, 0),
(1, 56, 4, 25, 1, 0, 56, 4, 25, 1, 0),
(1, 57, 2, 27, 2, 0, 57, 2, 27, 2, 0),
(1, 58, 4, 23, 1, 0, 58, 4, 23, 1, 0),
(1, 59, 3, 15, 3, 0, 59, 3, 15, 3, 0),
(1, 60, 4, 5, 1, 0, 60, 4, 5, 1, 0),
(1, 62, 4, 22, 0, 0, 62, 4, 22, 0, 0),
(1, 61, 4, 23, 1, 0, 61, 4, 23, 1, 0),
(1, 61, 4, 25, 1, 0, 61, 4, 25, 1, 0),
(1, 63, 2, 3, 3, 0, 63, 2, 3, 3, 0),
(1, 63, 4, 23, 3, 0, 63, 4, 23, 3, 0),
(1, 64, 4, 6, 3, 0, 64, 4, 6, 3, 0),
(1, 65, 4, 23, 2, 0, 65, 4, 23, 2, 0),
(1, 66, 3, 15, 1, 0, 66, 3, 15, 1, 0),
(1, 67, 4, 24, 2, 0, 67, 4, 24, 2, 0),
(1, 68, 4, 23, 1, 0, 68, 4, 23, 1, 0),
(1, 68, 4, 25, 1, 0, 68, 4, 25, 1, 0),
(1, 69, 1, 7, 0, 0, 69, 1, 7, 0, 0),
(1, 70, 2, 26, 3, 0, 70, 2, 26, 3, 0),
(1, 71, 2, 2, 2, 0, 71, 2, 2, 2, 0),
(1, 72, 2, 27, 3, 0, 72, 2, 27, 3, 0),
(1, 73, 1, 16, 0, 0, 73, 1, 16, 0, 0),
(1, 73, 4, 17, 0, 0, 73, 4, 17, 0, 0),
(1, 74, 4, 17, 2, 0, 74, 4, 17, 2, 0),
(1, 75, 4, 23, 2, 0, 75, 4, 23, 2, 0),
(1, 74, 4, 25, 2, 0, 74, 4, 25, 2, 0),
(1, 76, 4, 22, 1, 0, 76, 4, 22, 1, 0),
(1, 77, 4, 23, 2, 0, 77, 4, 23, 2, 0),
(1, 77, 4, 24, 2, 0, 77, 4, 24, 2, 0),
(1, 78, 4, 19, 1, 0, 78, 4, 19, 1, 0),
(1, 79, 1, 12, 0, 0, 79, 1, 12, 0, 0),
(1, 80, 4, 23, 1, 0, 80, 4, 23, 1, 0),
(1, 80, 4, 25, 1, 0, 80, 4, 25, 1, 0),
(1, 81, 4, 6, 3, 0, 81, 4, 6, 3, 0),
(1, 82, 4, 23, 1, 0, 82, 4, 23, 1, 0),
(1, 83, 4, 22, 0, 0, 83, 4, 22, 0, 0),
(1, 84, 4, 23, 2, 0, 84, 4, 23, 2, 0),
(1, 84, 4, 25, 2, 0, 84, 4, 25, 2, 0),
(1, 85, 4, 6, 3, 0, 85, 4, 6, 3, 0),
(1, 86, 4, 17, 2, 0, 86, 4, 17, 2, 0),
(1, 87, 4, 6, 3, 0, 87, 4, 6, 3, 0),
(1, 88, 4, 23, 2, 0, 88, 4, 23, 2, 0),
(1, 89, 2, 3, 2, 0, 89, 2, 3, 2, 0),
(1, 89, 4, 23, 2, 0, 89, 4, 23, 2, 0),
(1, 90, 4, 17, 2, 0, 90, 4, 17, 2, 0),
(1, 90, 4, 25, 2, 0, 90, 4, 25, 2, 0),
(1, 91, 3, 10, 0, 0, 91, 3, 10, 0, 0),
(1, 92, 1, 9, 0, 0, 92, 1, 9, 0, 0),
(1, 93, 3, 18, 0, 0, 93, 3, 18, 0, 0),
(1, 94, 4, 23, 1, 0, 94, 4, 23, 1, 0),
(1, 95, 4, 23, 1, 0, 95, 4, 23, 1, 0),
(1, 96, 2, 21, 1, 0, 96, 2, 21, 1, 0),
(1, 97, 2, 27, 1, 0, 97, 2, 27, 1, 0),
(1, 98, 4, 22, 0, 0, 98, 4, 22, 0, 0),
(1, 98, 4, 23, 2, 0, 98, 4, 23, 2, 0),
(1, 99, 4, 6, 3, 0, 99, 4, 6, 3, 0),
(1, 100, 1, 20, 0, 0, 100, 1, 20, 0, 0),
(1, 101, 4, 17, 2, 0, 101, 4, 17, 2, 0),
(1, 102, 1, 9, 0, 0, 102, 1, 9, 0, 0),
(1, 103, 4, 23, 2, 0, 103, 4, 23, 2, 0),
(1, 103, 4, 25, 2, 0, 103, 4, 25, 2, 0),
(1, 104, 2, 2, 1, 0, 104, 2, 2, 1, 0),
(1, 104, 4, 22, 0, 0, 104, 4, 22, 0, 0),
(1, 105, 4, 23, 2, 0, 105, 4, 23, 2, 0),
(1, 106, 1, 30, 0, 0, 106, 1, 30, 0, 0),
(1, 107, 1, 8, 0, 0, 107, 1, 8, 0, 0),
(1, 108, 2, 2, 1, 0, 108, 2, 2, 1, 0),
(1, 109, 4, 23, 2, 0, 109, 4, 23, 2, 0),
(1, 109, 4, 25, 2, 0, 109, 4, 25, 2, 0),
(1, 110, 1, 9, 0, 0, 110, 1, 9, 0, 0),
(1, 111, 1, 9, 0, 0, 111, 1, 9, 0, 0),
(1, 112, 1, 4, 0, 0, 112, 1, 4, 0, 0),
(1, 112, 4, 23, 2, 0, 112, 4, 23, 2, 0),
(1, 113, 4, 23, 2, 0, 113, 4, 23, 2, 0),
(1, 114, 4, 11, 3, 0, 114, 4, 11, 3, 0),
(1, 114, 4, 22, 0, 0, 114, 4, 22, 0, 0),
(1, 115, 4, 23, 2, 0, 115, 4, 23, 2, 0),
(1, 115, 4, 25, 2, 0, 115, 4, 25, 2, 0),
(2, 2, 1, 13, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 2, 1, 13, 0, 0),
(2, 3, 2, 26, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 3, 2, 26, 2, 0),
(2, 4, 2, 31, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 4, 2, 31, 2, 0),
(2, 5, 2, 3, 3, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 5, 2, 3, 3, 0),
(2, 6, 4, 17, 2, 14, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 6, 4, 17, 2, 14),
(2, 7, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 7, 4, 23, 1, 0),
(2, 7, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 7, 4, 25, 1, 0),
(2, 8, 4, 22, 1, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 8, 4, 22, 1, 0),
(2, 9, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 9, 4, 23, 1, 0),
(2, 9, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 9, 4, 25, 1, 0),
(2, 10, 4, 22, 2, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 10, 4, 22, 2, 0),
(2, 10, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 10, 4, 25, 2, 0),
(2, 11, 4, 22, 1, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 11, 4, 22, 1, 0),
(2, 11, 4, 23, 1, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 11, 4, 23, 1, 0),
(2, 12, 4, 23, 3, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 12, 4, 23, 3, 0),
(2, 13, 1, 30, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 13, 1, 30, 0, 0),
(2, 14, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 14, 4, 6, 3, 0),
(2, 15, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 15, 4, 22, 0, 0),
(2, 16, 2, 26, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 16, 2, 26, 1, 0),
(2, 17, 4, 23, 2, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 17, 4, 23, 2, 0),
(2, 17, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 17, 4, 25, 2, 0),
(2, 19, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 19, 4, 22, 0, 0),
(2, 18, 4, 24, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 18, 4, 24, 1, 0),
(2, 20, 4, 23, 2, 0, 90, 4, 17, 2, 0),
(3, 90, 4, 17, 2, 0, 20, 4, 23, 2, 0),
(2, 20, 4, 24, 2, 0, 90, 4, 17, 2, 0),
(3, 90, 4, 17, 2, 0, 20, 4, 24, 2, 0),
(2, 21, 1, 28, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 21, 1, 28, 0, 0),
(2, 22, 4, 23, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 22, 4, 23, 2, 0),
(2, 22, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 22, 4, 25, 2, 0),
(2, 23, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 23, 4, 23, 2, 0),
(2, 23, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 23, 4, 25, 2, 0),
(2, 24, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 24, 4, 23, 1, 0),
(2, 24, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 24, 4, 25, 1, 0),
(2, 25, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 25, 4, 11, 3, 0),
(2, 26, 4, 17, 1, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 26, 4, 17, 1, 0),
(2, 26, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 26, 4, 25, 1, 0),
(2, 27, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 27, 4, 11, 3, 0),
(2, 28, 4, 24, 2, 0, 74, 4, 17, 2, 0),
(3, 74, 4, 17, 2, 0, 28, 4, 24, 2, 0),
(2, 29, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 29, 4, 23, 1, 0),
(2, 29, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 29, 4, 25, 1, 0),
(2, 30, 3, 15, 2, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 30, 3, 15, 2, 0),
(2, 31, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 31, 4, 22, 0, 0),
(2, 32, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 32, 4, 11, 3, 0),
(2, 33, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 33, 4, 11, 3, 0),
(2, 34, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 34, 4, 22, 0, 0),
(2, 35, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 35, 4, 23, 1, 0),
(2, 35, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 35, 4, 25, 1, 0),
(2, 36, 4, 23, 2, 0, 74, 4, 17, 2, 0),
(3, 74, 4, 17, 2, 0, 36, 4, 23, 2, 0),
(2, 37, 4, 5, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 37, 4, 5, 1, 0),
(2, 38, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 38, 4, 22, 0, 0),
(2, 39, 2, 2, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 39, 2, 2, 2, 0),
(2, 40, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 40, 4, 23, 2, 0),
(2, 40, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 40, 4, 25, 2, 0),
(2, 41, 1, 1, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 41, 1, 1, 0, 0),
(2, 42, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 42, 4, 11, 3, 0),
(2, 43, 1, 9, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 43, 1, 9, 0, 0),
(2, 44, 4, 23, 1, 0, 74, 4, 17, 2, 0),
(3, 74, 4, 17, 2, 0, 44, 4, 23, 1, 0),
(2, 44, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 44, 4, 25, 1, 0),
(2, 45, 2, 3, 1, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 45, 2, 3, 1, 0),
(2, 45, 4, 23, 1, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 45, 4, 23, 1, 0),
(2, 46, 1, 30, 0, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 46, 1, 30, 0, 0),
(2, 47, 2, 3, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 47, 2, 3, 2, 0),
(2, 47, 2, 3, 2, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 47, 2, 3, 2, 0),
(2, 48, 4, 23, 1, 0, 26, 4, 17, 1, 0),
(3, 26, 4, 17, 1, 0, 48, 4, 23, 1, 0),
(2, 48, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 48, 4, 25, 1, 0),
(2, 49, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 49, 4, 23, 2, 0),
(2, 49, 4, 24, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 49, 4, 24, 2, 0),
(2, 50, 3, 14, 0, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 50, 3, 14, 0, 0),
(2, 51, 3, 29, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 51, 3, 29, 0, 0),
(2, 52, 2, 3, 2, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 52, 2, 3, 2, 0),
(2, 52, 4, 22, 2, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 52, 4, 22, 2, 0),
(2, 53, 4, 22, 1, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 53, 4, 22, 1, 0),
(2, 54, 4, 23, 2, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 54, 4, 23, 2, 0),
(2, 54, 4, 24, 2, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 54, 4, 24, 2, 0),
(2, 55, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 55, 4, 11, 3, 0),
(2, 56, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 56, 4, 23, 1, 0),
(2, 56, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 56, 4, 25, 1, 0),
(2, 57, 2, 27, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 57, 2, 27, 2, 0),
(2, 58, 4, 23, 1, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 58, 4, 23, 1, 0),
(2, 59, 3, 15, 3, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 59, 3, 15, 3, 0),
(2, 60, 4, 5, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 60, 4, 5, 1, 0),
(2, 61, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 61, 4, 23, 1, 0),
(2, 61, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 61, 4, 25, 1, 0),
(2, 62, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 62, 4, 22, 0, 0),
(2, 63, 2, 3, 3, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 63, 2, 3, 3, 0),
(2, 63, 4, 23, 3, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 63, 4, 23, 3, 0),
(2, 64, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 64, 4, 6, 3, 0),
(2, 65, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 65, 4, 23, 2, 0),
(2, 66, 3, 15, 1, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 66, 3, 15, 1, 0),
(2, 67, 4, 24, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 67, 4, 24, 2, 0),
(2, 68, 4, 23, 1, 0, 78, 4, 19, 1, 0),
(3, 78, 4, 19, 1, 0, 68, 4, 23, 1, 0),
(2, 68, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 68, 4, 25, 1, 0),
(2, 69, 1, 7, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 69, 1, 7, 0, 0),
(2, 70, 2, 26, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 70, 2, 26, 3, 0),
(2, 71, 2, 2, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 71, 2, 2, 2, 0),
(2, 72, 2, 27, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 72, 2, 27, 3, 0),
(2, 73, 1, 16, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 73, 1, 16, 0, 0),
(2, 73, 4, 17, 0, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 73, 4, 17, 0, 0),
(2, 74, 4, 17, 2, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 74, 4, 17, 2, 0),
(2, 74, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 74, 4, 25, 2, 0),
(2, 75, 4, 23, 2, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 75, 4, 23, 2, 0),
(2, 76, 4, 22, 1, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 76, 4, 22, 1, 0),
(2, 77, 4, 23, 2, 0, 26, 4, 17, 1, 0),
(3, 26, 4, 17, 1, 0, 77, 4, 23, 2, 0),
(2, 77, 4, 24, 2, 0, 26, 4, 17, 1, 0),
(3, 26, 4, 17, 1, 0, 77, 4, 24, 2, 0),
(2, 78, 4, 19, 1, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 78, 4, 19, 1, 0),
(2, 79, 1, 12, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 79, 1, 12, 0, 0),
(2, 80, 4, 23, 1, 0, 90, 4, 17, 2, 0),
(3, 90, 4, 17, 2, 0, 80, 4, 23, 1, 0),
(2, 80, 4, 25, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 80, 4, 25, 1, 0),
(2, 81, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 81, 4, 6, 3, 0),
(2, 82, 4, 23, 1, 0, 26, 4, 17, 1, 0),
(3, 26, 4, 17, 1, 0, 82, 4, 23, 1, 0),
(2, 83, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 83, 4, 22, 0, 0),
(2, 84, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 84, 4, 25, 2, 0),
(2, 84, 4, 23, 2, 0, 74, 4, 17, 2, 0),
(3, 74, 4, 17, 2, 0, 84, 4, 23, 2, 0),
(2, 85, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 85, 4, 6, 3, 0),
(2, 86, 4, 17, 2, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 86, 4, 17, 2, 0),
(2, 87, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 87, 4, 6, 3, 0),
(2, 88, 4, 23, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 88, 4, 23, 2, 0),
(2, 89, 4, 23, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 89, 4, 23, 2, 0),
(2, 89, 2, 3, 2, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 89, 2, 3, 2, 0),
(2, 90, 4, 17, 2, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 90, 4, 17, 2, 0),
(2, 90, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 90, 4, 25, 2, 0),
(2, 91, 3, 10, 0, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 91, 3, 10, 0, 0),
(2, 92, 1, 9, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 92, 1, 9, 0, 0),
(2, 93, 3, 18, 0, 0, 51, 3, 29, 0, 0),
(3, 51, 3, 29, 0, 0, 93, 3, 18, 0, 0),
(2, 94, 4, 23, 1, 0, 86, 4, 17, 2, 0),
(3, 86, 4, 17, 2, 0, 94, 4, 23, 1, 0),
(2, 96, 2, 21, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 96, 2, 21, 1, 0),
(2, 97, 2, 27, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 97, 2, 27, 1, 0),
(2, 98, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 98, 4, 22, 0, 0),
(2, 98, 4, 23, 2, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 98, 4, 23, 2, 0),
(2, 99, 4, 6, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 99, 4, 6, 3, 0),
(2, 100, 1, 20, 0, 0, 91, 3, 10, 0, 0),
(3, 91, 3, 10, 0, 0, 100, 1, 20, 0, 0),
(2, 101, 4, 17, 2, 0, 93, 3, 18, 0, 0),
(3, 93, 3, 18, 0, 0, 101, 4, 17, 2, 0),
(2, 102, 1, 9, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 102, 1, 9, 0, 0),
(2, 103, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 103, 4, 23, 2, 0),
(2, 103, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 103, 4, 25, 2, 0),
(2, 104, 2, 2, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 104, 2, 2, 1, 0),
(2, 104, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 104, 4, 22, 0, 0),
(2, 105, 4, 23, 2, 0, 90, 4, 17, 2, 0),
(3, 90, 4, 17, 2, 0, 105, 4, 23, 2, 0),
(2, 106, 1, 30, 0, 0, 50, 3, 14, 0, 0),
(3, 50, 3, 14, 0, 0, 106, 1, 30, 0, 0),
(2, 107, 1, 8, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 107, 1, 8, 0, 0),
(2, 108, 2, 2, 1, 0, 66, 3, 15, 1, 0),
(3, 66, 3, 15, 1, 0, 108, 2, 2, 1, 0),
(2, 109, 4, 23, 2, 0, 74, 4, 17, 2, 0),
(3, 74, 4, 17, 2, 0, 109, 4, 23, 2, 0),
(2, 109, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 109, 4, 25, 2, 0),
(2, 110, 1, 9, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 110, 1, 9, 0, 0),
(2, 112, 1, 4, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 112, 1, 4, 0, 0),
(2, 112, 4, 23, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 112, 4, 23, 2, 0),
(2, 113, 4, 23, 2, 0, 101, 4, 17, 2, 0),
(3, 101, 4, 17, 2, 0, 113, 4, 23, 2, 0),
(2, 114, 4, 11, 3, 0, 59, 3, 15, 3, 0),
(3, 59, 3, 15, 3, 0, 114, 4, 11, 3, 0),
(2, 114, 4, 22, 0, 0, 73, 4, 17, 0, 0),
(3, 73, 4, 17, 0, 0, 114, 4, 22, 0, 0),
(2, 115, 4, 23, 2, 0, 6, 4, 17, 2, 14),
(3, 6, 4, 17, 2, 14, 115, 4, 23, 2, 0),
(2, 115, 4, 25, 2, 0, 30, 3, 15, 2, 0),
(3, 30, 3, 15, 2, 0, 115, 4, 25, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `perfiles`
--

CREATE TABLE `perfiles` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `perfiles`
--

INSERT INTO `perfiles` (`id`, `nombre`) VALUES
(0, 'Sin Perfil'),
(1, 'Administrativo'),
(2, 'Asistente de Educación'),
(3, 'Directivo'),
(4, 'Docente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ponderacion_tipo`
--

CREATE TABLE `ponderacion_tipo` (
  `id` int(10) NOT NULL,
  `ponderacion` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `ponderacion_tipo`
--

INSERT INTO `ponderacion_tipo` (`id`, `ponderacion`) VALUES
(1, 10),
(2, 75),
(3, 15);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `procesos`
--

CREATE TABLE `procesos` (
  `id` int(10) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `establecimiento_id` int(11) NOT NULL DEFAULT '1',
  `finicio` date NOT NULL,
  `ftermino` date NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `procesos`
--

INSERT INTO `procesos` (`id`, `nombre`, `establecimiento_id`, `finicio`, `ftermino`, `habilitado`) VALUES
(1, 'Saint Gaspar 2017', 1, '2017-01-30', '2017-02-27', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proc_comp`
--

CREATE TABLE `proc_comp` (
  `proceso_id` int(11) NOT NULL,
  `competencia_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proc_comp`
--

INSERT INTO `proc_comp` (`proceso_id`, `competencia_id`) VALUES
(1, 1),
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 2);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proc_ind`
--

CREATE TABLE `proc_ind` (
  `proceso_id` int(11) NOT NULL,
  `indicador_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `proc_ind`
--

INSERT INTO `proc_ind` (`proceso_id`, `indicador_id`) VALUES
(1, 3),
(1, 4),
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 15),
(1, 16),
(1, 17),
(1, 18),
(1, 19),
(1, 20),
(1, 21),
(1, 22),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 45),
(1, 46),
(1, 47),
(1, 48),
(1, 49),
(1, 50),
(1, 51),
(1, 52),
(1, 53),
(1, 54),
(1, 55),
(1, 56),
(1, 57),
(1, 58),
(1, 59),
(1, 60),
(1, 61),
(1, 62),
(1, 63),
(1, 64),
(1, 65),
(1, 66),
(1, 67),
(1, 68),
(1, 69),
(1, 70),
(1, 71),
(1, 72),
(1, 73),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 88),
(1, 89),
(1, 90),
(1, 91),
(1, 92),
(1, 93),
(1, 94),
(1, 95),
(1, 96),
(1, 97),
(1, 98),
(1, 99),
(1, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_comp`
--

CREATE TABLE `resultados_comp` (
  `evaluacion_id` int(10) NOT NULL,
  `respuesta` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `resultados_ind`
--

CREATE TABLE `resultados_ind` (
  `evaluacion_id` int(10) NOT NULL,
  `respuesta` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `superiores_id`
--

CREATE TABLE `superiores_id` (
  `usuario_id` int(10) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `ciclo_id` int(10) NOT NULL,
  `asignatura_id` int(11) NOT NULL DEFAULT '0',
  `superior_id` int(10) DEFAULT '0',
  `cargo2_id` int(10) NOT NULL,
  `ciclo2_id` int(10) NOT NULL,
  `asignatura2_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `superiores_id`
--

INSERT INTO `superiores_id` (`usuario_id`, `cargo_id`, `ciclo_id`, `asignatura_id`, `superior_id`, `cargo2_id`, `ciclo2_id`, `asignatura2_id`) VALUES
(2, 13, 0, 0, 50, 14, 0, 0),
(3, 26, 2, 0, 30, 15, 2, 0),
(4, 31, 2, 0, 30, 15, 2, 0),
(5, 3, 3, 0, 91, 10, 0, 0),
(6, 17, 2, 14, 93, 18, 0, 0),
(7, 23, 1, 0, 78, 19, 1, 0),
(7, 25, 1, 0, 66, 15, 1, 0),
(8, 22, 1, 0, 73, 17, 0, 0),
(9, 23, 1, 0, 78, 19, 1, 0),
(9, 25, 1, 0, 66, 15, 1, 0),
(10, 22, 2, 0, 73, 17, 0, 0),
(10, 25, 2, 0, 30, 15, 2, 0),
(11, 22, 1, 0, 73, 17, 0, 0),
(11, 23, 1, 0, 73, 17, 0, 0),
(12, 23, 3, 0, 86, 17, 2, 0),
(13, 30, 0, 0, 50, 14, 0, 0),
(14, 6, 3, 0, 59, 15, 3, 0),
(15, 22, 0, 0, 73, 17, 0, 0),
(16, 26, 1, 0, 66, 15, 1, 0),
(17, 23, 2, 0, 73, 17, 0, 0),
(17, 25, 2, 0, 30, 15, 2, 0),
(19, 22, 0, 0, 73, 17, 0, 0),
(18, 24, 1, 0, 78, 19, 1, 0),
(20, 23, 2, 0, 90, 17, 2, 0),
(20, 24, 2, 0, 90, 17, 2, 0),
(21, 28, 0, 0, 50, 14, 0, 0),
(22, 23, 2, 0, 101, 17, 2, 0),
(22, 25, 2, 0, 30, 15, 2, 0),
(23, 23, 2, 0, 6, 17, 2, 14),
(23, 25, 2, 0, 30, 15, 2, 0),
(24, 23, 1, 0, 78, 19, 1, 0),
(24, 25, 1, 0, 66, 15, 1, 0),
(25, 11, 3, 0, 59, 15, 3, 0),
(26, 17, 1, 0, 93, 18, 0, 0),
(26, 25, 1, 0, 66, 15, 1, 0),
(27, 11, 3, 0, 59, 15, 3, 0),
(28, 24, 2, 0, 74, 17, 2, 0),
(29, 23, 1, 0, 78, 19, 1, 0),
(29, 25, 1, 0, 66, 15, 1, 0),
(30, 15, 2, 0, 51, 29, 0, 0),
(31, 22, 0, 0, 73, 17, 0, 0),
(32, 11, 3, 0, 59, 15, 3, 0),
(33, 11, 3, 0, 59, 15, 3, 0),
(34, 22, 0, 0, 73, 17, 0, 0),
(35, 23, 1, 0, 78, 19, 1, 0),
(35, 25, 1, 0, 66, 15, 1, 0),
(36, 23, 2, 0, 74, 17, 2, 0),
(37, 5, 1, 0, 66, 15, 1, 0),
(38, 22, 0, 0, 73, 17, 0, 0),
(39, 2, 2, 0, 30, 15, 2, 0),
(40, 23, 2, 0, 6, 17, 2, 14),
(40, 25, 2, 0, 30, 15, 2, 0),
(41, 1, 0, 0, 50, 14, 0, 0),
(42, 11, 3, 0, 59, 15, 3, 0),
(43, 9, 0, 0, 73, 17, 0, 0),
(44, 23, 1, 0, 74, 17, 2, 0),
(44, 25, 1, 0, 66, 15, 1, 0),
(45, 3, 1, 0, 91, 10, 0, 0),
(45, 23, 1, 0, 101, 17, 2, 0),
(46, 30, 0, 0, 51, 29, 0, 0),
(47, 3, 2, 0, 101, 17, 2, 0),
(47, 3, 2, 0, 91, 10, 0, 0),
(48, 23, 1, 0, 26, 17, 1, 0),
(48, 25, 1, 0, 66, 15, 1, 0),
(49, 23, 2, 0, 6, 17, 2, 14),
(49, 24, 2, 0, 6, 17, 2, 14),
(50, 14, 0, 0, 51, 29, 0, 0),
(51, 29, 0, 0, 73, 17, 0, 0),
(52, 3, 2, 0, 91, 10, 0, 0),
(52, 22, 2, 0, 73, 17, 0, 0),
(53, 22, 1, 0, 73, 17, 0, 0),
(54, 23, 2, 0, 86, 17, 2, 0),
(54, 24, 2, 0, 86, 17, 2, 0),
(55, 11, 3, 0, 59, 15, 3, 0),
(56, 23, 1, 0, 78, 19, 1, 0),
(56, 25, 1, 0, 66, 15, 1, 0),
(57, 27, 2, 0, 30, 15, 2, 0),
(58, 23, 1, 0, 86, 17, 2, 0),
(59, 15, 3, 0, 51, 29, 0, 0),
(60, 5, 1, 0, 66, 15, 1, 0),
(61, 23, 1, 0, 78, 19, 1, 0),
(61, 25, 1, 0, 66, 15, 1, 0),
(62, 22, 0, 0, 73, 17, 0, 0),
(63, 3, 3, 0, 91, 10, 0, 0),
(63, 23, 3, 0, 101, 17, 2, 0),
(64, 6, 3, 0, 59, 15, 3, 0),
(65, 23, 2, 0, 6, 17, 2, 14),
(66, 15, 1, 0, 51, 29, 0, 0),
(67, 24, 2, 0, 101, 17, 2, 0),
(68, 23, 1, 0, 78, 19, 1, 0),
(68, 25, 1, 0, 66, 15, 1, 0),
(69, 7, 0, 0, 50, 14, 0, 0),
(70, 26, 3, 0, 59, 15, 3, 0),
(71, 2, 2, 0, 30, 15, 2, 0),
(72, 27, 3, 0, 59, 15, 3, 0),
(73, 16, 0, 0, 50, 14, 0, 0),
(73, 17, 0, 0, 93, 18, 0, 0),
(74, 17, 2, 0, 93, 18, 0, 0),
(74, 25, 2, 0, 30, 15, 2, 0),
(75, 23, 2, 0, 86, 17, 2, 0),
(76, 22, 1, 0, 73, 17, 0, 0),
(77, 23, 2, 0, 26, 17, 1, 0),
(77, 24, 2, 0, 26, 17, 1, 0),
(78, 19, 1, 0, 93, 18, 0, 0),
(79, 12, 0, 0, 50, 14, 0, 0),
(80, 23, 1, 0, 90, 17, 2, 0),
(80, 25, 1, 0, 66, 15, 1, 0),
(81, 6, 3, 0, 59, 15, 3, 0),
(82, 23, 1, 0, 26, 17, 1, 0),
(83, 22, 0, 0, 73, 17, 0, 0),
(84, 25, 2, 0, 30, 15, 2, 0),
(84, 23, 2, 0, 74, 17, 2, 0),
(85, 6, 3, 0, 59, 15, 3, 0),
(86, 17, 2, 0, 93, 18, 0, 0),
(87, 6, 3, 0, 59, 15, 3, 0),
(88, 23, 2, 0, 101, 17, 2, 0),
(89, 23, 2, 0, 101, 17, 2, 0),
(89, 3, 2, 0, 91, 10, 0, 0),
(90, 17, 2, 0, 93, 18, 0, 0),
(90, 25, 2, 0, 30, 15, 2, 0),
(91, 10, 0, 0, 51, 29, 0, 0),
(92, 9, 0, 0, 73, 17, 0, 0),
(93, 18, 0, 0, 51, 29, 0, 0),
(94, 23, 1, 0, 86, 17, 2, 0),
(96, 21, 1, 0, 66, 15, 1, 0),
(97, 27, 1, 0, 66, 15, 1, 0),
(98, 22, 0, 0, 73, 17, 0, 0),
(98, 23, 2, 0, 73, 17, 0, 0),
(99, 6, 3, 0, 59, 15, 3, 0),
(100, 20, 0, 0, 91, 10, 0, 0),
(101, 17, 2, 0, 93, 18, 0, 0),
(102, 9, 0, 0, 73, 17, 0, 0),
(103, 23, 2, 0, 6, 17, 2, 14),
(103, 25, 2, 0, 30, 15, 2, 0),
(104, 2, 1, 0, 66, 15, 1, 0),
(104, 22, 0, 0, 73, 17, 0, 0),
(105, 23, 2, 0, 90, 17, 2, 0),
(106, 30, 0, 0, 50, 14, 0, 0),
(107, 8, 0, 0, 73, 17, 0, 0),
(108, 2, 1, 0, 66, 15, 1, 0),
(109, 23, 2, 0, 74, 17, 2, 0),
(109, 25, 2, 0, 30, 15, 2, 0),
(110, 9, 0, 0, 73, 17, 0, 0),
(112, 4, 0, 0, 73, 17, 0, 0),
(112, 23, 2, 0, 101, 17, 2, 0),
(113, 23, 2, 0, 101, 17, 2, 0),
(114, 11, 3, 0, 59, 15, 3, 0),
(114, 22, 0, 0, 73, 17, 0, 0),
(115, 23, 2, 0, 6, 17, 2, 14),
(115, 25, 2, 0, 30, 15, 2, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabaja`
--

CREATE TABLE `trabaja` (
  `usuario_id` int(10) NOT NULL,
  `perfil_id` int(10) NOT NULL,
  `cargo_id` int(10) NOT NULL,
  `ciclo_id` int(10) NOT NULL,
  `asignatura_id` int(10) NOT NULL,
  `establecimiento_id` int(10) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `trabaja`
--

INSERT INTO `trabaja` (`usuario_id`, `perfil_id`, `cargo_id`, `ciclo_id`, `asignatura_id`, `establecimiento_id`) VALUES
(1, 0, 0, 0, 0, 1),
(2, 1, 13, 0, 0, 1),
(3, 2, 26, 2, 0, 1),
(4, 2, 31, 2, 0, 1),
(5, 2, 3, 3, 0, 1),
(6, 4, 17, 2, 14, 1),
(7, 4, 23, 1, 0, 1),
(7, 4, 25, 1, 0, 1),
(8, 4, 22, 1, 0, 1),
(9, 4, 25, 1, 0, 1),
(9, 4, 23, 1, 0, 1),
(10, 4, 22, 2, 0, 1),
(10, 4, 23, 2, 0, 1),
(10, 4, 25, 2, 0, 1),
(11, 4, 22, 1, 0, 1),
(11, 4, 23, 1, 0, 1),
(12, 4, 23, 3, 0, 1),
(13, 1, 30, 0, 0, 1),
(14, 4, 6, 3, 0, 1),
(15, 4, 22, 0, 0, 1),
(16, 2, 26, 1, 0, 1),
(17, 4, 23, 2, 0, 1),
(17, 4, 25, 2, 0, 1),
(19, 4, 22, 0, 0, 1),
(18, 4, 24, 1, 0, 1),
(20, 4, 23, 2, 0, 1),
(20, 4, 24, 2, 0, 1),
(21, 1, 28, 0, 0, 1),
(22, 4, 23, 2, 0, 1),
(22, 4, 25, 2, 0, 1),
(23, 4, 23, 2, 0, 1),
(23, 4, 25, 2, 0, 1),
(24, 4, 23, 1, 0, 1),
(24, 4, 25, 1, 0, 1),
(25, 4, 11, 3, 0, 1),
(26, 4, 17, 1, 0, 1),
(26, 4, 25, 1, 0, 1),
(27, 4, 11, 3, 0, 1),
(28, 4, 24, 2, 0, 1),
(29, 4, 23, 1, 0, 1),
(29, 4, 25, 1, 0, 1),
(30, 3, 15, 2, 0, 1),
(31, 4, 22, 0, 0, 1),
(32, 4, 11, 3, 0, 1),
(33, 4, 11, 3, 0, 1),
(34, 4, 22, 0, 0, 1),
(35, 4, 23, 1, 0, 1),
(35, 4, 25, 1, 0, 1),
(36, 4, 23, 2, 0, 1),
(37, 4, 5, 1, 0, 1),
(38, 4, 22, 0, 0, 1),
(39, 2, 2, 2, 0, 1),
(40, 4, 23, 2, 0, 1),
(40, 4, 25, 2, 0, 1),
(41, 1, 1, 0, 0, 1),
(42, 4, 11, 3, 0, 1),
(43, 1, 9, 0, 0, 1),
(44, 4, 23, 1, 0, 1),
(44, 4, 25, 1, 0, 1),
(45, 2, 3, 1, 0, 1),
(45, 4, 23, 1, 0, 1),
(46, 1, 30, 0, 0, 1),
(47, 2, 3, 2, 0, 1),
(47, 4, 23, 2, 0, 1),
(48, 4, 23, 1, 0, 1),
(48, 4, 25, 1, 0, 1),
(49, 4, 23, 2, 0, 1),
(49, 4, 24, 2, 0, 1),
(50, 3, 14, 0, 0, 1),
(51, 3, 29, 0, 0, 1),
(52, 2, 3, 2, 0, 1),
(52, 4, 22, 2, 0, 1),
(53, 4, 22, 1, 0, 1),
(54, 4, 23, 2, 0, 1),
(54, 4, 24, 2, 0, 1),
(55, 4, 11, 3, 0, 1),
(56, 4, 23, 1, 0, 1),
(56, 4, 25, 1, 0, 1),
(57, 2, 27, 2, 0, 1),
(58, 4, 23, 1, 0, 1),
(59, 3, 15, 3, 0, 1),
(60, 4, 5, 1, 0, 1),
(62, 4, 22, 0, 0, 1),
(61, 4, 23, 1, 0, 1),
(61, 4, 25, 1, 0, 1),
(63, 2, 3, 3, 0, 1),
(63, 4, 23, 3, 0, 1),
(64, 4, 6, 3, 0, 1),
(65, 4, 23, 2, 0, 1),
(66, 3, 15, 1, 0, 1),
(67, 4, 24, 2, 0, 1),
(68, 4, 23, 1, 0, 1),
(68, 4, 25, 1, 0, 1),
(69, 1, 7, 0, 0, 1),
(70, 2, 26, 3, 0, 1),
(71, 2, 2, 2, 0, 1),
(72, 2, 27, 3, 0, 1),
(73, 1, 16, 0, 0, 1),
(73, 4, 17, 0, 0, 1),
(74, 4, 17, 2, 0, 1),
(75, 4, 23, 2, 0, 1),
(74, 4, 25, 2, 0, 1),
(76, 4, 22, 1, 0, 1),
(77, 4, 23, 2, 0, 1),
(77, 4, 24, 2, 0, 1),
(78, 4, 19, 1, 0, 1),
(79, 1, 12, 0, 0, 1),
(80, 4, 23, 1, 0, 1),
(80, 4, 25, 1, 0, 1),
(81, 4, 6, 3, 0, 1),
(82, 4, 23, 1, 0, 1),
(83, 4, 22, 0, 0, 1),
(84, 4, 23, 2, 0, 1),
(84, 4, 25, 2, 0, 1),
(85, 4, 6, 3, 0, 1),
(86, 4, 17, 2, 0, 1),
(87, 4, 6, 3, 0, 1),
(88, 4, 23, 2, 0, 1),
(89, 2, 3, 2, 0, 1),
(89, 4, 23, 2, 0, 1),
(90, 4, 17, 2, 0, 1),
(90, 4, 25, 2, 0, 1),
(91, 3, 10, 0, 0, 1),
(92, 1, 9, 0, 0, 1),
(93, 3, 18, 0, 0, 1),
(94, 4, 23, 1, 0, 1),
(95, 4, 23, 1, 0, 1),
(96, 2, 21, 1, 0, 1),
(97, 2, 27, 1, 0, 1),
(98, 4, 22, 0, 0, 1),
(98, 4, 23, 2, 0, 1),
(99, 4, 6, 3, 0, 1),
(100, 1, 20, 0, 0, 1),
(101, 4, 17, 2, 0, 1),
(102, 1, 9, 0, 0, 1),
(103, 4, 23, 2, 0, 1),
(103, 4, 25, 2, 0, 1),
(104, 2, 2, 1, 0, 1),
(104, 4, 22, 0, 0, 1),
(105, 4, 23, 2, 0, 1),
(106, 1, 30, 0, 0, 1),
(107, 1, 8, 0, 0, 1),
(108, 2, 2, 1, 0, 1),
(109, 4, 23, 2, 0, 1),
(109, 4, 25, 2, 0, 1),
(110, 1, 9, 0, 0, 1),
(111, 1, 9, 0, 0, 1),
(112, 1, 4, 0, 0, 1),
(112, 4, 23, 2, 0, 1),
(113, 4, 23, 2, 0, 1),
(114, 4, 11, 3, 0, 1),
(114, 4, 22, 0, 0, 1),
(115, 4, 23, 2, 0, 1),
(115, 4, 25, 2, 0, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  `rut` varchar(255) NOT NULL,
  `nombre` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish2_ci NOT NULL,
  `apellidop` varchar(255) NOT NULL,
  `apellidom` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `habilitado` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `username`, `password`, `rut`, `nombre`, `apellidop`, `apellidom`, `email`, `habilitado`) VALUES
(1, 'sgaspar', 'saintgasparadmin', '0', 'Saint Gaspar', 'Administrador', 'Administrador', 'administracion@gmail.com', 1),
(2, 'amarquez', 'amarquez', '16920858-1', 'Alejandra Andrea', 'Marquez', 'Marquez', 'alejandra.marquez.m@gmail.com', 1),
(3, 'aschliebner', 'aschliebner', '17278414-3', 'Alexandra Judith', 'Schliebner', 'Tobar', 'ale.schliebner@gmail.com', 1),
(4, 'avanderput', 'avanderput', '16655664-3', 'Alexandra Vivian', 'Vanderput', 'Peñaloza', 'alexa.vanderput.p@gmail.com', 1),
(5, 'amunoz', 'amunoz', '15776164-1', 'Ana Maria', 'Muñoz', 'Tarraf', '	anitamunoz_cf@yahoo.es', 1),
(6, 'agonzalez', 'agonzalez', '8768475-k', 'Ana Maria', 'Gonzalez', 'Oliveros', 'guido1811_8@hotmail.com', 1),
(7, 'asalinas', 'asalinas', '7777475-0', 'Ana Maria del Carmen', 'Salinas', 'Gonzalez', '	anysalinas@gmail.com', 1),
(8, 'agonzalezk', 'agonzalezk', '15920160-0', 'Andrea', 'Gonzalez', 'Kother', 'acgk_@hotmail.com', 1),
(9, 'alobos', 'alobos', '12664761-1', 'Angela Andrea', 'Lobos', 'Cordano', 'angelaloboscordano@gmail.com', 1),
(10, 'arivera', 'arivera', '13933697-6', 'Angelica Amaranta', 'Rivera', 'Peña', 'prof.amaranta@gmail.com', 1),
(11, 'achaura', 'achaura', '16613010-1', 'Antonio', 'Chaura', 'Pinochet', 'achaurapinochet@gmail.com', 1),
(12, 'bcastro', 'bcastro', '16663466-0', 'Barbara Cynthia', 'Castro', 'Mardones', '	be.castro.mar@gmail.com', 1),
(13, 'bvargas', 'bvargas', '8042422-1', 'Blanca Gladys', 'Vargas', 'Año', 'blancavargasa@gmail.com', 1),
(14, 'calvarez', 'calvarez', '16610258-8', 'Camila', 'Alvarez', 'Godoy', 'camila.alvarez.godoy@gmail.com', 1),
(15, 'ccadiz', 'ccadiz', '13863122-2', 'Carla Andrea', 'Cadiz', 'Pizarro', 'carla.cadiz.pizarro@gmail.com', 1),
(16, 'clopez', 'clopez', '16750607-0', 'Carla Vanessa', 'Lopez', 'Folle', 'carlalopezfolle@gmail.com', 1),
(17, 'cfigueroa', 'cfigueroa', '15365422-0', 'Carlos Andres', 'Figueroa', 'Moreno', 'carlos.a.figue@gmail.com', 1),
(18, 'cgonzalez', 'cgonzalez', '13481447-0', 'Carmen Gloria', 'Gonzalez', 'Caceres', 'cggonzalezcaceres@gmail.com', 1),
(19, 'cyanez', 'cyanez', '9845838-7', 'Carmen Gloria', 'Yañez', 'Pecchi', 'cgyp2014@gmail.com', 1),
(20, 'cjamett', 'cjamett', '15401253-2', 'Carolina Del Carmen', 'Jamett', 'Gonzalez', 'carolina.jamett@gmail.com', 1),
(21, 'cpalma', 'cpalma', '13257531-2', 'Catherinne Andrea', 'Palma', 'Orrego', 'cattypalma@gmail.com', 1),
(22, 'ccorrea', 'ccorrea', '12671317-7', 'Cesar Osvaldo', 'Correa', 'Ibaceta', 'ccorreai@hotmail.com', 1),
(23, 'ccontreras', 'ccontreras', '9470506-1', 'Christian', 'Contreras', 'Guerra', 'chcontreras@gmail.com', 1),
(24, 'cflores', 'cflores', '16796475-3', 'Cindy Edith', 'Flores', 'Alegria', 'cfloresalegria@gmail.com', 1),
(25, 'cortega', 'cortega', '16558320-5', 'Claudia', 'Ortega', 'Arancibia', 'clau.ortega.arancibia@gmail.com', 1),
(26, 'cduran', 'cduran', '10948807-0', 'Claudia Andrea', 'Duran', 'Soto', 'claduransot@gmail.com', 1),
(27, 'cmurua', 'cmurua', '13863880-4', 'Claudia Margarita', 'Murua ', 'Balbontín', 'claumurua.balbontin@gmail.com', 1),
(28, 'dalmonacid', 'dalmonacid', '15791708-0', 'Daniela', 'Almonacid', 'Quintuy', 'prof.daniela.almonacid@gmail.com', 1),
(29, 'dosorio', 'dosorio', '13296361-4', 'Daniela Alejandra', 'Osorio', 'Carrasco', 'dani29osorio@gmail.com', 1),
(30, 'dmoraga', 'dmoraga', '10074090-7', 'Doris Laura', 'Moraga', 'Labbe', 'doris_profesora@hotmail.com', 1),
(31, 'eoyarzun', 'eoyarzun', '16954492-1', 'Elias Leonardo', 'Oyarzun', 'Aranguiz', 'elias.oyarzun.a@gmail.com', 1),
(32, 'egonzalez', 'egonzalez', '12468083-2', 'Elizabeth Paola', 'Gonzalez', 'Cabrera', 'epgc@hotmail.cl', 1),
(33, 'eriquelme', 'eriquelme', '10228528-k', 'Ernestina Isabel', 'Riquelme', 'Rebolledo', 'ernesij@gmail.com', 1),
(34, 'ftroncoso', 'ftroncoso', '18047931-7', 'Fabian Andres', 'Troncoso', 'Sepulveda', 'fabiantroncoso24@gmail.com', 1),
(35, 'fazocar', 'fazocar', '15748015-4', 'Fabiola', 'Azocar', 'Caro', 'azocarcarofabiola@gmail.com', 1),
(36, 'fsarmiento', 'fsarmiento', '16476140-1', 'Fabiola Andrea', 'Sarmiento', 'Rodriguez', 'fabiola.sarmiento2@gmail.com', 1),
(37, 'fvillar', 'fvillar', '17957660-0', 'Fernanda Patricia', 'Villar', 'Ramirez', 'f.villarramirez@gmail.com', 1),
(38, 'fcanete', 'fcanete', '16941443-2', 'Francisco Javier', 'Cañete', 'Torres', 'fco.canete@gmail.com', 1),
(39, 'gponce', 'gponce', '6768407-9', 'Glora Del Lourdes', 'Ponce', 'Alvarez', 'gloponceal@yahoo.com', 1),
(40, 'gherrera', 'gherrera', '13532486-8', 'Gonzalo Mauricio', 'Herrera', 'Cayo', 'gonzaloherrarac@gmail.com', 1),
(41, 'hcaceres', 'hcaceres', '10669531-8', 'Hector Daniel', 'Caceres', 'Perez', 'danielcaceresperez@gmail.com', 1),
(42, 'irivera', 'irivera', '16276205-2', 'Isabel Margarita', 'Rivera', 'Garces', 'igrivera@uc.cl', 1),
(43, 'jalvarez', 'jalvarez', '8474846-3', 'Jaime Alfonso', 'Alvarez', 'Garrido', 'jaagalfa1961@gmail.com', 1),
(44, 'jlara', 'jlara', '15505802-1', 'Jazmín De Lourdes', 'Lara', 'Román', 'jazminlararoman@gmail.com', 1),
(45, 'jgomez', 'jgomez', '12273365-3', 'Jimena Andrea', 'Gomez', 'Valenzuela', 'jtonia33@hotmail.com', 1),
(46, 'jharbin', 'jharbin', '9964564-4', 'Joaneth Janis', 'Harbin', 'Zamorano', 'jharbinz@hotmail.com', 1),
(47, 'jalmuna', 'jalmuna', '16068742-8', 'Joaquin Enrique', 'Almuna', 'Fuentes', 'joaquinalmuna@hotmail.com', 1),
(48, 'jnunez', 'jnunez', '14163493-3', 'Jocelyn Del Pilar', 'Núñez', 'Baeza', 'nunez.baeza@gmail.com', 1),
(49, 'jcastro', 'jcastro', '16727843-4', 'Jonathan Felipe', 'Castro', 'Farías', 'jona.castro7@yahoo.es', 1),
(50, 'jsaldana', 'jsaldana', '6695075-1', 'Jose Miguel', 'Saldaña', 'Gaete', 'finanzas@saintgasparcollege.cl', 1),
(51, 'jbaus', 'jbaus', '7980234-4', 'José Antonio', 'Baus', 'Bou', 'direccion@saintgasparcollege.cl', 1),
(52, 'jdiaz', 'jdiaz', '16418977-5', 'Juan Pablo', 'Diaz', 'Perez', 'juanpablo218@gmail.com', 1),
(53, 'kcruz', 'kcruz', '13226245-4', 'Karina', 'Cruz', 'Cornejo', 'khoruma@gmail.com', 1),
(54, 'kcortes', 'kcortes', '12863364-2', 'Karina Alejandra', 'Cortes', 'Grego', 'misskarinacortes@gmail.com', 1),
(55, 'kzuniga', 'kzuniga', '12637613-8', 'Karina De Lourdes', 'Zuñiga', 'Ulloa', 'karinazun@gmail.com', 1),
(56, 'lbiskupovic', 'lbiskupovic', '15459586-4', 'Ljubica', 'Biskupovic', 'Guerrero', 'ljubica.biskupovic@gmail.com', 1),
(57, 'mreyes', 'mreyes', '13469484-k', 'Macarena', 'Reyes', 'Pinto', 'maca.reyes@gmail.com', 1),
(58, 'mbzdigian', 'mbzdigian', '17402995-4', 'Maral Lourdes', 'Bzdigian', 'Quintana', 'maralbzdigian@gmail.com', 1),
(59, 'mdoty', 'mdoty', '9172353-0', 'Marcela Albertina', 'Doty', 'Araos', 'doty48@hotmail.com', 1),
(60, 'maraya', 'maraya', '13441444-8', 'Marcela Soledad', 'Araya', 'Perez', 'marce_araya_p@hotmail.com', 1),
(61, 'mrodriguez', 'mrodriguez', '10338010-3', 'Maria Alejandra', 'Rodriguez', 'Cheuquian', 'miss.alejandra.rodriguez@gmail.com', 1),
(62, 'mbravo', 'mbravo', '13455192-5', 'Maria Alejandra', 'Bravo', 'Berrios', 'alebravoberrios@gmail.com', 1),
(63, 'mhenriquez', 'mhenriquez', '14538914-3', 'Maria Cristina', 'Henriquez', 'Oyarzun', 'crishen1974@gmail.com', 1),
(64, 'mgonzalez', 'mgonzalez', '6897815-7', 'Maria Cristobalina', 'Gonzalez', 'Zuñiga', 'cristibalinagonzalez15@gmail.com', 1),
(65, 'mcuevas', 'mcuevas', '16070664-9', 'Maria Del Carmen', 'Cuevas', 'Villanueva', 'manacuevas@gmail.com', 1),
(66, 'mbrown', 'mbrown', '14521936-1', 'Maria Del Lujan', 'Brown', 'Callaba', 'lujan_brown@yahoo.es', 1),
(67, 'miturriaga', 'miturriaga', '13433239-5', 'Maria Elena', 'Iturriaga', 'Corvalan', 'meiturriaga@yahoo.com', 1),
(68, 'mmerino', 'mmerino', '6025593-8', 'Maria Gizelda', 'Merino', 'salinas', 'gizelda.merino@gmail.com', 1),
(69, 'marias', 'marias', '13796866-5', 'Maria Gricelda', 'Arias', 'Pineda', 'gricelarias2211@hotmail.com', 1),
(70, 'msalas', 'msalas', '12239958-3', 'Maria Isabel', 'Salas', 'Castro', 'isitasalas23@gmail.com', 1),
(71, 'msoto', 'msoto', '8668861-1', 'Maria Jacqueline', 'Soto', 'Quintanilla', 'maja_vinadelmar@hotmail.com', 1),
(72, 'mpalmero', 'mpalmero', '15324947-4', 'Maria Jose', 'Palmero', 'Barros', 'palmero.mariajose@gmail.com', 1),
(73, 'maguirrezabal', 'maguirrezabal', '6698335-8', 'Maria Maribel', 'Aguirrezabal', 'Diaz', 'competenciafull@gmail.com', 1),
(74, 'mconcha', 'mconcha', '8601615-k', 'Maria Teresa', 'Concha', 'Ortuzar', 'teteconcha@hotmail.com', 1),
(75, 'macosta', 'macosta', '9425242-3', 'Maria Teresa', 'Acosta', 'Galaz', 'm.maite4305@gmail.com', 1),
(76, 'mnuñez', 'mnuñez', '13529546-9', 'Maria Valeria', 'Núñez', 'Corvalan', 'mariavaleria05@gmail.com', 1),
(77, 'mbadilla', 'mbadilla', '16095145-1', 'Maria Veronica', 'Badilla', 'Herrera', 'veronica.badilla.herrera@gmail.com', 1),
(78, 'mmartinez', 'mmartinez', '13074363-3', 'Mariluz Isabel', 'Martinez', 'Mendez', 'maluactiva@yahoo.es', 1),
(79, 'mpalma', 'mpalma', '11363630-0', 'Marlene', 'Palma', 'Guzman', 'marlenepalmag@hotmail.com', 1),
(80, 'mpalmas', 'mpalmas', '15662113-7', 'Maria Adriana', 'Palma', 'Sepulveda', 'mariaadrianapalma@gmail.com', 1),
(81, 'mvejar', 'mvejar', '14413219-k', 'Maria Loreto', 'Vejar', 'Julio', 'lolovejar@yahoo.com', 1),
(82, 'mjerez', 'mjerez', '11834034-5', 'Maria Macarena', 'Jerez', 'Arellano', 'macajereza@gmail.com', 1),
(83, 'mrodriguezr', 'mrodriguezr', '18301710-1', 'Mercedes Marta Pompeya', 'Rodriguez', 'Rojo', 'mercedes094@gmail.com', 1),
(84, 'mrivera', 'mrivera', '13044324-9', 'Mirtha Andrea', 'Rivera', 'Moreno', 'andreitarm@gmail.com', 1),
(85, 'mmunoz', 'mmunoz', '14289844-6', 'Monica Carolina', 'Muñoz', 'San Martin', 'mmunozsm@hotmail.com', 1),
(86, 'mchamorro', 'mchamorro', '6890274-6', 'Monica Isabel', 'Chamorro', 'Arena', 'michamor@uc.cl', 1),
(87, 'mgoyoaga', 'mgoyoaga', '17408609-5', 'Montserrat', 'Goyoaga', 'Montalva', 'mgoyoagamontalva@gmail.com', 1),
(88, 'mramirez', 'mramirez', '13075961-0', 'Mónica Francisca', 'Ramírez', 'Ciani', 'franciani4@hotmail.com', 1),
(89, 'ncadena', 'ncadena', '13578302-1', 'Nelson', 'Cadena', 'Andrade', 'nelsoncadena.a@gmail.com', 1),
(90, 'nrubio', 'nrubio', '10000454-2', 'Nibaldo Enrique', 'Rubio', 'Castillo', 'nibaldo.rubio@gmail.com', 1),
(91, 'ocerda', 'ocerda', '14749534-k', 'Omar Guillermo', 'Cerda', 'Pacheco', 'omarcerdapps@gmail.com', 1),
(92, 'pzuniga', 'pzuniga', '15542818-k', 'Pamela Andrea', 'Zuñiga', 'Zanni', 'pamela.zzanni@gmail.com', 1),
(93, 'ptriniti', 'ptriniti', '8334787-2', 'Paola Andrea', 'Triniti', 'Galleguillo', 'paotrinitig@hotmail.com', 1),
(94, 'phernandez', 'phernandez', '11643339-7', 'Patricia De Lourdes', 'Hernandez', 'Montecino', 'pattyhm18@gmail.com', 1),
(95, 'ppizarro', 'ppizarro', '7745014-9', 'Patricia Isabel', 'Pizarro', 'Rubilar', 'pachypizarro@hotmail.com', 1),
(96, 'plorca', 'plorca', '14131925-6', 'Paula Beatriz', 'Lorca', 'Jaña', 'lorca.paula@gmail.com', 1),
(97, 'plathrop', 'plathrop', '13903010-9', 'Paula Francisca', 'Lathrop', 'Ponce De Leon', 'plathropp@gmail.com', 1),
(98, 'projas', 'projas', '16880788-0', 'Paulina', 'Rojas', 'Acuña', 'pauli.rojas.a@gmail.com', 1),
(99, 'pcarreno', 'pcarreno', '16657712-8', 'Paulina Andrea', 'Carreño', 'Leguia', 'pauli.carreno@gmail.com', 1),
(100, 'ppino', 'ppino', '8043453-7', 'Pedro Pablo', 'Pino', 'Matus', 'web@saintgasparcollege.cl', 1),
(101, 'procha', 'procha', '13385752-4', 'Priscilla', 'Rocha', 'Caamaño', 'lirquen2004@hotmail.com', 1),
(102, 'rgutierrez', 'rgutierrez', '6624557-8', 'Ricardo', 'Gutierrez', 'Montecino', 'ricardogutierrez1995@gmail.com', 1),
(103, 'rdiaz', 'rdiaz', '13910134-0', 'Ricardo Alberto', 'Diaz', 'Vega', 'jugglercuch@gmail.com', 1),
(104, 'rmercado', 'rmercado', '16225910-5', 'Roberto Jesus', 'Mercado', 'Flores', 'rmercado1986@gmail.com', 1),
(105, 'rdelafuente', 'rdelafuente', '15445728-3', 'Rodrigo Andrés', 'De La Fuente', 'Mundaca', 'rodrigodelaf@hotmail.com', 1),
(106, 'rllana', 'rllana', '8129870-k', 'Rose Marie', 'Llaña', 'Bustos', 'secretaria_ua@saintgasparcollege.cl', 1),
(107, 'sbarria', 'sbarria', '18211790-0', 'Sebastian Enrique', 'Barria', 'Garrido', 'sebastian.barriag@gmail.com', 1),
(108, 'srodriguez', 'srodriguez', '8542077-1', 'Susana Piedad', 'Rodriguez', 'Silva', 'susana1508@yahoo.es', 1),
(109, 'vhuerta', 'vhuerta', '16076482-1', 'Valeria Alejandra', 'Huerta', 'Reyes', 'valeria.huerta.reyes@gmail.com', 1),
(110, 'vrebolledo', 'vrebolledo', '8948874-5', 'Valeria Regina', 'Rebolledo', 'Zehnder', 'valeriarebo@gmail.com', 1),
(111, 'vmiranda', 'vmiranda', '13234766-2', 'Valeska Soledad', 'Miranda', 'Jimenez', 'vmiranda24@hotmail.com', 1),
(112, 'vlanderos', 'vlanderos', '16028010-7', 'Victor Eduardo', 'Landeros', 'Peña', 'profesorvictorlanderos@gmail.com', 1),
(113, 'wurriola', 'wurriola', '13043257-3', 'Wladimir Gerardo', 'Urriola', 'Gonzalez', 'wurriola@hotmail.com', 1),
(114, 'xmeza', 'xmeza', '9571870-1', 'Ximena Del Carmen', 'Meza', 'Labra', 'ximemzl@gmail.com', 1),
(115, 'yrivera', 'yrivera', '8968565-6', 'Yorma Carola', 'Rivera', 'Maturana', 'yorma.rivera@gmail.com', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `valores`
--

CREATE TABLE `valores` (
  `id` int(10) NOT NULL,
  `valor` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Volcado de datos para la tabla `valores`
--

INSERT INTO `valores` (`id`, `valor`) VALUES
(1, 33),
(2, 66.67),
(3, 100),
(4, 133.33);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cargos`
--
ALTER TABLE `cargos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `competencias`
--
ALTER TABLE `competencias`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `criterios`
--
ALTER TABLE `criterios`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones_comp`
--
ALTER TABLE `evaluaciones_comp`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluaciones_ind`
--
ALTER TABLE `evaluaciones_ind`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `evaluacion_tipo`
--
ALTER TABLE `evaluacion_tipo`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `metas`
--
ALTER TABLE `metas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `procesos`
--
ALTER TABLE `procesos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`,`username`,`rut`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT de la tabla `cargos`
--
ALTER TABLE `cargos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
--
-- AUTO_INCREMENT de la tabla `ciclos`
--
ALTER TABLE `ciclos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT de la tabla `competencias`
--
ALTER TABLE `competencias`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT de la tabla `criterios`
--
ALTER TABLE `criterios`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
--
-- AUTO_INCREMENT de la tabla `establecimiento`
--
ALTER TABLE `establecimiento`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT de la tabla `evaluaciones_comp`
--
ALTER TABLE `evaluaciones_comp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=347;
--
-- AUTO_INCREMENT de la tabla `evaluaciones_ind`
--
ALTER TABLE `evaluaciones_ind`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT de la tabla `indicadores`
--
ALTER TABLE `indicadores`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;
--
-- AUTO_INCREMENT de la tabla `metas`
--
ALTER TABLE `metas`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `perfiles`
--
ALTER TABLE `perfiles`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT de la tabla `procesos`
--
ALTER TABLE `procesos`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=116;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
