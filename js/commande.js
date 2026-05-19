const formCommande = document.getElementById("formCommande");
const tableCommande = document.getElementById("tableCommande");
const messageCommande = document.getElementById("messageCommande");

async function afficherCommandes() {
    try {
        const commandes = await getAll("commande");

        tableCommande.innerHTML = "";

        commandes.forEach((commande) => {
            const tr = document.createElement("tr");

            tr.innerHTML = `
                <td>${commande.id_commande}</td>
                <td>${commande.prix}</td>
                <td>${commande.adresse_livraison}</td>
                <td>${commande.client_id_client}</td>
                <td>${commande.restaurent_id_restaurent}</td>
                <td>
                    <button onclick="supprimerCommande(${commande.id_commande})">
                        Supprimer
                    </button>
                </td>
            `;

            tableCommande.appendChild(tr);
        });

    } catch (erreur) {
        console.error(erreur);
        messageCommande.textContent = "Erreur lors du chargement.";
    }
}

formCommande.addEventListener("submit", async function(event) {
    event.preventDefault();

    const commande = {
        id_commande: Number(document.getElementById("id_commande").value),
        prix: Number(document.getElementById("prix").value),
        adresse_livraison: document.getElementById("adresse_livraison").value,
        client_id_client: Number(document.getElementById("client_id_client").value),
        restaurent_id_restaurent: Number(document.getElementById("restaurent_id_restaurent").value)
    };

    try {
        await create("commande", commande);

        messageCommande.textContent = "Commande ajoutée avec succès.";
        formCommande.reset();

        afficherCommandes();

    } catch (erreur) {
        console.error(erreur);
        messageCommande.textContent = "Erreur lors de l’ajout.";
    }
});

async function supprimerCommande(id) {
    try {
        await remove("commande", id);

        messageCommande.textContent = "Commande supprimée.";
        afficherCommandes();

    } catch (erreur) {
        console.error(erreur);
        messageCommande.textContent = "Erreur lors de la suppression.";
    }
}

afficherCommandes();