<?php

require("config.php");
require("autorisieren.php");

$couchID = strval($_POST["couchID"]);

$sql = "

SELECT COUCH.ID, COUCH.titel, COUCH.bild, COUCH.adresse, ST.stadt, COUCH.beschreibung, COUCH.anbieter_user_id, U.name, U.email, COUCH.verfuegbarkeitsstatus, COUCH.timestamp, COUCH.datum_von, COUCH.datum_bis, COUCH.kosten
FROM couch COUCH
INNER JOIN user U
ON COUCH.anbieter_user_id = U.ID
INNER JOIN stadt ST
ON COUCH.stadt = ST.ID
WHERE COUCH.ID = $couchID
ORDER BY COUCH.timestamp DESC;
";


$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}
