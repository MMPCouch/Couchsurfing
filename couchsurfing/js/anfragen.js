
holeUser();

holeCouch();

function holeUser() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);


    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeUser.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
            if (res.status >= 200 && res.status < 300) {

                //return res.text();
                return res.json();

            } else {

                //alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "login.html"

            }

        })
        .then((data) => {


            console.log(data);


        })


}

function holeCouch() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();

    let urlParams = new URLSearchParams(window.location.search);
    let couchID = urlParams.get('couchID');
    //console.log("anfragen.js couchid=" + couchID);
    formData.append('couchID', couchID);



    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeCouch.php?couchID=" + couchID,
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // falls die Sitzung nicht abgelaufen ist, verarbeite die JSON antwort
            if (res.status >= 200 && res.status < 300) {

                //return res.text();
                return res.json();

            } else {

                //alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "login.html"

            }

        })
        .then((data) => {


            if (data.length == 0) {

                // zeige Infotext an
                document.querySelector('#infoText').innerHTML = "Fülle dieses Formular aus, um deine Couch aufzuschalten:"

                // zeige den korrekten Button an
                document.querySelector('#button-neue').classList.remove("hidden");


            } else {

                document.querySelector('#titel').innerHTML = data[0].titel;
                document.querySelector('#adresse').innerHTML = data[0].adresse;
                document.querySelector('#beschreibung').innerHTML = data[0].beschreibung;
                document.querySelector('#bild').value = data[0].bild;
                document.querySelector('#bild-vorschau').src = data[0].bild;
                document.querySelector('#datum_von').innerHTML = data[0].datum_von;
                document.querySelector('#datum_bis').innerHTML = data[0].datum_bis;
                document.querySelector('#kosten').innerHTML = data[0].kosten;
                document.querySelector('#couch_id').innerHTML = data[0].ID;
                document.querySelector('#anbieter_user_id').innerHTML = data[0].anbieter_user_id;


            }
        })


}




function neueAnfrage() {

    //required: couch_id, gast_user_id, motivationstext, buchungsstatus, anbieter_user_id

    console.log("neue anfrage erstellen");

    let token = localStorage.getItem('token');
    let userID = localStorage.getItem('userID');

    let motivationstext = document.querySelector("#motivationstext").value;

    let couch_id = document.querySelector("#couch_id").textContent.trim();
    let anbieter_user_id = document.querySelector("#anbieter_user_id").textContent.trim();

    let formData = new FormData();
    formData.append('couch_id', couch_id);
    formData.append('gast_user_id', userID);
    formData.append('motivationstext', motivationstext);
    formData.append('buchungsstatus', "0");
    formData.append('anbieter_user_id', anbieter_user_id);


    if (userID == anbieter_user_id) {
        // Validierung: Buchungsanafrage bei eigenem Couch-Angebot nicht zulassen
        document.querySelector('#nachricht').innerHTML = "Dummchen, das ist deine eigene Couch, brauchst Du nicht zu buchen :)";


    } else {

        fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/neueAnfrage.php",
            {
                body: formData,
                method: "post",

                headers: {

                    'Authorization': 'Basic ' + btoa(userID + ':' + token),

                }
            })

            .then((res) => {

                return res.text();

            })
            .then((data) => {

                //console.log(data);
                document.querySelector('#nachricht').innerHTML = data;

            })
    }




}


function logout() {

    localStorage.clear();
    window.location = "login.html";

}