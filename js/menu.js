const tableMenu = document.getElementById("tableMenu");
const messageMenu = document.getElementById("messageMenu");

async function afficherMenu() {
    try {
        const plats = await getAll("menu");

        tableMenu.innerHTML = "";

        for (const plat of plats) {
            const tr = document.createElement("tr");

            tr.innerHTML = `
                <td>${plat.id_plat}</td>
                <td>${plat.nom_plat}</td>
                <td>${plat.categorie ?? ""}</td>
                <td>${plat.prix_plat ?? ""} $</td>
                <td>
                    <a class="btn-commander" href="commande.html">Commander</a>
                </td>
            `;

            tableMenu.appendChild(tr);
        }
    } catch (erreur) {
        console.log(erreur);
        messageMenu.textContent = "Erreur lors du chargement du menu.";
    }
}

afficherMenu();