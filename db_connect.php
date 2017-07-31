<?php
// MySQL Connection
$servername = "localhost";//"sed.saintgasparcollege.cl";
$username = "root";//"saintgas_admin";
$password = "mysqluser123";//"admsesiones2017";
$dbname = "sesiones";//"saintgas_sesiones";
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8"); //Mysql en español
if($mysqli->connect_errno > 0){
     die("Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");
}
?>
