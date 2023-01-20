<?php

require_once('config.php');
require_once('autorisieren.php');

$userID = $_POST["userID"];
$couchID = $_POST["couchID"];

$sql = "DELETE FROM couch WHERE anbieter_user_id = ? AND ID = ?";
$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute([$userID, $couchID]);

if ($erfolg) {

    
    
    } else {

    print_r($erfolg);
};
