const listeResto = document.getElementById("resto");
chargerRestaurent();


const bouton = document.querySelector("button");
bouton.addEventListener("click", envoyerReservation);


const tableReservation = document.getElementById("tableReservation");
console.log(tableReservation);
chargerReservation();




function envoyerReservation(event) {



    event.preventDefault();

    const dateInput = document.getElementById("date").value;

    const heureInput = document.getElementById("heure").value;
    const idClient = Math.floor(Math.random() * 1000);

const client = {

    id_client : idClient,

    nom : "Client",

    prenom : document.querySelectorAll("input")[0].value,

    email : document.querySelectorAll("input")[1].value,

    telephone : document.querySelectorAll("input")[2].value
};



    const reservation = {

        id_reservation : Math.floor(Math.random() * 1000),

        date_reservation : dateInput + "T00:00:00.000Z",

        heure : "2026-01-01T" + heureInput + ":00.000Z",

        nbr_personne : document.querySelectorAll("input")[3].value,

        client_id_client : idClient,

        restaurent_id_restaurent : listeResto.value
    };



    ajouterClient(client)

    .then(data => {

        ajouterReservation(reservation)

        .then(data => {

            console.log(data);

            alert("Réservation ajoutée");
            chargerReservation();
        });
    });

}



function chargerRestaurent() {


    getRestaurent()

    .then(restaurants => {

        restaurants.forEach(resto => {

            listeResto.innerHTML += `

                <option value="${resto.id_restaurent}">
                    ${resto.ville} - ${resto.adress} 
                </option>

            `;
        });
    });
}




function chargerReservation() {

    getReservation()

    .then(reservations => {

        console.log(reservations);

        tableReservation.innerHTML = "";

        reservations.forEach(reservation => {

            tableReservation.innerHTML += `

                <tr>

                    <td>${reservation.client_id_client}</td>

                    <td>${reservation.date_reservation.substring(0,10)}</td>

                   <td>${reservation.heure.substring(11,16)}</td>

                    <td>${reservation.nbr_personne}</td>

                    <td>${reservation.restaurent_id_restaurent}</td>

                    <td>
                    
                    <button onclick="supprimerReservation(${reservation.id_reservation})">
                        Supprimer
                    </button>
                     </td>

                </tr>

            `;
        });
    });
}


