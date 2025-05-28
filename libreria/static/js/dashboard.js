// Esperar a que el DOM esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
    // ... (Tu código para el menú responsive iría aquí) ...

    // Funcionalidad para el botón de cerrar sesión
    // Usamos la clase 'logout-icon' que añadimos en el HTML
    const logoutIcon = document.querySelector('.user-menu .logout-icon');

    if (logoutIcon) {
        logoutIcon.addEventListener('click', function(event) {
            // Previene la acción predeterminada del ícono (si la tiene)
            event.preventDefault();

            if (confirm('¿Estás seguro que deseas cerrar sesión?')) {
                // Aquí iría la lógica de cierre de sesión real
                // Por ejemplo, una llamada a tu servidor para invalidar la sesión
                window.location.href = '/login'; // Redirige a la página de login
            }
        });
    } else {
        console.warn('El ícono de cerrar sesión no se encontró. Asegúrate de que tenga la clase "logout-icon".');
    }

    // ... (Cualquier otra funcionalidad JavaScript) ...
});
