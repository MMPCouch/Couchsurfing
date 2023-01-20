<?php

require("config.php");
require("autorisieren.php");

$userID = $_POST["userID"];


$sql = "
SELECT ANFRAGE.ID as AnfrageID, ANFRAGE.couch_id, ANFRAGE.buchungsstatus, U.name, U.ID
FROM buchungsanfrage ANFRAGE
INNER JOIN user U
ON ANFRAGE.gast_user_id = U.ID
WHERE ANFRAGE.anbieter_user_id = $userID
";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}
