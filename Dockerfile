FROM python:3.9-slim-buster

# Install cron
RUN apt-get update && apt-get install -y cron

RUN pip install c7n

# Add files
ADD script.sh script.sh
ADD entrypoint.sh /entrypoint.sh
Add policy.yml /policy.yml

ENTRYPOINT /entrypoint.sh