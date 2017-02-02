import requests
import sqlite3

def sec2min(s):
    total_minutes = s / 60
    seconds = s % 60
    minutes = total_minutes % 60
    hours = total_minutes / 60
    if hours > 0:
        time = "%dh%02dmin%02ds" % (hours, minutes, seconds)
    elif minutes > 0:
        time = "%dmin%02ds" % (minutes, seconds)
    else:
        time = "%ds" % (seconds)
    return time

db = sqlite3.connect('../db/development.sqlite3')

cursor = db.cursor()

cursor.execute("""
SELECT id, from_long, from_lat, to_long, to_lat FROM routes ORDER BY id;
""")

for route in cursor.fetchall():

    url = "https://www.waze.com/row-RoutingManager/routingRequest?from=x:%s+y:%s&to=x:%s+y:%s&at=120&returnJSON=true&timeout=60000&nPaths=1&clientVersion=4.0.0&options=AVOID_TRAILS:t,ALLOW_UTURNS:t" % (route[1], route[2], route[3], route[4])
    page = requests.get(url)

    js = page.json()
    #print page.status_code, len(page.text)
    #if len(page.text) < 1000:
    #    print page.text

    if not 'error' in js:

        route_length = 0
        route_time=0
        for s in iter(js['response']['results']):
            route_length += s['length']
            route_time += s['crossTime']

        cursor.execute("""
        INSERT INTO checks (route_id, date, length, name, created_at, updated_at) VALUES (?,datetime('now'),?,?,datetime('now'),datetime('now'))
        """, (route[0],route_length,js['response']['routeName']))
        db.commit()

        print '[', js['response']['routeName'], '] => ', route_length, sec2min(route_time)

db.close()
