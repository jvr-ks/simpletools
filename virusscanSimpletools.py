# virusscanSimpletools.py
#Insert your API key

import requests
import json
import sys

appname = sys.argv[1]

params = {'apikey': '<API key>', 'url':'https://github.com/jvr-ks/' + appname + '/raw/main/' + appname + '.exe'}
response = requests.post('https://www.virustotal.com/vtapi/v2/url/scan', data=params)

print(response.json()["permalink"])
