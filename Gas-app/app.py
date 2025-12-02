# app.py
from flask import Flask, render_template, request, jsonify, redirect, url_for
from calculations import GasStationCalculator
from dotenv import load_dotenv
import os

app = Flask(__name__)
calculator = GasStationCalculator()

# Load environment variables
load_dotenv()

@app.route('/', methods=['GET'])
def index():
    """Render the main search page."""
    return render_template('index.html')

@app.route('/search', methods=['POST'])
def search():
    """Handle search form submission."""
    # Get form data with defaults
    location = request.form.get('location', '').strip()
    distance = request.form.get('distance', '10')
    fuel_type = request.form.get('fuel_type', 'any')
    brand = request.form.get('brand', 'any')
    price_min = request.form.get('price_min')
    price_max = request.form.get('price_max')

    # Convert and validate inputs
    try:
        distance = float(distance) if distance else 10.0
    except ValueError:
        distance = 10.0

    price_min = float(price_min) if price_min and price_min.replace('.', '', 1).isdigit() else None
    price_max = float(price_max) if price_max and price_max.replace('.', '', 1).isdigit() else None

    # Prepare search parameters
    search_params = {
        'location': location,
        'distance': distance,
        'fuel_type': fuel_type,
        'brand': brand,
        'price_min': price_min,
        'price_max': price_max
    }

    try:
        # Find matching stations
        stations, search_meta = calculator.find_best_stations(
            location=location,
            radius_miles=distance,
            fuel_type=fuel_type,
            brand=brand,
            price_min=price_min,
            price_max=price_max
        )

        # If there was an error (like geocoding failed)
        if 'error' in search_meta:
            return render_template('index.html', 
                               error=search_meta['error'],
                               search_params=search_params)

        # Render results
        return render_template('index.html',
                           stations=stations,
                           search_meta=search_meta,
                           search_params=search_params)

    except Exception as e:
        print(f"Error in search: {e}")
        return render_template('index.html',
                           error="An error occurred while processing your search. Please try again.",
                           search_params=search_params)

if __name__ == '__main__':
    # For development
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 5001)))