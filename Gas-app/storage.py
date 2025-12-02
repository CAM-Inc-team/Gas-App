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
            query = """
            SELECT 
                c.id as station_id, 
                c.latitude as lat, 
                c.longitude as lng
            FROM coordinates c
            WHERE c.latitude IS NOT NULL 
              AND c.longitude IS NOT NULL
            """
            self.cursor.execute(query)
            return self.cursor.fetchall()
        except Exception as e:
            print(f"Error fetching station coordinates: {e}")
            return []
        finally:
            self.close()

    def get_stations_by_ids(self, station_ids: List[int], fuel_type: str = 'any', 
                          brand: str = 'any', price_min: float = None, 
                          price_max: float = None) -> List[Dict]:
        """
        Fetch stations by their IDs with optional filters.
        Returns a list of station dictionaries with all available fields.
        """
        if not station_ids or not self.connect():
            return []

        try:
            # Build the query with placeholders for station IDs
            placeholders = ', '.join(['%s'] * len(station_ids))
            
            # Base query to get station data with coordinates
            query = f"""
            SELECT 
                gs.station_id,
                gs.name,
                gs.brand,
                gs.address1,
                gs.city,
                gs.state,
                gs.zipcode,
                c.latitude as lat,
                c.longitude as lng,
                gs.priceRegular,
                gs.priceMidGrade,
                gs.pricePremium,
                gs.priceDiesel,
                gs.date_recorded
            FROM gas_stations gs
            JOIN coordinates c ON gs.station_id = c.id
            WHERE gs.station_id IN ({placeholders})
            """
            
            # Add filters
            params = list(station_ids)
            
            # Apply brand filter
            if brand.lower() != 'any':
                query += " AND LOWER(gs.brand) = LOWER(%s)"
                params.append(brand)
            
            # Apply fuel type and price filters
            if fuel_type.lower() != 'any':
                price_column = f"gs.price{fuel_type.capitalize()}"
                query += f" AND {price_column} IS NOT NULL"
                
                if price_min is not None:
                    query += f" AND {price_column} >= %s"
                    params.append(price_min)
                    
                if price_max is not None:
                    query += f" AND {price_column} <= %s"
                    params.append(price_max)
            
            self.cursor.execute(query, params)
            return self.cursor.fetchall()
            
        except Exception as e:
            print(f"Error fetching stations by IDs: {e}")
            import traceback
            traceback.print_exc()
            return []
        finally:
            self.close()
