from flask import Flask, jsonify
import os

app = Flask(__name__)

@app.route('/')
def hello():
    return jsonify({"message": "hello from sample microservice", "version": os.getenv('APP_VERSION', 'v1')})

@app.route('/health')
def health():
    return jsonify({"status":"ok"}), 200

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
#sample application
