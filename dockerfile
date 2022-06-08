FROM python:3.9-slim-buster
WORKDIR /app-django
EXPOSE 8000
COPY . .
RUN pip install --upgrade pip && pip install -r requirements.txt
CMD python manage.py runserver 0.0.0.0:8000