const URL_RESERVATION = "http://localhost:8080/ords/resto/reservation/";

const URL_CLIENT = "http://localhost:8080/ords/resto/client/";

function ajouterClient(client) {

    return fetch(URL_CLIENT, {

        method : "POST",

        headers : {
            "Content-Type" : "application/json"
        },

        body : JSON.stringify(client)
    })

    .then(reponse => reponse.json());
}


function ajouterReservation(reservation) {

    return fetch(URL_RESERVATION, {

        method : "POST",
        headers : { "Content-Type" : "application/json" },

        body : JSON.stringify(reservation)
    }
)
    .then(reponse => reponse.json());
}

function getRestaurent() {

    return fetch("http://localhost:8080/ords/resto/restaurent/")
    .then(reponse => reponse.json())
    .then(data => data.items);
}





function getReservation() {

    return fetch("http://localhost:8080/ords/resto/reservation/")

    .then(reponse => reponse.json())

    .then(data => data.items);
}






function supprimerReservation(id) {

    fetch(`http://localhost:8080/ords/resto/reservation/${id}`, {

        method: "DELETE"
    })

    .then(() => {

        alert("Réservation supprimée");

        chargerReservation();
    });
}
