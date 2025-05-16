const botonManual = document.getElementById('botonManual');
const manualTexto = document.getElementById('manualTexto');

botonManual.addEventListener('click', () => {
    manualTexto.classList.toggle('mostrar');
});