FROM python:3.8

RUN mkdir /app

WORKDIR /app

COPY ./app /app

RUN pip install -r requirements.txt

CMD ["uwsgi", "/app/demo.ini"]
