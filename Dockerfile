# Usa una imagen base con Python 3.11
FROM python:3.11-slim

# Establece el directorio de trabajo
WORKDIR /app

# Instala las dependencias del sistema necesarias
RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx && \
    apt-get clean

# Copia los archivos del proyecto al contenedor
COPY requirements.txt .

# Instala las dependencias de Python
RUN pip install --no-cache-dir -r requirements.txt

# Copia el resto del código al contenedor
COPY . .

# Expone el puerto que usará la aplicación
EXPOSE 8080

# Define el comando para iniciar la aplicación
CMD ["gunicorn", "ia:app", "-b", "0.0.0.0:8080"]