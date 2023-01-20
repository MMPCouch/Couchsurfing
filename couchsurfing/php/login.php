<?php

require('config.php');

$email = $_POST["email"];
$password = $_POST["password"];

// SELECT

$sql = "SELECT * FROM user WHERE email = '$email'";

$stmt = $pdo->prepare($sql);

$erfolg = $stmt->execute();

if ($erfolg) {

    $array = $stmt->fetchAll();

    $recordcount = count($array);
    

       if ($recordcount == 1){

        $dbPassword = $array[0]['password'];
        $userID = $array[0]['id'];

        pruefePassword($password, $dbPassword, $userID);
        //print_r("Existing account email");

    } else{
        
        sendeAntwort('Nonexisting account email', 0, 0);

    }

    //$jsonArray = json_encode($array);

    //print_r($jsonArray);
}

function pruefePassword($userPassword, $dbPassword, $userID){

    if (password_verify($userPassword, $dbPassword)) {
        //echo 'Password is valid';
        erstelleToken($userID);
    } else {
        //echo 'Invalid password.';
        sendeAntwort('Invalid password', 0, 0);
    }


}

function erstelleToken($userID){
    
    require('config.php');

    $token = generateRandomString(42);

    //$sql = "INSERT INTO user (name, email, password) VALUES (:Name, :Email, :Password)";

    $sql = " INSERT INTO session (user_id, token) VALUES (:user_id, :token)";

    //INSERT INTO session (user_id, token) VALUES (17, 'sdkljsd');

    $stmt = $pdo->prepare($sql);

    $erfolg = $stmt->execute(array('user_id' => $userID, 'token' => $token));

    if ($erfolg) {

        //print('Session erfolgreich erstellt');
                        
        sendeAntwort('Session_CREATED', $userID, $token);
        

    } else {

        print($erfolg);

        sendeAntwort('Datenbankfehler: ' .$erfolg, 0, 0);
    };


}

function generateRandomString($length)
{
    $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function sendeAntwort($nachricht, $userID, $token){

    $antwort = [$nachricht, $userID, $token];

    $antwort = json_encode($antwort);

    //console.log("Antwort: " + $antwort);
    print($antwort);
   

}