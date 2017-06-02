<?php
// MySQL Connection
$servername = "localhost";
$username = "mysqluser";
$password = "mysqluser123";
$dbname = "sesiones";
$conn = new mysqli($servername, $username, $password, $dbname);
$conn->set_charset("utf8"); //Mysql en español
if($mysqli->connect_errno > 0){
     die("Imposible conectarse con la base de datos [" . $mysqli->connect_error . "]");
}
?>
