FROM python:3.9-slim-buster

# Install cron
RUN apt-get update && apt-get install -y cron

# Add files
ADD script.sh /script.sh
ADD entrypoint.sh /entrypoint.sh
 
RUN chmod +x /script.sh /entrypoint.sh

ENTRYPOINT /entrypoint.sh