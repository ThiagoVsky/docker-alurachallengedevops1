# Using original python 3.9 slim image
FROM python:3.9-slim-buster
# Set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1
ENV DJANGO_SUPERUSER_EMAIL=root@admin.com
ENV DJANGO_SUPERUSER_USERNAME=admin
ENV DJANGO_SUPERUSER_PASSWORD=admin
# Set work directory
WORKDIR /app-django
# Copy application
COPY . .
# Install requirements
RUN pip install --upgrade pip && pip install -r requirements.txt
# Migrate database
RUN python manage.py makemigrations && python manage.py migrate
# Generate superuser
RUN python manage.py createsuperuser --noinput
#expose port used by django
EXPOSE 8000
# Run application
CMD python manage.py runserver 0.0.0.0:8000