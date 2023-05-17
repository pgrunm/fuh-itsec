FROM python:3.11-slim

LABEL org.opencontainers.image.source=https://github.com/pgrunm/fuh-itsec
LABEL org.opencontainers.image.description="FUH messages container image"

WORKDIR /usr/src/app

# Look for any new updates, install them and install wget.
RUN apt update && apt install -y wget gcc

# Install Mariadb connector, as it's required.
# Source: https://stackoverflow.com/a/74452637
RUN wget https://dlm.mariadb.com/2862620/Connectors/c/connector-c-3.3.4/mariadb-connector-c-3.3.4-debian-bullseye-amd64.tar.gz -O - | tar -zxf - --strip-components=1 -C /usr

RUN pip install --upgrade pip; pip install --no-cache-dir flask mariadb; apt remove wget gcc -y

COPY . .

# Listen on TCP port 8080
EXPOSE 8080
CMD [ "python", "./messages.fernuni.py" ]