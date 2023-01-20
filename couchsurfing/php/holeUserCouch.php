<?php

require("config.php");
require("autorisieren.php");

$userID = $_POST["userID"];

$sql = "SELECT * FROM couch WHERE anbieter_user_id = $userID";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}
