<?php

require('config.php');

//echo "<pre>" . var_export($_SERVER, true) . "</pre>";

loescheSessions();


// Authorisierung Server Variablen
$userID = $_SERVER["PHP_AUTH_USER"];
$token = $_SERVER["PHP_AUTH_PW"];

//echo "Autorisieren: userID: " . $userID . " token: " . $token;

//$sql = "SELECT * FROM session WHERE user_id = '$userID' AND token = '$token'";
$sql = "
SELECT * FROM session
WHERE user_id = '$userID'
AND token = '$token'
AND timestamp > (NOW() - INTERVAL 2 HOUR)
";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $resultate = $stmt->fetchAll();

    $sitzungsID  = $resultate[0]['id'];
    //print_r($sitzungsID);
    

    $anzahlresultate = count($resultate);

    if($anzahlresultate == 1){

        //session verlängern
        updateSession($sitzungsID);
       
    }else{

         exit(http_response_code(401));
    }

    //$jsonArray = json_encode($resultate);

    //print_r($jsonArray);
}

function updateSession($sitzungsID){
    
    require('config.php');
    
    $sql = "UPDATE session SET timestamp = now() WHERE id=?";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([$sitzungsID]);

}

function loescheSessions(){

    require('config.php');

    $sql = "
    DELETE 
    FROM session
    WHERE timestamp < (NOW() - INTERVAL 2 HOUR);";

    $stmt = $pdo->prepare($sql);
    $stmt->execute();

}

