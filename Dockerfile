FROM python:3.8-slim-buster


RUN mkdir /api-peliculas

WORKDIR /api-peliculas


RUN apt-get update
RUN apt-get install -y curl 


COPY . /api-peliculas/


RUN pip install -r /api-peliculas/requirements.txt


ENV FLASK_APP "entrypoint:app"
ENV FLASK_ENV "development"
ENV APP_SETTINGS_MODULE "config.default"
ENV PORT 5000



RUN flask db upgrade

EXPOSE ${PORT}


CMD ["flask","run", "--host" , "0.0.0.0"]

