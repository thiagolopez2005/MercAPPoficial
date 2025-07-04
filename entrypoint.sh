#!/bin/bash

echo "Esperando a que MySQL esté disponible en db:3306..."

# Usa wait-for-it para esperar a MySQL
/wait-for-it.sh db:3306 --timeout=60 --strict -- echo "MySQL está listo."

# Ejecuta el comando original (ej. runserver)
exec "$@"

