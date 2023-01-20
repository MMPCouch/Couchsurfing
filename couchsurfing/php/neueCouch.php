<?php


require("config.php");
require("autorisieren.php");


$user = $_POST["user"];
$titel = $_POST["titel"];
$adresse = $_POST["adresse"];
$bild = $_POST["bild"];
$beschreibung = $_POST["beschreibung"];
$stadt = $_POST["stadt"];
$status = $_POST["status"];
$datum_von = $_POST["datum_von"];
$datum_bis = $_POST["datum_bis"];
$kosten = $_POST["kosten"];


$sql = "INSERT INTO couch (titel, bild, adresse, stadt, beschreibung, anbieter_user_id, verfuegbarkeitsstatus, datum_von, datum_bis, kosten) VALUES (:Titel, :Bild, :Adresse, :Stadt, :Beschreibung, :User, :Status, :Datum_von, :Datum_bis, :Kosten)";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute(array('Titel' => $titel, 'Bild' => $bild, 'Adresse' => $adresse, 'Stadt' => $stadt, 'Beschreibung' => $beschreibung, 'User' => $user, 'Status' => $status, 'Datum_von' => $datum_von, 'Datum_bis' => $datum_bis, 'Kosten' => $kosten));

if ($erfolg) {

    print_r('Couch erstellen erfolgreich.');

    $letzteID = $pdo->lastInsertId();
  
} else {

    print_r($erfolg);
};