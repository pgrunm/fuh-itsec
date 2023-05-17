FROM python:3.11

LABEL org.opencontainers.image.source=https://github.com/pgrunm/fuh-itsec
LABEL org.opencontainers.image.description="FUH messages container image"

WORKDIR /usr/src/app

RUN pip install --no-cache-dir flask mariadb

COPY . .

CMD [ "python", "./messages.fernuni.py" ]