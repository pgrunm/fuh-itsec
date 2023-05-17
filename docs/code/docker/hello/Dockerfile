FROM python:3.11-alpine

LABEL org.opencontainers.image.source=https://github.com/pgrunm/fuh-itsec
LABEL org.opencontainers.image.description="FUH hello container image"

WORKDIR /usr/src/app

# Install required software
RUN pip install --no-cache-dir flask

COPY . .

CMD [ "python", "./hello.fernuni.py" ]