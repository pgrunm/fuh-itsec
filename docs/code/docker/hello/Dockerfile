FROM cgr.dev/chainguard/python:3.10-dev as builder

LABEL org.opencontainers.image.source=https://github.com/pgrunm/fuh-itsec
LABEL org.opencontainers.image.description="FUH hello container image"

WORKDIR /app

# Install required software
RUN pip install --no-cache-dir flask --user

FROM cgr.dev/chainguard/python:3.10

WORKDIR /app

COPY --from=builder /home/nonroot/.local/lib/python3.10/site-packages /home/nonroot/.local/lib/python3.10/site-packages

COPY hello.fernuni.py .

# Listen on TCP port 8080
EXPOSE 8080
CMD [ "python", "./hello.fernuni.py" ]
