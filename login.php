<?php
session_start();
include_once("db_connect.php");
if(isset($_POST['login_button'])) {
	$user_name = trim($_POST['user_name']);
	$user_password = trim($_POST['password']);
	$sql = "SELECT id, username, password, nombre, apellidop, establecimiento_id
						FROM usuarios, trabaja
						WHERE username='$user_name'";
	$resultset = $conn->query($sql) or die("database error:". $conn->error);
	$row = $resultset->fetch_assoc();
	if($row['password']==$user_password){
		echo "ok";
		$_SESSION['id'] = $row['id'];
		$_SESSION['username'] = $row['username'];
		$_SESSION['nombre'] = $row['nombre'];
		$_SESSION['apellidop'] = $row['apellidop'];
		$_SESSION['e_id'] = $row['establecimiento_id'];
		$_SESSION['proceso_id'] = 0;
	} else {
		echo "Usuario o Contraseña incorrectos";
	}
}
else {
	header("Location: index.php");
}
?>
