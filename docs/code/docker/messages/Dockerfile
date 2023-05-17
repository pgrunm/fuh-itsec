FROM python:3.11-alpine

WORKDIR /usr/src/app

RUN pip install --no-cache-dir flask mariadb

COPY . .

CMD [ "python", "./messages.fernuni.py" ]