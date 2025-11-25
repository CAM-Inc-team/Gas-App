from math import radians, sin, cos, sqrt, atan2

def calculate_distance_miles(lat1, lon1, lat2, lon2):
    """Calculate the distance in miles between two lat/lon points."""
    R = 3958.8  # Earth radius in miles
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])
    dlat = lat2 - lat1
    dlon = lon2 - lon1
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))
    return R * c

def filter_stations_by_radius(user_lat, user_lon, stations, radius_miles):
    """Filter and annotate stations within the user radius."""
    
    nearby = []
    for station in stations:
        distance = calculate_distance_miles(user_lat, user_lon, station['lat'], station['lon'])
        if distance <= radius_miles:
            station['distance_miles'] = round(distance, 2)
            nearby.append(station)
    return nearby
