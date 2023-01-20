<?php

require_once('config.php');
require_once('autorisieren.php');

$buchungsstatus = $_POST["buchungsstatus"];
$anfrageID = $_POST["anfrageID"];

$sql = "UPDATE buchungsanfrage SET buchungsstatus=? WHERE ID=?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$buchungsstatus, $anfrageID]);


if ($erfolg) {

    print_r("Die Buchungsanfrage wurde aktualisiert.");
   

} else {

    print_r($erfolg);

};

