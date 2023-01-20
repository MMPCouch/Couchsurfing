<?php

require("config.php");
require("autorisieren.php");


if ($_SERVER['REQUEST_METHOD'] == 'POST' && array_key_exists('stadtID', $_POST))    
    {
        // COUCHES SUCHEN GEFILTERT NACH STANDORT FALLS POST-PARAMETER VORHANDEN
        $stadtID = $_POST['stadtID'];

        $sql = "

        SELECT COUCH.ID, COUCH.titel, COUCH.bild, COUCH.adresse, COUCH.stadt, ST.stadt, COUCH.beschreibung, U.name, U.email, COUCH.verfuegbarkeitsstatus, COUCH.timestamp, COUCH.datum_von, COUCH.datum_bis, COUCH.kosten
        FROM couch COUCH
        INNER JOIN user U
        ON COUCH.anbieter_user_id = U.ID
        INNER JOIN stadt ST
        ON COUCH.stadt = ST.ID
        WHERE COUCH.stadt = $stadtID
        ORDER BY COUCH.timestamp DESC;

        ";
        
    }
    else{
        // ALLE COUCHES SUCHEN
        $sql = "

        SELECT COUCH.ID, COUCH.titel, COUCH.bild, COUCH.adresse, COUCH.stadt, ST.stadt, COUCH.beschreibung, U.name, U.email, COUCH.verfuegbarkeitsstatus, COUCH.timestamp, COUCH.datum_von, COUCH.datum_bis, COUCH.kosten
        FROM couch COUCH
        INNER JOIN user U
        ON COUCH.anbieter_user_id = U.ID
        INNER JOIN stadt ST
        ON COUCH.stadt = ST.ID
        ORDER BY COUCH.timestamp DESC;

        ";

    }


$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $jsonArray = json_encode($array);

    print_r($jsonArray);
}
