from flask import Flask, request, jsonify
import os, requests

app = Flask(__name__)

# Environment variables 
ZYLA_URL = os.getenv("ZYLA_URL", "https://zylalabs.com/api/4805/gas+prices+in+usa+by+zip+code/5987/get+pices")
ZYLA_KEY = os.getenv("ZYLA_KEY")

@app.get("/stations")
def get_gas_stations():
    zip_code = (request.args.get("zip") or "").strip()
    fuel_type = (request.args.get("type") or "regular").strip().lower()
 

    try:
        # Make the API request
        response = requests.get(
            ZYLA_URL,
            headers={"Authorization": f"Bearer {ZYLA_KEY}"},
            params={"zip": zip_code, "type": fuel_type},
            timeout=15
        )

        if response.status_code == 401:
            return jsonify({"error": "Unauthorized. Check ZYLA_KEY or subscription plan."}), 401
        if response.status_code >= 400:
            return jsonify({"error": f"Upstream API error {response.status_code}", "details": response.text}), 502

        data = response.json()

        # Extract only station info
        stations = []
        for entry in data.get("gas_prices", []):
            if "station" in entry:  # skip average/lowest rows
                stations.append({
                    "name": entry.get("station"),
                    "address": entry.get("address"),
                    "price": entry.get("price")
                })

        return jsonify({
            "zip": zip_code,
            "fuel_type": fuel_type,
            "stations": stations
        })

    except requests.RequestException:
        return jsonify({"error": "Failed to reach Zyla API"}), 502


@app.get("/health")
def health():
    return jsonify({"status": "ok"})


if __name__ == "__main__":
    app.run(debug=True)
