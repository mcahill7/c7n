#!/usr/bin/env python3
from flask import Flask, jsonify
import os

from apscheduler.schedulers.background import BackgroundScheduler

def c7n():
    os.system("echo c7n")
    os.system("export PATH=$:PATH:/usr/local/bin/ && custodian run --log-group=/cloud-custodian/dev/us-east-1 -s / /policy.yml --region us-east-1")

sched = BackgroundScheduler(daemon=True)
sched.add_job(c7n,'interval',minutes=1)
sched.start()

app = Flask(__name__)

@app.route('/')
def health():
    return jsonify({'Status': 'Up'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, threaded=True, port=80)