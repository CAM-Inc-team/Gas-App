from flask import Flask, request, render_template_string
import mysql.connector
from mysql.connector import Error

HOST = "127.0.0.1"
PORT = 3306
USER = "gsommers"
PASSWORD = "GiltMuka14Dragon"
DATABASE = "gsommers"

app = Flask(__name__)  # <-- Flask looks for this variable

def get_gas_stations_by_zip(zipcode):
    try:
        conn = mysql.connector.connect(
            host=HOST, port=PORT, user=USER, password=PASSWORD, database=DATABASE
        )
        cursor = conn.cursor(dictionary=True)
        sql = "SELECT * FROM gas_stations WHERE zipcode = %s"
        cursor.execute(sql, (zipcode,))
        return cursor.fetchall()
    except Error as e:
        print("DB error:", e)
        return []
    finally:
        if cursor:
            cursor.close()
        if conn and conn.is_connected():
            conn.close()

HTML_FORM = """
<form method="GET">
  Enter ZIP code: <input type="text" name="zip">
  <input type="submit" value="Search">
</form>
{% if stations %}
  <h2>Results:</h2>
  <ul>
    {% for s in stations %}
      <li>{{ s }}</li>
    {% endfor %}
  </ul>
{% endif %}
"""

@app.route("/", methods=["GET"])
def home():
    zipcode = request.args.get("zip")
    stations = get_gas_stations_by_zip(zipcode) if zipcode else []
    return render_template_string(HTML_FORM, stations=stations)

if __name__ == "__main__":
    app.run(debug=True, port=8000)
