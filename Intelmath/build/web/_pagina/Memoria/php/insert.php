<?php
moves = $_POST["moves"];
echo $moves;
require ("conexion.php");
$sql = "INSERT INTO juego_uno (moves) VALUES ('".$moves."')";
mysqli_query($connection,$sql);
echo 1;
?>