<?php

require('config.php');

$email = $_POST["email"];
$username = $_POST["benutzername"];
$password = $_POST["password"];

$password = password_hash($password, PASSWORD_DEFAULT);

$sql = "INSERT INTO user (name, email, password) VALUES (:Name, :Email, :Password)";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute(array('Name' => $username, 'Email' => $email, 'Password' => $password));

if ($erfolg) {

    print_r('<a href="login.html">Registrieren erfolgreich. Weiter zum Login.</a><br><br>');
} else {

    print_r($erfolg);
};