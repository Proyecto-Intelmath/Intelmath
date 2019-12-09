<?php
$puntaje = $_POST["puntaje"];
echo $puntaje;
require ("conexion.php");
$sql = "INSERT juego_tres (puntaje) VALUES ('".$puntaje."')";
mysqli_query($connection,$sql);

?>