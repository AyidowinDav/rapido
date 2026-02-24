<?php 
$hostname = "localhost";
$username = "root";
$password = "";
$database = "rapido";

$connexion = mysqli_connect(hostname: $hostname, username: $username, password: $password, database: $database);

if (!$connexion) {
    die("Connexion echouée : "  . mysqli_connect_error());
}
?>