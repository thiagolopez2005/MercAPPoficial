function descargarManual() {
    const urlPDF = "/static/pdfs/MERCAPPManualAdministrador.pdf";
    
    // Verificar si el archivo existe antes de intentar descargarlo
    fetch(urlPDF, { method: 'HEAD' })
        .then(response => {
            if (response.ok) {
                // El archivo existe, proceder con la descarga
                const enlace = document.createElement('a');
                enlace.href = urlPDF;
                enlace.target = '_blank';
                enlace.download = 'MERCAPPManualAdministrador.pdf';
                enlace.click();
            } else {
                // El archivo no existe
                alert('El manual no está disponible en este momento. Por favor, contacta al administrador.');
            }
        })
        .catch(error => {
            console.error('Error al verificar el archivo:', error);
            alert('Error al acceder al manual. Por favor, verifica tu conexión e intenta nuevamente.');
        });
}