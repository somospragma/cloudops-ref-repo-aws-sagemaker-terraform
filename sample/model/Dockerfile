# Utilizamos una imagen base de Python liviana
FROM python:3.8-slim

# Establecer el directorio de trabajo
WORKDIR /app

# Copiar el script de inferencia a la imagen
COPY inference.py /app/inference.py

# Instalar las dependencias necesarias
RUN pip install flask gunicorn scikit-learn numpy

# Exponer el puerto en el que se ejecutará la aplicación
EXPOSE 8080

# Configurar el comando de inicio. SageMaker suele usar Gunicorn para mayor robustez.
CMD ["gunicorn", "--bind", "0.0.0.0:8080", "inference:app"]
