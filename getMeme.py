import requests 
import json
from random import randint

def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """
    url = 'https://pixabay.com/api/?key=9590297-1064015f7a62f8e34834124a3&q=brasil&image_type=photo&pretty=true'
    r = requests.get(url)
    memeDict = json.loads(r.text)
    memePos = randint(0,len(memeDict["hits"])-1)
    html = "<p><img src=\""+memeDict["hits"][memePos]['largeImageURL']+"\" /></p>"
    return html


