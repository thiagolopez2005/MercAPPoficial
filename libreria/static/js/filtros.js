document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-input");
    const tableRows = document.querySelectorAll("#providers-table tbody tr");

    searchInput.addEventListener("input", function () {
        const filter = searchInput.value.toLowerCase();

        tableRows.forEach(row => {
            // Si la fila tiene la celda de nombre
            const providerCell = row.querySelector(".provider-name");
            if (providerCell) {
                const providerName = providerCell.textContent.toLowerCase();
                if (providerName.includes(filter)) {
                    row.style.display = ""; // Mostrar fila
                } else {
                    row.style.display = "none"; // Ocultar fila
                }
            }
        });
    });
});


document.addEventListener("DOMContentLoaded", function () {
    const searchInput = document.getElementById("search-input");
    const facturaCards = document.querySelectorAll(".factura-card");

    searchInput.addEventListener("input", function () {
        const filtro = searchInput.value.trim().toLowerCase();

        facturaCards.forEach(card => {
            // Busca el número de factura en el título h5
            const titulo = card.querySelector("h5");
            if (titulo) {
                // Extrae solo el número (después de "#")
                const texto = titulo.textContent.toLowerCase();
                if (texto.includes(filtro)) {
                    card.style.display = "";
                } else {
                    card.style.display = "none";
                }
            }
        });
    });
});

