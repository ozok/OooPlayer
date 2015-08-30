__author__ = 'ozok'

import pylast
import time
import sys

API_KEY = "0a5674077da2782718075412eab00800"
API_SECRET = "56668ad9e4293be48def8f5ab1a6c658"
network = pylast.LastFMNetwork(api_key=API_KEY, api_secret=API_SECRET, username=sys.argv[1],
                                password_hash=str(sys.argv[2].strip()))
a = network.scrobble(artist=sys.argv[3], title=sys.argv[4], timestamp=int(time.time()))