FROM python:3.9 AS backend-Builder

WORKDIR /app

COPY requirements.txt /app/backend

RUN  pip install -r requirements.txt

COPY . /app

#Second stage

FROM python:3.9-slim

WORKDIR /app

COPY --from=backend-Builder /app/backend .
COPY --from=backend-Builder /usr/local/lib/python3.9/site-packages/ /usr/local/lib/python3.9/site-packages/

EXPOSE 8000

CMD python /app/manage.py runserver 0.0.0.0:8000
