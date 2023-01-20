var couchID = 0;

var anfragen = [];

holeUserCouch();

holeUserCouchAnfragen();

function neueCouch() {

    //console.log("neue couch erstellen");

    let titel = document.querySelector("#titel").value;
    let adresse = document.querySelector("#adresse").value;
    let bild = document.querySelector("#bild").value;
    let beschreibung = document.querySelector("#beschreibung").value;
    let stadt = document.querySelector("#stadt").value;
    let status = document.querySelector("input[name='status']:checked").value;
    let datum_von = document.querySelector("#datum_von").value;
    let datum_bis = document.querySelector("#datum_bis").value;
    let kosten = document.querySelector("#kosten").value;

    let formData = new FormData();
    formData.append('titel', titel);
    formData.append('adresse', adresse);
    formData.append('bild', bild);
    formData.append('beschreibung', beschreibung);
    formData.append('stadt', stadt);
    formData.append('status', status);
    formData.append('datum_von', datum_von);
    formData.append('datum_bis', datum_bis);
    formData.append('kosten', kosten);


    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    formData.append('user', userID);

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/neueCouch.php",
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

function holeUserCouch() {

    // get authentication  variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeUserCouch.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

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


                couchID = data[0].ID;

                // zeige Infotext an
                document.querySelector('#infoText').innerHTML = "Hier kannst du deine Couch bearbeiten:"

                // zeige den korrekten Button an
                document.querySelector('#button-aktualisieren').classList.remove("hidden");
                document.querySelector('#button-loeschen').classList.remove("hidden");

                // fülle das Formular mit den Werten aus der DB aus
                document.querySelector('#titel').value = data[0].titel;
                document.querySelector('#adresse').value = data[0].adresse;
                document.querySelector('#beschreibung').value = data[0].beschreibung;
                document.querySelector('#stadt').value = data[0].stadt;
                document.querySelector('#bild').value = data[0].bild;
                document.querySelector('#bild-vorschau').src = data[0].bild;

                document.querySelector('#datum_von').value = data[0].datum_von;
                document.querySelector('#datum_bis').value = data[0].datum_bis;
                document.querySelector('#kosten').value = data[0].kosten;

                // setze den korrekten Status (Radiobutton) aus den Infos der DB
                if (data[0].verfuegbarkeitsstatus == 1) {

                    document.querySelector('#status-frei').checked = true;

                } else {

                    document.querySelector('#status-besetzt').checked = true;

                }


            }
        })
}

function aktualisiereCouch() {

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    // Formulardaten in Body übertragen
    let titel = document.querySelector('#titel').value;
    let adresse = document.querySelector('#adresse').value;
    let beschreibung = document.querySelector('#beschreibung').value;
    let stadt = document.querySelector('#stadt').value;
    let bild = document.querySelector('#bild').value;
    let status = document.querySelector('input[name="status"]:checked').value;
    let datum_von = document.querySelector("#datum_von").value;
    let datum_bis = document.querySelector("#datum_bis").value;
    let kosten = document.querySelector("#kosten").value;

    //let jsonHashtags = JSON.stringify(hashtags);

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('titel', titel);
    formData.append('adresse', adresse);
    formData.append('beschreibung', beschreibung);
    formData.append('stadt', stadt);
    formData.append('status', status);
    formData.append('bild', bild);
    formData.append('datum_von', datum_von);
    formData.append('datum_bis', datum_bis);
    formData.append('kosten', kosten);

    formData.append('couchID', couchID);

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/aktualisiereCouch.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.text();

            } else {

                //alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "login.html"

            }

        })
        .then((data) => {

            // zeige die Nachricht an
            document.querySelector('#nachricht').innerHTML = data;

        })
}

function loescheCouch() {

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);
    formData.append('couchID', couchID);

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/loescheCouch.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                return res.text();

            } else {

                //alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "login.html"

            }

        })
        .then((data) => {

            //console.log(data);
            document.querySelector('#nachricht').innerHTML = data;

            // button aktualisieren
            document.querySelector('#button-neue').classList.remove("hidden");
            document.querySelector('#button-aktualisieren').classList.add("hidden");
            document.querySelector('#button-loeschen').classList.add("hidden");

            // Formularfelder leeren
            document.querySelector('#titel').value = "";
            document.querySelector('#adresse').value = "";
            document.querySelector('#beschreibung').value = "";
            document.querySelector('#stadt').value = "";
            document.querySelector('#bild').value = "";
            document.querySelector('#status-frei').checked = false;
            document.querySelector('#status-besetzt').checked = false;

            document.querySelector('#bild-vorschau').src = "";

            document.querySelector('#datum_von').value = "";
            document.querySelector('#datum_bis').value = "";
            document.querySelector('#kosten').value = "";

            // Variablen leeren
            hashtags = [];
            couchID = "";



        })
};


function holeUserCouchAnfragen() {

    // get authentication variables from localstorage
    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    anfragen.length = 0;

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeUserCouchAnfragen.php",
        {
            body: formData,
            method: "post",
            headers: {

                'Authorization': 'Basic ' + btoa(userID + ':' + token),

            }
        })

        .then((res) => {

            // error handling if session is expired
            if (res.status >= 200 && res.status < 300) {

                //console.log("in couch.js holeUserCouchAnfragen 1");

                //return res.text();
                return res.json();

            } else {

                //alert('Deine Sitzung ist abgelaufen. Du wirst auf die Login-Seite weitergeleitet.');
                window.location = "login.html"

            }

        })
        .then((data) => {

            if (data) {

                let list = document.getElementById("anfragenListe");
                list.innerHTML = '';

                // Titel nur Anzeigen falls Buchungen vorhanden
                if (data.length < 1 || data == undefined) {
                    //empty
                }
                else {
                    var listentitel = document.createTextNode("Folgende Buchungsanfragen liegen vor:");
                    list.appendChild(listentitel);
                    list.appendChild(document.createElement("br"));
                    list.appendChild(document.createElement("br"));
                }



                data.forEach(anfrage => {


                    //console.log(anfrage.name);
                    let buchungsstatusAktuell = "";

                    switch (anfrage.buchungsstatus) {
                        case '0':
                            //console.log("couch.js holeUserCouchanfrage Buchungsstatus = " + anfrage.buchungsstatus);
                            buchungsstatusAktuell = "Pendent";
                            break;
                        case '1':
                            //console.log("couch.js holeUserCouchanfrage Buchungsstatus = " + anfrage.buchungsstatus);
                            buchungsstatusAktuell = "Abgelehnt";
                            break;
                        case '2':
                            //onsole.log("couch.js holeUserCouchanfrage Buchungsstatus = " + anfrage.buchungsstatus);
                            buchungsstatusAktuell = "Bestätigt";
                            break;
                        default:
                        // none
                    }


                    var a = document.createElement('a');

                    var link = document.createTextNode("Anfrage von Benutzer " + anfrage.name + " bearbeiten. Aktueller Status: " + buchungsstatusAktuell);

                    a.appendChild(link);

                    a.href = "anfragebearbeiten.html?anfrageID=" + anfrage.AnfrageID + "&couchID=" + anfrage.couch_id;

                    list.appendChild(a);
                    list.appendChild(document.createElement("br"));


                }
                );

            }

        })

}

function logout() {

    localStorage.clear();
    window.location = "login.html";

}
