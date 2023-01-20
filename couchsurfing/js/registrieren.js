console.log("reg");



function registrieren() {

    let benutzername = document.querySelector("#benutzername").value;
    let email = document.querySelector("#email").value;
    let password = document.querySelector("#password").value;
    //console.log("Registrieren: usr= " + benutzername + " / email= " + email + " / pwd= "+password);


    let formData = new FormData();
    formData.append('benutzername', benutzername);
    formData.append('email', email);
    formData.append('password', password);

    fetch("https://716000-5.web.fhgr.ch/couchsurfing/php/registrieren.php",
        {
            body: formData,
            method: "post",
        })

        .then((res) => {

            return res.text();

        })
        .then((data) => {

            //console.log(data);
            document.querySelector('#nachricht').innerHTML = data;

        })


}


