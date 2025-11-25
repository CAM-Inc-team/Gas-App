import mysql.connector
import os
from datetime import datetime
from dotenv import load_dotenv

# Load environment variables
load_dotenv()

# --- Database Config ---
DB_CONFIG = {
    "host": os.getenv("DB_HOST", "127.0.0.1"),
    "user": os.getenv("DB_USER", "gsommers"),
    "password": os.getenv("DB_PASS", "GiltMuka14Dragon"),
    "database": os.getenv("DB_NAME", "cps298_gas_app"),
    "port": int(os.getenv("DB_PORT", 3306)),
}

def save_gas_data(stations, zip_code, fuel_type):
    """
    Takes a list of gas stations and saves them to the database.
    If a station already exists (same address), it updates its price.
    """

    if not stations:
        print(f"[DB] No stations to save for ZIP {zip_code}")
        return

    print(f"\n[DB] Saving data for ZIP {zip_code}, Fuel: {fuel_type}")

    try:
        conn = mysql.connector.connect(**DB_CONFIG)
        cursor = conn.cursor()

        for s in stations:
            name = s.get("name", "Unknown")
            address = s.get("address", "N/A")
            price = s.get("price") or s.get("prices", {}).get("regular", None)

            if price is None:
                print(f"  - Skipping {name}: No price data")
                continue

            print(f"  - {name} | {address} | ${price}")

            # Insert or update existing station by address
            cursor.execute("""
                INSERT INTO gas_stations (name, address1, zipcode, priceRegular, date_recorded)
                VALUES (%s, %s, %s, %s, %s)
                ON DUPLICATE KEY UPDATE
                    priceRegular = VALUES(priceRegular),
                    date_recorded = VALUES(date_recorded)
            """, (name, address, zip_code, price, datetime.now().date()))

        conn.commit()
        cursor.close()
        conn.close()
        print(f"[DB] ✅ Saved {len(stations)} records successfully.")

    except mysql.connector.Error as err:
        print(f"[DB ERROR] {err}")
