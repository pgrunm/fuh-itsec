FROM python:3.11-alpine

WORKDIR /usr/src/app

# Install required software
RUN pip install --no-cache-dir flask

COPY . .

CMD [ "python", "./hello.fernuni.py" ]