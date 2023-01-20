
holeUser();

holeCouches();

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

            // mache etwas

            //console.log(data);

            document.querySelector("#username").innerHTML = data[0].name;

        })


}
function holeCouches() {

    let userID = localStorage.getItem('userID');
    let token = localStorage.getItem('token');

    let formData = new FormData();
    formData.append('userID', userID);

    let urlParams = new URLSearchParams(window.location.search);

    if (urlParams.has('stadtID')) {
        let stadtID = urlParams.get('stadtID');

        // GÜLTIGE STADT-IDS VALIDIEREN
        if (stadtID == '1' || stadtID == '2' || stadtID == '3') {
            //console.log("script.js stadtid=" + stadtID);
            formData.append('stadtID', stadtID);
        }

    }



    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/holeCouches.php",
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

            // mache etwas

            CouchesAnzeigen(data);

            //console.log("data von script.js holeCouches : " + data);


        })


}


function CouchesAnzeigen(data) {

    data.forEach(couch => {

        let anfrageLink = "";
        let anfrageURL = "";

        if (parseInt(couch.verfuegbarkeitsstatus)) {

            couch.verfuegbarkeitsstatus = 'Momentan verfügbar: ';

            anfrageLink = '<a href="anfragen.html?couchID=' + couch.ID + '">Buchung anfragen</a>';
            //anfrageLink = '<a href="anfragen.html?couchID=' + couch.ID + '"><span class="couch-link"></span></a>';
            //anfrageURL = 'anfragen.html?couchID=' + couch.ID;
            //console.log(anfrageLink);


        } else {

            couch.verfuegbarkeitsstatus = "<div class='leiderBesetzt'>Leider besetzt:</div>"
            anfrageLink = "";
            //anfrageURL = "";


        }


        let couchContainer = document.createElement("div");
        couchContainer.innerHTML =      

                       
            '<div class="couch">' +
            '<h2>' + couch.verfuegbarkeitsstatus + ' ' + couch.titel + '</h2>' +
            '<p>' + anfrageLink + '</p>' +
            '<img class="couch-image" src="' + couch.bild + '">' +
            /* '<p>Beschreibung: ' + couch.beschreibung + '</p>' + */
            'Ort: ' + couch.stadt + '<br>' +
            'Adresse: ' + couch.adresse + '<br>' +
            'Anbieter: ' + couch.email + '<br>' +
            '<p>Verfügbar von: ' + couch.datum_von + '</p>' +
            'Verfügbar bis: ' + couch.datum_bis + '<br>' +
            '<p>Kosten: ' + couch.kosten + '</p>' +
            '</div>';
           
        document.getElementById("liste-couch").appendChild(couchContainer);

    });

}

// logout
// logout
// logout
// logout

function logout() {

    localStorage.clear();
    window.location = "login.html";

}