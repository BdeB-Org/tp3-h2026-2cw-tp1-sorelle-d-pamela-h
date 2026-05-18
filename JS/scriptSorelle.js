const listeResto = document.getElementById("resto");
chargerRestaurent();


const bouton = document.querySelector("button");
bouton.addEventListener("click", envoyerReservation);





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
