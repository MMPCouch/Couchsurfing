
holeUser();

holeAnfrage();

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
    console.log("anfragebearbeiten.js couchid=" + couchID);
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
                document.querySelector('#infoText').innerHTML = "Hier kannst Du eine Couch-Anfrage bestätigen oder ablehnen:"

                // zeige den korrekten Button an
                document.querySelector('#button-neue').classList.remove("hidden");


            } else {

                document.querySelector('#titel').innerHTML = data[0].titel;
                document.querySelector('#bild').value = data[0].bild;
                document.querySelector('#bild-vorschau').src = data[0].bild;
                //document.querySelector('#motivationstext').innerHTML = data[0].motivationstext;
                document.querySelector('#couch_id').innerHTML = data[0].ID;
                document.querySelector('#anbieter_user_id').innerHTML = data[0].anbieter_user_id;

            }
        })


}

function holeAnfrage() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();

    let urlParams = new URLSearchParams(window.location.search);
    let anfrageID = urlParams.get('anfrageID');
    console.log("anfragebestaetigen.js anfrageID=" + anfrageID);
    formData.append('anfrageID', anfrageID);


    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeAnfrage.php",
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

            //console.table(data);

            if (data.length == 0) {


            } else {

                document.querySelector('#motivationstext').innerHTML = data[0].motivationstext;

                switch (data[0].buchungsstatus) {
                    case '0':
                        //console.log("anfragebestaetigen.js holeanfrage Buchungsstatus = " + data[0].buchungsstatus);
                        document.querySelector('#buchungsstatus').innerHTML = "Anfrage Pendent";
                        break;
                    case '1':
                        //console.log("anfragebestaetigen.js holeanfrage Buchungsstatus = " + data[0].buchungsstatus);
                        document.querySelector('#buchungsstatus').innerHTML = "Anfrage Abgelehnt";
                        break;
                    case '2':
                        //console.log("anfragebestaetigen.js holeanfrage Buchungsstatus = " + data[0].buchungsstatus);
                        document.querySelector('#buchungsstatus').innerHTML = "Anfrage Bestätigt";
                        break;
                    default:
                    // none
                }

            }
        })


}

function anfrageAnnehmen() {
    aktualisiereAnfrage(true);
    location.reload();
}

function anfrageAblehnen() {
    aktualisiereAnfrage(false);
    location.reload();
}

function aktualisiereAnfrage(buchungsstatus) {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    let urlParams = new URLSearchParams(window.location.search);
    let anfrageID = urlParams.get('anfrageID');
    console.log("anfragebestaetigen.js aktualisiereAnfrage anfrageID=" + anfrageID);
    formData.append('anfrageID', anfrageID);

    if (buchungsstatus) {
        // Buchungsstatus neu auf 2 setzen falls angenommen
        let buchungsStatusNeu = "2";
        console.log("anfragebearbeiten.js aktualisiereAnfrage buchungsStatusNeu = 2");
        formData.append('buchungsstatus', buchungsStatusNeu);
    }
    else {
        // Buchungsstatus neu auf 1 setzen falls abgelehnt
        let buchungsStatusNeu = "1";
        console.log("anfragebearbeiten.js aktualisiereAnfrage buchungsStatusNeu = 1");
        formData.append('buchungsstatus', buchungsStatusNeu);
    }

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/aktualisiereAnfrage.php",
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


function logout() {

    localStorage.clear();
    window.location = "login.html";

}