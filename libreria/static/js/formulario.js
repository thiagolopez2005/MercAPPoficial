// Esperar a que el documento esté completamente cargado
document.addEventListener('DOMContentLoaded', function() {
    // Simular carga durante 1.5 segundos
    setTimeout(function() {
        document.getElementById('loader-screen').style.display = 'none';
        document.getElementById('main-content').style.display = 'block';
    }, 1500);

    // Configurar los botones para mostrar/ocultar contraseña
    setupPasswordToggle('id_password1', 'togglePassword');
    setupPasswordToggle('id_password2', 'toggleConfirmPassword');
});

// Función para configurar los botones de mostrar/ocultar contraseña
function setupPasswordToggle(passwordInputId, toggleIconId) {
    const passwordInput = document.getElementById(passwordInputId);
    const toggleIcon = document.getElementById(toggleIconId);
    
    if (passwordInput && toggleIcon) {
        toggleIcon.addEventListener('click', function() {
            // Cambiar el tipo de input entre "password" y "text"
            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                toggleIcon.classList.remove('fa-eye');
                toggleIcon.classList.add('fa-eye-slash');
                toggleIcon.title = 'Ocultar contraseña';
            } else {
                passwordInput.type = 'password';
                toggleIcon.classList.remove('fa-eye-slash');
                toggleIcon.classList.add('fa-eye');
                toggleIcon.title = 'Mostrar contraseña';
            }
        });
    } else {
        console.warn(`Elementos no encontrados: input=${passwordInputId}, toggle=${toggleIconId}`);
    }
}