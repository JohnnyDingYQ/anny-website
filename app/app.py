from flask import Flask, render_template

app = Flask(__name__)

@app.route("/", methods=["GET"])
def index():
    return render_template("index.jinja")

@app.route("/tcm/interactive-map", methods=["GET"])
def interactive_map():
    return render_template("interactive-map.jinja")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000, debug=True)
