# app.py
from flask import Flask, render_template, request, jsonify, redirect, url_for, flash
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

@app.route('/about')
def about():
    """Render the about page."""
    return render_template('about.html')

@app.route('/donate1')
def donate1():
    """Render the first donation page."""
    return render_template('donate1.html')

@app.route('/donate2', methods=['GET'])
def donate2():
    """Render the donation form page."""
    return render_template('donate2.html')

@app.route('/process_donation', methods=['POST'])
def process_donation():
    """Process the donation form submission."""
    try:
        # Get form data
        card_name = request.form.get('card_name')
        card_number = request.form.get('card_number')
        email = request.form.get('email')
        cvv = request.form.get('cvv')
        month = request.form.get('month')
        year = request.form.get('year')
        
        # Here you would typically process the payment with a payment processor
        # For now, we'll just log the transaction and show a success message
        print(f"Donation received from {email} with card ending in {card_number[-4:]}")
        
        # Redirect to a thank you page or back to donate1 with a success message
        flash('Thank you for your donation!', 'success')
        return redirect(url_for('donate1'))
        
    except Exception as e:
        print(f"Error processing donation: {e}")
        flash('There was an error processing your donation. Please try again.', 'error')
        return redirect(url_for('donate2'))

if __name__ == '__main__':
    # For development
    app.secret_key = os.environ.get('SECRET_KEY', 'dev-secret-key')  # Required for flash messages
    app.run(debug=True, host='0.0.0.0', port=int(os.environ.get('PORT', 5001)))