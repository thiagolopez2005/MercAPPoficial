/*document.addEventListener("DOMContentLoaded", function () {
    console.log("Mostrando pantalla de loader...");

    // Asegúrate de que el loader se muestre inicialmente
    const loaderScreen = document.getElementById("loader-screen");
    const mainContent = document.getElementById("main-content");

    // Simula el tiempo de carga
    window.addEventListener("load", function () {
        setTimeout(() => {
            // Oculta el loader y muestra el contenido principal
            loaderScreen.style.display = "none";
            mainContent.style.display = "block";
            console.log("Transición completada: contenido principal visible.");
        }, 2000); // Ajusta el tiempo según lo que necesites
    });
});

  window.addEventListener("beforeunload", function () {
  document.body.classList.remove("loaded"); // Muestra el loader al cambiar de página
});
*/

document.addEventListener('DOMContentLoaded', () => {
    // Elementos del DOM
    const switchToClientBtn = document.getElementById('switchToClient');
    const switchToAdminBtn = document.getElementById('switchToAdmin');
    const adminForm = document.getElementById('adminForm');
    const ClientForm = document.getElementById('ClientForm');
    const forgotLinkAdmin = document.getElementById('forgotLinkAdmin');
    const forgotLinkClient = document.getElementById('forgotLinkClient');
    const imagenDiv = document.getElementById('imagen');

    let currentForm = 'Client'; // Cliente como formulario inicial

    // Función para limpiar clases de animación
    function resetAnimationClasses(element) {
        element.classList.remove('slide-out-left', 'slide-in-right', 'slide-out-right', 'slide-in-left', 'hidden');
    }

    // Función general para cambiar formularios
    function switchForm(fromForm, toForm, animationOut, animationIn, toImage) {
        imagenDiv.style.backgroundImage = `url('${toImage}')`;

        resetAnimationClasses(fromForm);
        resetAnimationClasses(toForm);

        fromForm.classList.add(animationOut, 'hidden');

        setTimeout(() => {
            fromForm.style.transform = animationOut.includes('left') ? 'translateX(-100%)' : 'translateX(100%)';
            toForm.style.transform = 'translateX(0)';
            toForm.classList.add(animationIn);
            toForm.classList.remove('hidden');
        }, 500);
    }

    // Cambiar de Cliente a Administrador
    switchToAdminBtn.addEventListener('click', function () {
        if (currentForm !== 'admin') {
            switchForm(ClientForm, adminForm, 'slide-out-right', 'slide-in-left', '/static/images/Recolectores.jpeg'); 
            switchToAdminBtn.style.display = 'none';
            switchToClientBtn.style.display = 'block';
            currentForm = 'admin';
        }
    });

    // Cambiar de Administrador a Cliente
    switchToClientBtn.addEventListener('click', function () {
        if (currentForm !== 'Client') {
            switchForm(adminForm, ClientForm, 'slide-out-left', 'slide-in-right', '/static/images/Clientes.jpeg'); 
            switchToClientBtn.style.display = 'none';
            switchToAdminBtn.style.display = 'block';
            currentForm = 'Client';
        }
    });

    // Redireccionar a la página de recuperación de contraseña
    forgotLinkAdmin.addEventListener('click', function(e) {
        // El enlace funcionará normalmente redirigiendo a la URL en el href
    });

    // Redireccionar a la página de recuperación de contraseña para cliente
    forgotLinkClient.addEventListener('click', function(e) {
        // El enlace funcionará normalmente redirigiendo a la URL en el href
    });

    // Mostrar el formulario de cliente inicialmente y ocultar el de admin
    switchToAdminBtn.style.display = "block";
    switchToClientBtn.style.display = "none";
    switchForm(adminForm, ClientForm, 'slide-out-left', 'slide-in-right', '/static/images/Clientes.jpeg');
});