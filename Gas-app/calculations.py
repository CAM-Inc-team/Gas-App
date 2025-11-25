from typing import List, Dict, Optional, Tuple
from math import radians, sin, cos, asin, sqrt
from urllib.parse import quote_plus
from storage import Storage
import requests
import os
from dotenv import load_dotenv

load_dotenv()

class GasStationCalculator:
    def __init__(self):
        self.storage = Storage()
        self.geocoding_api_key = os.getenv("GOOGLE_MAPS_API_KEY")
        if not self.geocoding_api_key:
            print("Warning: GOOGLE_MAPS_API_KEY not found in environment variables")

    def geocode_address(self, address: str) -> Optional[Tuple[float, float]]:
        """Convert address/zip to lat/lng using Google Geocoding API."""
        try:
            url = "https://maps.googleapis.com/maps/api/geocode/json"
            params = {
                "address": address,
                "key": self.geocoding_api_key
            }
            response = requests.get(url, params=params)
            data = response.json()
            
            if data["status"] == "OK":
                location = data["results"][0]["geometry"]["location"]
                return location["lat"], location["lng"]
            print(f"Geocoding error: {data.get('error_message', 'Unknown error')}")
            return None
        except Exception as e:
            print(f"Geocoding error: {e}")
            return None

    def haversine_distance(self, lat1: float, lon1: float, lat2: float, lon2: float) -> float:
        """Calculate the great circle distance between two points on the earth."""
        # Convert decimal degrees to radians
        lon1, lat1, lon2, lat2 = map(radians, [lon1, lat1, lon2, lat2])

        # Haversine formula
        dlon = lon2 - lon1 
        dlat = lat2 - lat1 
        a = sin(dlat/2)**2 + cos(lat1) * cos(lat2) * sin(dlon/2)**2
        c = 2 * asin(sqrt(a)) 
        r = 3956  # Radius of earth in miles
        return c * r

    def build_maps_url(self, address1: str, city: str, state: str, zipcode: str) -> str:
        """Build Google Maps URL for a station."""
        query = f"{address1} {city} {state} {zipcode}"
        return f"https://www.google.com/maps/search/?api=1&query={quote_plus(query)}"

    def find_best_stations(
        self,
        location: str,
        radius_miles: float,
        fuel_type: str = "any",
        brand: str = "any",
        price_min: Optional[float] = None,
        price_max: Optional[float] = None,
        lat: Optional[float] = None,
        lng: Optional[float] = None
    ) -> Tuple[List[Dict], Dict]:
        """
        Find the best gas stations based on the given criteria.
        
        Returns:
            Tuple of (list of station dicts, search metadata)
        """
        # Geocode the location if lat/lng not provided
        if lat is None or lng is None:
            geocoded = self.geocode_address(location)
            if not geocoded:
                return [], {"error": "Could not find the specified location"}
            lat, lng = geocoded

        # Get stations from database within radius
        stations = self.storage.get_stations_in_radius(lat, lng, radius_miles)
        
        # Filter and process stations
        results = []
        for station in stations:
            # Get price for the selected fuel type
            price = self._get_fuel_price(station, fuel_type)
            if price is None:
                continue

            # Apply filters
            if brand != "any" and station.get('brand', '').lower() != brand.lower():
                continue
            if price_min is not None and price < price_min:
                continue
            if price_max is not None and price > price_max:
                continue

            # Calculate distance if not already calculated by SQL
            distance = station.get('distance_miles') or self.haversine_distance(
                lat, lng, station['lat'], station['lng']
            )

            # Build result dict
            result = {
                'id': station['id'],
                'name': station['name'],
                'brand': station['brand'],
                'address1': station['address1'],
                'city': station['city'],
                'state': station['state'],
                'zipcode': station['zipcode'],
                'price': price,
                'fuel_type': fuel_type if fuel_type != 'any' else 'regular',
                'distance_miles': round(distance, 2),
                'maps_url': self.build_maps_url(
                    station['address1'],
                    station['city'],
                    station['state'],
                    station['zipcode']
                )
            }
            results.append(result)

        # Sort by price, then distance
        results.sort(key=lambda x: (x['price'], x['distance_miles']))

        # Prepare search metadata
        search_meta = {
            'center': {'lat': lat, 'lng': lng},
            'location': location,
            'radius_miles': radius_miles,
            'fuel_type': fuel_type,
            'brand': brand,
            'price_min': price_min,
            'price_max': price_max,
            'result_count': len(results)
        }

        return results, search_meta

    def _get_fuel_price(self, station: Dict, fuel_type: str) -> Optional[float]:
        """Get the price for the specified fuel type from a station record."""
        fuel_columns = {
            'regular': 'priceRegular',
            'midgrade': 'priceMidGrade',
            'premium': 'pricePremium',
            'diesel': 'priceDiesel'
        }

        if fuel_type == 'any':
            # Find the lowest available price
            min_price = None
            for col in fuel_columns.values():
                price = station.get(col)
                if price is not None and (min_price is None or price < min_price):
                    min_price = price
            return min_price
        else:
            # Get price for specific fuel type
            col = fuel_columns.get(fuel_type.lower())
            return station.get(col) if col else None