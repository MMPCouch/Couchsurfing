<?php

require("config.php");
require("autorisieren.php");

$anfrageID = strval($_POST["anfrageID"]);

/*
$sql = "
SELECT ANFRAGE.ID as AnfrageID, ANFRAGE.couch_id, ANFRAGE.motivationstext, ANFRAGE.buchungsstatus, U.name, U.ID as gast_user_id
FROM buchungsanfrage ANFRAGE
INNER JOIN user U
ON ANFRAGE.gast_user_id = U.ID
WHERE ANFRAGE.ID = $anfrageID
";
*/
$sql = "
SELECT ANFRAGE.motivationstext, ANFRAGE.buchungsstatus
FROM buchungsanfrage ANFRAGE
WHERE ANFRAGE.ID = $anfrageID
";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}
