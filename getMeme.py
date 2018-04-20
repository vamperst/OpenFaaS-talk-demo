import requests 
import json
from random import randint

def handle(req):
    """handle a request to the function
    Args:
        req (str): request body
    """
    url = 'https://api.imgflip.com/get_memes'
    r = requests.get(url)
    memeDict = json.loads(r.text)

    memePos = randint(0,len(memeDict["data"]["memes"])-1)
    print(memeDict["data"]["memes"][memePos]['name'])
    html = "<p><img src="+memeDict["data"]["memes"][memePos]['url']+" /></p>"
    return html
