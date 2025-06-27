# Usa una imagen base adecuada
FROM python:3.11-slim

# Instala dependencias del sistema
RUN apt-get update && apt-get install -y \
    gcc \
    default-libmysqlclient-dev \
    pkg-config \
    build-essential \
    && apt-get clean

# Crea el directorio de trabajo
WORKDIR /app

# Copia tu código y requirements
COPY . /app

# Instala dependencias de Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Comando por defecto
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
