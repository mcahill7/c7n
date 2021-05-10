FROM python:3.9-slim-buster

# Install cron
RUN apt-get update && apt-get install -y cron

RUN useradd c7n
USER c7n
WORKDIR /home/c7n

# Add files
ADD script.sh /home/c7n/script.sh
ADD entrypoint.sh /home/c7n/entrypoint.sh

ENTRYPOINT /home/c7n/entrypoint.sh