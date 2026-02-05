FROM python:3.11-slim

# Variables de entorno
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Directorio de trabajo
WORKDIR /usr/src/app

# Dependencias del sistema
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    && rm -rf /var/lib/apt/lists/*

# Copiamos dependencias
COPY requirements.txt .

RUN pip install --upgrade pip \
    && pip install -r requirements.txt

# Copiamos el proyecto
COPY . .

# Recolectamos estáticos
RUN python manage.py collectstatic --noinput

# Puerto interno
EXPOSE 8000

# Gunicorn (WSGI)
CMD ["gunicorn", "nacho.wsgi:application", "--bind", "0.0.0.0:8000"]
