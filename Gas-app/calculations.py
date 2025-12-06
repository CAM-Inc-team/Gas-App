from typing import List, Dict, Optional, Tuple
from math import radians, sin, cos, asin, sqrt
from urllib.parse import quote_plus
from storage import Storage
import os
from dotenv import load_dotenv
import requests

load_dotenv()

class GasStationCalculator:
    def __init__(self):
        self.storage = Storage()
        # Ensure environment variables are loaded
        load_dotenv(override=True)
        self.geocoding_api_key = os.getenv("GEOCODE_MAPS_API_KEY")
        if not self.geocoding_api_key:
            print("Error: GEOCODE_MAPS_API_KEY not found in environment variables")
            print("Please check your .env file and make sure it's in the correct location.")
            print("You can get a free API key at https://geocode.maps.co/")
        else:
            print("Geocoding API key loaded successfully")
        self.cached_station_coords = None

    def geocode_address(self, address: str) -> Optional[Tuple[float, float]]:
        """
        Convert address/zip to lat/lng using geocode.maps.co API.
        Handles various address formats including partial addresses.
        """
        if not address or not address.strip():
            print("Error: Empty address provided")
            return None

        try:
            # Clean and format the address
            address = address.strip()
            print(f"Geocoding address: '{address}'")
            
            # Check if we have a valid API key
            if not self.geocoding_api_key or self.geocoding_api_key == "your_api_key_here":
                print("Error: Invalid or missing geocoding API key")
                return None

            url = "https://geocode.maps.co/search"
            params = {
                "q": address,
                "api_key": self.geocoding_api_key,
                "countrycodes": "us",  # Limit to US for better results
                "limit": 5  # Get more results to improve matching
            }
            
            headers = {
                "User-Agent": "GasApp/1.0",
                "Accept": "application/json"
            }
            
            print(f"Making request to geocoding API with params: {params}")
            response = requests.get(url, params=params, headers=headers, timeout=15)
            response.raise_for_status()
            
            data = response.json()
            print(f"Geocoding API response: {data}")
            
            if data and len(data) > 0:
                # Try to find the best match
                for result in data:
                    lat = result.get("lat")
                    lon = result.get("lon")
                    if lat is not None and lon is not None:
                        print(f"Found coordinates: ({lat}, {lon})")
                        return float(lat), float(lon)
                
                print("Error: No valid coordinates found in response")
                print(f"Response data: {data[0]}")
            else:
                print(f"No results found for address: {address}")
                return None
                
        except requests.exceptions.RequestException as e:
            print(f"Geocoding error (network): {e}")
            if hasattr(e, 'response') and e.response is not None:
                print(f"Status code: {e.response.status_code}")
                print(f"Response: {e.response.text[:200]}")
        except (ValueError, KeyError, IndexError) as e:
            print(f"Geocoding error (parsing): {e}")
            if 'data' in locals():
                print(f"Response data: {data}")
        except Exception as e:
            print(f"Unexpected geocoding error: {e}")
        
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
        
    def get_stations_in_radius(self, user_lat: float, user_lng: float, radius_miles: float) -> List[Dict]:
        """Get all stations within the specified radius of the user's location."""
        if self.cached_station_coords is None:
            self.cached_station_coords = self.storage.get_all_station_coordinates()
            
        stations_in_radius = []
        
        for station in self.cached_station_coords:
            try:
                distance = self.haversine_distance(
                    user_lat, user_lng,
                    float(station['lat']), float(station['lng'])
                )
                if distance <= radius_miles:
                    stations_in_radius.append({
                        'id': station['station_id'],  
                        'distance': distance
                    })
            except (ValueError, TypeError):
                continue
                
        return stations_in_radius
        
    def find_best_stations(self, location: str, radius_miles: float = 10, 
                          fuel_type: str = 'any', brand: str = 'any',
                          price_min: float = None, price_max: float = None,
                          lat: float = None, lng: float = None) -> tuple[list[dict], dict]:
        """
        Find the best gas stations based on user criteria.
        
        Args:
            location: User's location as address, city, or zip code
            radius_miles: Search radius in miles
            fuel_type: Type of fuel (regular, midgrade, premium, diesel, or 'any')
            brand: Specific brand to filter by, or 'any'
            price_min: Minimum price filter
            price_max: Maximum price filter
            lat: Optional latitude (if already geocoded)
            lng: Optional longitude (if already geocoded)
            
        Returns:
            Tuple of (list of matching stations, search metadata)
        """
        # Get user's coordinates if not provided
        if lat is None or lng is None:
            coords = self.geocode_address(location)
            if not coords:
                return [], {'error': 'Could not geocode the provided location'}
            lat, lng = coords
        
        # Find stations within radius
        stations_in_radius = self.get_stations_in_radius(lat, lng, radius_miles)
        
        if not stations_in_radius:
            return [], {'message': 'No stations found in the specified radius'}
            
        # Get station IDs within radius
        station_ids = [s['id'] for s in stations_in_radius]
        
        # Get detailed station info with additional filters
        stations = self.storage.get_stations_by_ids(
            station_ids=station_ids,
            fuel_type=fuel_type,
            brand=brand,
            price_min=price_min,
            price_max=price_max
        )
        
        # Add distance information to each station
        station_distances = {s['id']: s['distance'] for s in stations_in_radius}
        results = []
        
        for station in stations:
            station_id = station['station_id']  # Changed from 'id' to 'station_id'
            distance = round(station_distances.get(station_id, float('inf')), 2)
            
            # Get price for the selected fuel type
            price = self._get_fuel_price(station, fuel_type)
            if price is None:
                continue
                
            # Build result dict with all necessary information
            result = {
                'id': station_id,  # Keep 'id' here as it's used in the template
                'station_id': station_id,  # Add station_id for reference
                'name': station.get('name', ''),
                'brand': station.get('brand', ''),
                'address1': station.get('address1', ''),
                'city': station.get('city', ''),
                'state': station.get('state', ''),
                'zipcode': station.get('zipcode', ''),
                'lat': station.get('lat'),
                'lng': station.get('lng'),
                'price': price,
                'fuel_type': fuel_type if fuel_type != 'any' else 'regular',
                'distance_miles': distance,
                'maps_url': self.build_maps_url(
                    station.get('address1', ''),
                    station.get('city', ''),
                    station.get('state', ''),
                    station.get('zipcode', '')
                ),
                'price_regular': station.get('priceRegular'),
                'price_midgrade': station.get('priceMidGrade'),
                'price_premium': station.get('pricePremium'),
                'price_diesel': station.get('priceDiesel'),
                'date_recorded': station.get('date_recorded')
            }
            results.append(result)
        
        # Sort by distance (closest first)
        results.sort(key=lambda x: x['distance_miles'])
        
        # Prepare search metadata
        search_meta = {
            'location': location,
            'lat': lat,
            'lng': lng,
            'radius_miles': radius_miles,
            'fuel_type': fuel_type,
            'brand': brand,
            'price_min': price_min,
            'price_max': price_max,
            'total_results': len(results)
        }
        
        return results, search_meta

    def build_maps_url(self, address1: str, city: str, state: str, zipcode: str) -> str:
        """Build Google Maps URL for a station."""
        query = f"{address1} {city} {state} {zipcode}"
        return f"https://www.google.com/maps/search/?api=1&query={quote_plus(query)}"

    def _get_fuel_price(self, station: Dict, fuel_type: str) -> Optional[float]:
        """Get the price for the specified fuel type from a station record."""
        fuel_columns = {
            'regular': 'priceRegular',
            'midgrade': 'priceMidGrade',
            'premium': 'pricePremium',
            'diesel': 'priceDiesel'
        }

        if fuel_type.lower() == 'any':
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