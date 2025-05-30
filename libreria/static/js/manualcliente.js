// Obtiene una referencia a los elementos HTML por su ID
const botonManual = document.getElementById('botonManual');
const manualTexto = document.getElementById('manualTexto');
const pdfViewer = document.getElementById('pdfViewer'); // Referencia al iframe del PDF

// Añade un "escuchador de eventos" al botón del manual
botonManual.addEventListener('click', () => {
    // 1. Alterna la clase 'mostrar' en el div 'manualTexto'
    // Esto es útil si tienes estilos CSS asociados a '.mostrar' para el texto principal.
    manualTexto.classList.toggle('mostrar');

    // 2. Controla la visibilidad del iframe del PDF
    // Si 'manualTexto' ahora tiene la clase 'mostrar' (es decir, se está mostrando),
    // entonces muestra el iframe del PDF.
    if (manualTexto.classList.contains('mostrar')) {
        pdfViewer.style.display = 'block'; // Muestra el iframe (como un bloque)
    } else {
        // Si 'manualTexto' ya no tiene la clase 'mostrar' (es decir, se está ocultando),
        // oculta también el iframe del PDF.
        pdfViewer.style.display = 'none'; // Oculta el iframe
    }
});