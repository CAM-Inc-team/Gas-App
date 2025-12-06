import mysql.connector
from typing import Dict, List, Optional, Tuple
import os
from dotenv import load_dotenv

class Storage:
    def __init__(self):
        """Initialize database connection using environment variables."""
        load_dotenv()
        self.db_config = {
            "host": os.getenv("DB_HOST", "4pfff8.h.filess.io"),
            "user": os.getenv("DB_USER", "cps298gasapp_quartergun"),
            "password": os.getenv("DB_PASS", "dcf573ef632a5ffed7ea0a47e5e94c5b1148f1bd"),
            "database": os.getenv("DB_NAME", "cps298gasapp_quartergun"),
            "port": int(os.getenv("DB_PORT", 3307))
        }
        self.conn = None
        self.cursor = None

    def connect(self):
        """Establish database connection."""
        try:
            self.conn = mysql.connector.connect(**self.db_config)
            self.cursor = self.conn.cursor(dictionary=True)
            return self.conn.is_connected()
        except Exception as e:
            print(f"Database connection error: {e}")
            return False

    def close(self):
        """Close database connection."""
        if self.cursor:
            self.cursor.close()
        if self.conn and self.conn.is_connected():
            self.conn.close()

    def get_all_station_coordinates(self) -> List[Dict]:
        """
        Fetch coordinates for all gas stations.
        Returns a list of dicts with 'station_id', 'lat', and 'lng' keys.
        """
        if not self.connect():
            return []

        try:
            
            
            
            try:
                print("Using Coordinates table.")
                query = """
                SELECT 
                    id as station_id,
                    latitude as lat,
                    longitude as lng
                FROM coordinates
                WHERE latitude IS NOT NULL AND longitude IS NOT NULL
                """
                self.cursor.execute(query)
                result = self.cursor.fetchall()
                if result:
                    return result
            except Exception as e:
                print(f"Warning: Could not fetch from coordinates table: {e}")
            
            # If we get here, we couldn't get coordinates from either table
            # Return an empty list to avoid returning stations with (0,0) coordinates
            print("Error: Could not retrieve coordinates for any stations")
            return []
            
        except Exception as e:
            print(f"Error in get_all_station_coordinates: {e}")
            return []
        finally:
            self.close()

    def get_stations_by_ids(self, station_ids, fuel_type='any', brand='any', price_min=None, price_max=None):
        """
        Fetch stations by their IDs with optional filters.
        Returns a list of station dictionaries with all available fields.
        """
        if not station_ids or not self.connect():
            return []

        try:
            # Map fuel types to database column names
            fuel_columns = {
                'regular': 's.priceRegular',
                'midgrade': 's.priceMidGrade',
                'premium': 's.pricePremium',
                'diesel': 's.priceDiesel'
            }
            
            # Build the query to join gas_stations with coordinates
            query = """
            SELECT 
                s.*,
                c.latitude as lat,
                c.longitude as lng
            FROM gas_stations s
            LEFT JOIN coordinates c ON s.station_id = c.id
            WHERE s.station_id IN ({})
            """.format(','.join(['%s'] * len(station_ids)))
            
            params = list(station_ids)
            
            # Add fuel type filter
            price_column = None
            if fuel_type != 'any':
                price_column = fuel_columns.get(fuel_type, 's.priceRegular')
                query += f" AND {price_column} IS NOT NULL"
            
            # Add brand filter
            if brand != 'any':
                query += " AND s.brand = %s"
                params.append(brand)
            
            # Add price range filters
            if price_min is not None and price_column:
                query += f" AND {price_column} >= %s"
                params.append(price_min)
                
            if price_max is not None and price_column:
                query += f" AND {price_column} <= %s"
                params.append(price_max)
            
            # Execute the query
            self.cursor.execute(query, params)
            results = self.cursor.fetchall()
            
            # Ensure all results have lat/lng, even if NULL
            for result in results:
                result.setdefault('lat', None)
                result.setdefault('lng', None)
                
            return results
                
        except Exception as e:
            print(f"Error fetching stations by IDs: {e}")
            import traceback
            traceback.print_exc()
            return []
        finally:
            self.close()
