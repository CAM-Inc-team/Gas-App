# app.py
from flask import Flask, render_template, request, jsonify, redirect, url_for
from calculations import GasStationCalculator
import os
from dotenv import load_dotenv

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
    # Get form data
    location = request.form.get('location', '').strip()
    distance = float(request.form.get('distance', 10))
    fuel_type = request.form.get('fuel_type', 'any')
    brand = request.form.get('brand', 'any')
    price_min = request.form.get('price_min')
    price_max = request.form.get('price_max')

    # Convert empty strings to None for price filters
    price_min = float(price_min) if price_min and price_min.replace('.', '').isdigit() else None
    price_max = float(price_max) if price_max and price_max.replace('.', '').isdigit() else None

    try:
        # In the real app, you would geocode the location here to get lat/lng
        # For now, we'll use a default location
        lat, lng = 42.2808, -83.7430  # Default to Ann Arbor

        # Find matching stations
        stations, search_meta = calculator.find_best_stations(
            location=location,
            radius_miles=distance,
            fuel_type=fuel_type,
            brand=brand,
            price_min=price_min,
            price_max=price_max,
            lat=lat,
            lng=lng
        )

        # Render results
        return render_template('index.html', 
                            stations=stations,
                            search_params={
                                'location': location,
                                'distance': distance,
                                'fuel_type': fuel_type,
                                'brand': brand,
                                'price_min': price_min,
                                'price_max': price_max
                            })
    
    except Exception as e:
        # Log the error (in a real app, use proper logging)
        print(f"Error processing search: {e}")
        return render_template('index.html', 
                            error="An error occurred while processing your search. Please try again.",
                            search_params=request.form)

if __name__ == '__main__':
    # For development
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 5000)))