# Build image, used to build everything we need
FROM python:3.11-slim as builder

WORKDIR /usr/src/app

# Look for any new updates, install them and install wget.
RUN apt update && apt install -y wget gcc

# Install Mariadb connector, as it's required.
# Source: https://stackoverflow.com/a/74452637
RUN wget https://dlm.mariadb.com/2862620/Connectors/c/connector-c-3.3.4/mariadb-connector-c-3.3.4-debian-bullseye-amd64.tar.gz -O - | tar -zxf - --strip-components=1 -C /usr

# Create a virtual Python environment
RUN python -m venv /usr/src/app/venv
ENV PATH="/usr/src/app/venv/bin:$PATH"

RUN pip install --upgrade pip; pip install --no-cache-dir flask mariadb
COPY . .

# https://pythonspeed.com/articles/multi-stage-docker-python/
FROM python:3.11-slim

WORKDIR /usr/src/app
COPY --from=builder /usr/src/app /usr/src/app
COPY --from=builder /usr /usr
USER app
ENV PATH="/usr/src/app/venv/bin:$PATH"
# Listen on TCP port 8080
EXPOSE 8080
CMD [ "python", "./messages.fernuni.py" ]