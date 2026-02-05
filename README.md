Dockerfile
El Dockerfile define cómo se construye la imagen del backend Django:

- Parte de una imagen base python:3.11-slim
- Instala dependencias del sistema necesarias
- Instala dependencias Python desde requirements.txt
- Copia el código del proyecto
- Ejecuta collectstatic
- Arranca la aplicación con Gunicorn

Docker compose
- Sirve para ejecutar varios contenedores al mismo tiempo

Contenedor Web
- Se construye a partir del Dockerfile
- Ejecuta Django con Gunicorn
- Expone el puerto 8000 solo dentro de la red Docker
- Escribe los archivos estáticos en un volumen compartido

Contenedor Nginx
- Usa la imagen oficial nginx:alpine
- Actúa como proxy inverso
- Publica el puerto 8081 en el host
- Lee los archivos estáticos desde el volumen compartido
- Carga la configuración personalizada desde default.conf

Default.conf
- Contiene el proxy inverso y el servidor web
