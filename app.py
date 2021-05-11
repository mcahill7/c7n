#!/usr/bin/env python
from flask import Flask, jsonify

app = Flask(__name__)

@app.route('/health')
def health():
    return jsonify({'Status': 'Up'})

if __name__ == '__main__':
    app.run(host='0.0.0.0', debug=True, threaded=True, port=8080)