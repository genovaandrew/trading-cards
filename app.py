"""trading cards app."""

import json

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    """hello world."""
    return "<p>Hello, World!</p>"

@app.route("/cards")
def cards():
    """This is just a second page."""
    return json.dumps("PASS")

if __name__ == "__main__":
    #app.run(host="0.0.0.0", port="8080")
    app.run(host="0.0.0.0")
