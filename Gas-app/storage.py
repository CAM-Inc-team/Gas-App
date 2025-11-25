import mysql.connector
from typing import Dict, List, Optional
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
            "database": os.getenv("DB_NAME", "CPS298_Gas cps298gasapp_quartergun"),
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

    def get_stations_in_radius(self, lat: float, lng: float, radius_miles: float) -> List[Dict]:
        """Get stations within a given radius of the provided coordinates."""
        if not self.connect():
            return []

        try:
            # Using Haversine formula to calculate distance in miles
            query = """
            SELECT 
                id, name, brand, address1, city, state, zipcode,
                lat, lng,
                priceRegular, priceMidGrade, pricePremium, priceDiesel,
                (
                    3959 * acos(
                        cos(radians(%s)) * 
                        cos(radians(lat)) * 
                        cos(radians(lng) - radians(%s)) + 
                        sin(radians(%s)) * 
                        sin(radians(lat))
                    )
                ) AS distance_miles
            FROM gas_stations
            HAVING distance_miles <= %s
            ORDER BY distance_miles
            """
            self.cursor.execute(query, (lat, lng, lat, radius_miles))
            return self.cursor.fetchall()
        except Exception as e:
            print(f"Error fetching stations: {e}")
            return []
        finally:
            self.close()