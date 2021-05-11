FROM python:3.9-slim-buster

# Install cron
RUN apt-get update && apt-get install -y cron supervisor

RUN pip install c7n

ADD requirements.txt /requirements.txt
RUN ["pip", "install", "-r", "requirements.txt"]
# Add files
ADD flask /flask
ADD cron /cron
ADD start.sh /start.sh
ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf 
ADD script.sh script.sh
ADD entrypoint.sh /entrypoint.sh
ADD policy.yml /policy.yml
ADD app.py /app.py

EXPOSE 8080

#CMD ./entrypoint.sh
#ENTRYPOINT /entrypoint.sh
#ENTRYPOINT ["./app.py"]
#ENTRYPOINT ["/bin/sh", "-c" , "./app.py && ./entrypoint.sh"]
#ENTRYPOINT ["/usr/bin/supervisord"]
CMD ./start.sh