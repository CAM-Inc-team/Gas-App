import requests

def test_geocode(zip_code):
    url = "https://nominatim.openstreetmap.org/search"
    params = {
        "q": zip_code,
        "format": "json",
        "limit": 1,
        "countrycodes": "us"  # Add country code to improve results
    }
    headers = {
        "User-Agent": "GasApp/1.0 (test@example.com)",
        "Accept-Language": "en-US,en;q=0.9"
    }
    
    print(f"Testing geocoding for zip code: {zip_code}")
    print(f"Request URL: {url}")
    print(f"Params: {params}")
    print(f"Headers: {headers}")
    
    try:
        response = requests.get(url, params=params, headers=headers, timeout=10)
        print(f"\nResponse Status: {response.status_code} {response.reason}")
        print(f"Response Headers: {dict(response.headers)}")
        
        if response.status_code == 200:
            try:
                data = response.json()
                print(f"\nResponse JSON: {data}")
                
                if data and len(data) > 0:
                    lat = float(data[0]["lat"])
                    lon = float(data[0]["lon"])
                    print(f"\n✅ Success! Coordinates: {lat}, {lon}")
                    return lat, lon
                else:
                    print("\n❌ No results found for the given zip code")
            except ValueError as e:
                print(f"\n❌ Error parsing JSON response: {e}")
                print(f"Response content: {response.text[:500]}")
        else:
            print(f"\n❌ Error response: {response.status_code}")
            print(f"Response content: {response.text[:500]}")
            
    except requests.exceptions.RequestException as e:
        print(f"\n❌ Request failed: {e}")
    except Exception as e:
        print(f"\n❌ Unexpected error: {e}")
    
    return None

if __name__ == "__main__":
    print("="*50)
    print("Testing Geocoding with Zip Code 48843 (Okemos, MI)")
    print("="*50)
    result = test_geocode("48843")
    print("\n" + "="*50)
    print(f"Final result: {result}")
    print("="*50)
