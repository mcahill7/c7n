FROM python:3.9-slim-buster

# Install cron
RUN apt-get update && apt-get install -y cron supervisor

RUN pip install c7n

ADD requirements.txt /requirements.txt
RUN ["pip", "install", "-r", "requirements.txt"]

# Add files
ADD policy.yml /policy.yml
ADD app.py /app.py

EXPOSE 80

ENTRYPOINT ["./app.py"]
