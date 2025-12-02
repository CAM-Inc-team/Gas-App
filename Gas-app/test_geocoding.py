from calculations import GasStationCalculator

def test_geocoding():
    print("Testing geocoding with zip code 48843...")
    
    # Create calculator instance
    calculator = GasStationCalculator()
    
    # Test geocoding
    result = calculator.geocode_address("48843")
    
    if result:
        lat, lng = result
        print(f"✅ Success! Coordinates for 48843: {lat}, {lng}")
        
        # Test distance calculation
        print("\nTesting distance calculation...")
        distance = calculator.haversine_distance(
            lat, lng,  # Okemos, MI
            42.7225, -84.4275  # Known coordinates for Okemos
        )
        print(f"Calculated distance: {distance:.2f} miles (should be close to 0)")
        
        # Test finding nearby stations
        print("\nFinding nearby stations...")
        stations = calculator.get_stations_in_radius(lat, lng, 10)  # 10 mile radius
        print(f"Found {len(stations)} stations within 10 miles")
        
        if stations:
            print("\nSample station:", stations[0])
    else:
        print("❌ Geocoding failed")

if __name__ == "__main__":
    test_geocoding()
