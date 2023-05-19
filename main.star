load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("cache.star", "cache")

CHARS = {
  0: "Captain Falcon",
  1: "DK",
  2: "Fox",
  3: "Game and Watch",
  4: "Kirby",
  5: "Bowser",
  6: "Link",
  7: "Luigi",
  8: "Mario",
  9: "Marth",
  10: "Mewtwo",
  11: "Ness",
  12: "Peach",
  13: "Pikachu",
  14: "Ice Climbers",
  15: "Jigglypuff",
  16: "Samus",
  17: "Yoshi",
  18: "Zelda",
  19: "Sheik",
  20: "Falco",
  21: "Young Link",
  22: "Dr Mario",
  23: "Roy",
  24: "Pichu",
  25: "Ganondorf"
}

COLORS = {
    0: [
        "neutral",
        "black",
        "red",
        "pink",
        "green",
        "blue"
    ],
    1: [
        "neutral",
        "black",
        "red",
        "blue",
        "green"
    ],
    2: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    3: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    4: [
        "neutral",
        "yellow",
        "blue",
        "red",
        "green",
        "black"
    ],
    5: [
        "neutral",
        "red",
        "blue",
        "black"
    ],
    6: [
        "neutral",
        "red",
        "blue",
        "black",
        "white"
    ],
    7: [
        "neutral",
        "white",
        "lightblue",
        "pink"
    ],
    8: [
        "neutral",
        "yellow",
        "brown",
        "blue",
        "green"
    ],
    9: [
        "neutral",
        "red",
        "green",
        "black",
        "white"
    ],
    10: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    11: [
        "neutral",
        "yellow",
        "blue",
        "green"
    ],
    12: [
        "neutral",
        "red",
        "white",
        "blue",
        "green"
    ],
    13: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    14: [
        "neutral",
        "green",
        "orange",
        "red"
    ],
    15: [
        "neutral",
        "red",
        "blue",
        "green",
        "gold"
    ],
    16: [
        "neutral",
        "pink",
        "black",
        "green",
        "blue"
    ],
    17: [
        "neutral",
        "red",
        "blue",
        "yellow",
        "pink",
        "cyan"
    ],
    18: [
        "neutral",
        "red",
        "blue",
        "green",
        "white"
    ],
    19: [
        "neutral",
        "red",
        "blue",
        "green",
        "white"
    ],
    20: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    21: [
        "neutral",
        "red",
        "blue",
        "white",
        "black"
    ],
    22: [
        "neutral",
        "red",
        "blue",
        "green",
        "black"
    ],
    23: [
        "neutral",
        "red",
        "blue",
        "green",
        "gold"
    ],
    24: [
        "neutral",
        "red",
        "blue",
        "green"
    ],
    25: [
        "neutral",
        "red",
        "blue",
        "green",
        "purple"
    ]
}

URL = "https://chart-slp-server.herokuapp.com/api/matches?code=GOOB-854"
# URL = "https://chart-slp-server.herokuapp.com/api/matches?code=FIZZI-36"
BTC_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAlklEQVQ4T2NkwAH+H2T/jy7FaP+
TEZtyDEG4Zi0TTPXXzoDF0A1DMQRsADbN6MZdO4NiENwQbAbERh1lWLzMmgFGo5iFZBDYEFwuwG
sISCPUIKyGgDRjAyBXYXMNIz5XgDQga8TpLboYgux8DO/AwoUuLiEqTLBFMcmxQ7V0gssgklIsL
AYozjsoBoE45OZi5DRBSnkCAMLhlPBiQGHlAAAAAElFTkSuQmCC
""")

def getHours(timeString):
    for i in range(len(timeString)):
        if timeString[i] == ":":
            return timeString[:i]
    return ""

def main():
    data = cache.get("data")
    print('----------')
    if data != None:
        print("Cached - Displaying cached data.")
    else:
        print("No data available - Calling chartslp API.")
        data = http.get(URL)
        if data.status_code != 200:
            fail("Coindesk request failed with status %d", data.status_code)
    
    data = data.json()
    winrate = data["winrate"]
    main = CHARS[data["main"]]
    color = int(data["mainColor"])
    mainColor = COLORS[data["main"]][color]
    totalMatches = data["totalMatches"]
    hours = data["totalTime"]
    print(main, mainColor)
    print(winrate)
    st = "https://melee-icons.s3.amazonaws.com/%s/%s.png" % (main, mainColor)
    hours = getHours(hours)
    img = http.get(st).body()
    cache.set("data", str(data), ttl_seconds=3000)


    return render.Root(
        child = render.Box(
            render.Row(
                expanded=True,
                main_align="space_evenly",
                cross_align="center",
                children = [
                    render.Image(src=img, width=20, height=20),
                    render.Column(
                      expanded=True,
                      main_align="center",
                      children = [
                        # render.Text("%d gs" % totalMatches),
                        # render.Text("%d % wr" % winrate),
                        # render.Text("%s hrs" % hours),
                        render.WrappedText("%d gs \n %d wr \n %s hrs" % (totalMatches, winrate, hours))
                      ]
                    )
                ],
            ),
        ),
    )