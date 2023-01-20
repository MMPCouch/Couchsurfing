<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$titel = $_POST["titel"];
$adresse = $_POST["adresse"];
$beschreibung = $_POST["beschreibung"];
$stadt = $_POST["stadt"];
$status = $_POST["status"];
$bild = $_POST["bild"];
$datum_von = $_POST["datum_von"];
$datum_bis = $_POST["datum_bis"];
$kosten = $_POST["kosten"];


$sql = "UPDATE couch SET titel=?, bild=?, adresse=?, stadt=?, beschreibung=?, verfuegbarkeitsstatus=?, datum_von=?, datum_bis=?, kosten=? WHERE anbieter_user_id=?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$titel, $bild, $adresse, $stadt, $beschreibung, $status, $datum_von, $datum_bis, $kosten, $userID]);


if ($erfolg) {

    print_r("Dein Inserat wurde aktualisiert.");
   

} else {

    print_r($erfolg);

};

