<?php


require("config.php");
require("autorisieren.php");

$couch_id = $_POST["couch_id"];
$gast_user_id = $_POST["gast_user_id"];
$motivationstext = $_POST["motivationstext"];
$buchungsstatus = $_POST["buchungsstatus"];
$anbieter_user_id = $_POST["anbieter_user_id"];

$sql = "INSERT INTO buchungsanfrage (couch_id, gast_user_id, motivationstext, buchungsstatus, anbieter_user_id) VALUES (:Couchid, :Gastuserid, :Motivationstext, :Buchungsstatus, :Anbieteruserid)";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute(array('Couchid' => $couch_id, 'Gastuserid' => $gast_user_id, 'Motivationstext' => $motivationstext, 'Buchungsstatus' => $buchungsstatus, 'Anbieteruserid' => $anbieter_user_id));

if ($erfolg) {

    print_r('Deine Buchungsanfrage wurde erfolgreich gespeichert, der Anbieter wird Dich kontaktieren.');

    $letzteID = $pdo->lastInsertId();

} else {

    print_r($erfolg);
};