load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("cache.star", "cache")
load("animation.star", "animation")
load("math.star", "math")
load("random.star", "random")

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

RANKS = [
    {
        "name": "GM",
        "max": 9999,
        "min": 2350
    },
    {
        "name": "Master 2",
        "max": 2349.99,
        "min": 2275
    },
    {
        "name": "Master 1",
        "max": 2274.99,
        "min": 2191.75
    },
    {
        "name": "Diamond 3",
        "max": 2191.74,
        "min": 2136.28
    },
    {
        "name": "Diamond 2",
        "max": 2136.27,
        "min": 2073.67
    },
    {
        "name": "Diamond 1",
        "max": 2073.66,
        "min": 2003.92
    },
    {
        "name": "Platinum 3",
        "max": 2003.91,
        "min": 1927.03
    },
    {
        "name": "Platinum 2",
        "max": 1927.02,
        "min": 1843
    },
    {
        "name": "Platinum 1",
        "max": 1842.99,
        "min": 1751.83
    },
    {
        "name": "Gold 3",
        "max": 1751.82,
        "min": 1653.52
    },
    {
        "name": "Gold 2",
        "max": 1653.51,
        "min": 1548.07
    },
    {
        "name": "Gold 1",
        "max": 1548.06,
        "min": 1435.48
    },
    {
        "name": "Silver 3",
        "max": 1435.47,
        "min": 1315.75
    },
    {
        "name": "Silver 2",
        "max": 1315.74,
        "min": 1188.88
    },
    {
        "name": "Silver 1",
        "max": 1188.87,
        "min": 1054.87
    },
    {
        "name": "Bronze 3",
        "max": 1054.86,
        "min": 913.72
    },
    {
        "name": "Bronze 2",
        "max": 913.71,
        "min": 765.43
    },
    {
        "name": "Bronze 1",
        "max": 765.42,
        "min": 0
    }
]

RANK_IMGS = {
  "Unranked1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Unranked1.ac2623299b250689293cd4a5e68fcc5b.png",
  "Unranked2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Unranked2.4515c2502e417d483f3f571dd0ef66fb.png",
  "Unranked3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Unranked3.0f639e8b73090a7ba4a50f7bcc272f57.png",
  "Bronze 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Bronze_I.90480ec5a08ee8d6048021f889933455.png",
  "Bronze 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Bronze_II.9d7a7994dbf087e3aea44f5b1c1409a7.png",
  "Bronze 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Bronze_III.b44c3a06f14234dec6f67e9b28088a6f.png",
  "Silver 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Silver_I.b8069dd847a639127f6d3ff5363623f7.png",
  "Silver 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Silver_II.7a97ee32770c36e78d9d7e9279c7ce38.png",
  "Silver 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Silver_III.93588af0e9a6bc9406209d5ef3cc9dc7.png",
  "Gold 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Gold_I.523b488f06ff22aaa013e94b6178f157.png",
  "Gold 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Gold_II.951fc625063425ed048c864988e8d7b7.png",
  "Gold 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Gold_III.38643ad9dbef534920fc2361fd736d7a.png",
  "Platinum 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Platinum_I.7a22c1a7c7640af6b6bf2f7b5b439fc6.png",
  "Platinum 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Platinum_II.ec1c571c896ed47ef2b14d8e2dd79fef.png",
  "Platinum 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Platinum_III.cd9d7a413a1de2182caaae563b4e5023.png",
  "Diamond 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Diamond_I.bcc6237a1e6be861f22f330bbff96964.png",
  "Diamond 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Diamond_II.2f26cd8248bcf6c34ea1efe7f835b123.png",
  "Diamond 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Diamond_III.ae3a5720a6ed48594efef54249095001.png",
  "Master 1": "https://melee-icons.s3.amazonaws.com/ranks/rank_Master_I.0ce2459fedf9e33ebee0cb3520a17e2f.png",
  "Master 2": "https://melee-icons.s3.amazonaws.com/ranks/rank_Master_II.c0b5472d49d391d2063d8e2a19c9ea17.png",
  "Master 3": "https://melee-icons.s3.amazonaws.com/ranks/rank_Master_III.5075fd077bf77bfa6c59985252e0cb04.png",
  "GM": "https://melee-icons.s3.amazonaws.com/ranks/rank_Grandmaster.0f3bc5674e8ec76f17514f197242c4fa.png"
}

def getRank(elo):
    for rank in RANKS:
        if rank["min"] < elo and rank["max"] > elo:
            return rank["name"]

# URL = "https://chart-slp-server.herokuapp.com/api/matches?code=GOOB-854"
RANK_URL = "https://gql-gateway-dot-slippi.uc.r.appspot.com/graphql"
BTC_ICON = base64.decode("""
iVBORw0KGgoAAAANSUhEUgAAABEAAAARCAYAAAA7bUf6AAAAlklEQVQ4T2NkwAH+H2T/jy7FaP+
TEZtyDEG4Zi0TTPXXzoDF0A1DMQRsADbN6MZdO4NiENwQbAbERh1lWLzMmgFGo5iFZBDYEFwuwG
sISCPUIKyGgDRjAyBXYXMNIz5XgDQga8TpLboYgux8DO/AwoUuLiEqTLBFMcmxQ7V0gssgklIsL
AYozjsoBoE45OZi5DRBSnkCAMLhlPBiQGHlAAAAAElFTkSuQmCC
""")

def getHours(timeString):
    for i in range(len(timeString)):
        if timeString[i] == ":":
            return int(timeString[:i])
    return 0

def getUserCodeDashIndex(userCode):
    for i in range(len(userCode)):
        if userCode[i] == "#" or userCode[i] == "-":
            return i

def requestStats(userCodeDash):
    statsUrl = "https://chart-slp-server.herokuapp.com/api/matches?code=%s" % userCodeDash
    res = http.get(statsUrl)
    if res.status_code != 200:
        fail("request failed with status %d", res.status_code)
    res = res.json()
    return res

def requestRank(userCode):
    body = json.encode({
      "operationName": "AccountManagementPageQuery",
      "variables": {
        "cc": userCode,
        "uid": userCode
      },
      "query": "fragment userProfilePage on User {\n  fbUid\n  displayName\n  connectCode {\n    code\n    __typename\n  }\n  status\n  activeSubscription {\n    level\n    hasGiftSub\n    __typename\n  }\n  rankedNetplayProfile {\n    id\n    ratingOrdinal\n    ratingUpdateCount\n    wins\n    losses\n    dailyGlobalPlacement\n    dailyRegionalPlacement\n    continent\n    characters {\n      id\n      character\n      gameCount\n      __typename\n    }\n    __typename\n  }\n  __typename\n}\n\nquery AccountManagementPageQuery($cc: String!, $uid: String!) {\n  getUser(fbUid: $uid) {\n    ...userProfilePage\n    __typename\n  }\n  getConnectCode(code: $cc) {\n    user {\n      ...userProfilePage\n      __typename\n    }\n    __typename\n  }\n}\n"
    })
    res = http.post(
          RANK_URL, 
          body = body,
          headers = {
            'Content-Type': 'application/json'
          }
    )
    if res.status_code != 200:
        fail("request failed with status %d", res.status_code)
    res = res.json()
    return res

showStrings = ["showGames", "showWinrate", "showHours", "showKills", "showNeutralWinrate", "showBeneficialTraderate", "showFirstBloodrate", "showFourstocks"]

def pickThreeRandom(arr):
    if len(arr) <= 3:
        return arr

    random_elements = []
    seen_indices = []

    for i in range(9999): #while loops don't exist in starlark?? booooo!
        random_index = random.number(0, len(arr) - 1)
        if random_index not in seen_indices:
            seen_indices.append(random_index)
            random_elements.append(arr[random_index])
        
            if len(random_elements) == 3:
                break

    return random_elements


REFRESH_TIME = 43200 # twice a day
def main(config):
    userCode = config.str("userCode")
    showGames = config.bool("showGames")
    showWinrate = config.bool("showWinrate")
    showHours = config.bool("showHours")
    showKills = config.bool("showKills")
    showNeutralWinrate = config.bool("showNeutralWinrate")
    showBeneficialTraderate = config.bool("showBeneficialTraderate")
    showFirstBloodrate = config.bool("showFirstBloodrate")
    showFourstocks = config.bool("showFourstocks")
    # userCode = "hbox-305"
    # showGames = True
    # showWinrate = True
    # showHours = False
    # showKills = False
    # showNeutralWinrate = False
    # showBeneficialTraderate = False
    # showFirstBloodrate = False
    # showFourstocks = False
    if userCode == None:
        fail("No userCode configured")

    showRandom = False
    showArray = []
    if showGames:
        showArray.append("showGames")
    if showWinrate:
        showArray.append("showWinrate")
    if showHours:
        showArray.append("showHours")
    if showKills:
        showArray.append("showKills")
    if showNeutralWinrate:
        showArray.append("showNeutralWinrate")
    if showBeneficialTraderate:
        showArray.append("showBeneficialTraderate")
    if showFirstBloodrate:
        showArray.append("showFirstBloodrate")
    if showFourstocks:
        showArray.append("showFourstocks")

    if len(showArray) == 0 or showRandom:
        showRandom = True # if none are configured, show random
        #add 3 random
        for i in range(3):
            showArray = pickThreeRandom(showStrings)
    elif len(showArray) > 3:
        fail("Too many configurations, please only pick 3")

    userCode = userCode.upper()
    userCodeDashIndex = getUserCodeDashIndex(userCode)
    userCodeHash = userCode[:userCodeDashIndex] + "#" + userCode[userCodeDashIndex+1:]
    userCodeDash = userCode[:userCodeDashIndex] + "-" + userCode[userCodeDashIndex+1:]
    rankedData = cache.get("rankedData")
    statsData = cache.get("statsData")
    if rankedData != None:
        # print("Cached - Displaying cached rankedData.")
        rankedData = json.decode(rankedData)
    else:
        # print("No data available - Calling slippi API.")
        rankedData = requestRank(userCodeHash)
        cache.set("rankedData", json.encode(rankedData), ttl_seconds=REFRESH_TIME)

    if statsData != None:
        # print("Cached - Displaying cached statsData.")
        statsData = json.decode(statsData)
    else:
        # print("No data available - Calling chartslp API.")
        statsData = requestStats(userCodeDash)
        cache.set("statsData", json.encode(statsData), ttl_seconds=REFRESH_TIME)
    
    if rankedData["data"]["getConnectCode"]["user"]["displayName"]:
        elo = rankedData["data"]["getConnectCode"]["user"]["rankedNetplayProfile"]["ratingOrdinal"]
        rank = getRank(elo)
        name = rankedData["data"]["getConnectCode"]["user"]["displayName"]
        rankedImg = http.get(RANK_IMGS[rank]).body()
    else:
        fail("Ranked data did not respond correctly")

    if statsData["winrate"]:
        games = statsData["totalMatches"]
        winrate = statsData["winrate"]
        hours = getHours(statsData["totalTime"])
        kills = statsData["kills"]
        if statsData["neutralWins"] + statsData["oppNeutralWins"] == 0:
            neutralWinrate = 0
        else:
            neutralWinrate = int(math.round(float(statsData["neutralWins"]) / (statsData["neutralWins"] + statsData["oppNeutralWins"]) * 100))
        
        if statsData["beneficialTrades"] + statsData["oppBeneficialTrades"] == 0:
            beneficialTraderate = 0
        else:
            beneficialTraderate = int(math.round(float(statsData["beneficialTrades"]) / (statsData["beneficialTrades"] + statsData["oppBeneficialTrades"]) * 100))
        
        if statsData["firstBloods"] + statsData["oppFirstBloods"] == 0:
            firstBloodrate = 0
        else:
            firstBloodrate = int(math.round(float(statsData["firstBloods"]) / (statsData["firstBloods"] + statsData["oppFirstBloods"]) * 100))

        fourStocks = statsData["fourStocks"]
        main = CHARS[statsData["main"]]
        color = int(statsData["mainColor"])
        mainColor = COLORS[statsData["main"]][color]
        st = "https://melee-icons.s3.amazonaws.com/%s/%s.png" % (main, mainColor)
        statsImg = http.get(st).body()

        lines = ["", "", ""]
        for i in range(len(showArray)):
            if showArray[i] == "showGames":
                lines[i] = "%d gs" % games
            elif showArray[i] == "showWinrate":
                lines[i] = "%d wr" % winrate
            elif showArray[i] == "showHours":
                lines[i] = "%d hrs" % hours
            elif showArray[i] == "showKills":
                lines[i] = "%d kills" % kills
            elif showArray[i] == "showNeutralWinrate":
                lines[i] = "%d nwr" % neutralWinrate
            elif showArray[i] == "showBeneficialTraderate":
                lines[i] = "%d btr" % beneficialTraderate
            elif showArray[i] == "showFirstBloodrate":
                lines[i] = "%d fbr" % firstBloodrate
            elif showArray[i] == "showFourstocks":
                lines[i] = "%d 4st" % fourStocks

    else:
        fail("Stats data did not respond correctly")


    return render.Root(
          child=render.Stack(
            children= [
              animation.Transformation(
                delay=100, # show for 100 frames
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(-64, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 50, #animation takes 50 frames
                child= render.Row(
                  expanded=True,
                  main_align="space_evenly",
                  cross_align="center",
                  children = [
                      render.Image(src=rankedImg, width=18, height=18),
                      render.Column(
                        expanded=True,
                        main_align="center",
                        children = [
                          render.Text("%s" % name),
                          render.Text("%s" % rank),
                          render.Text("%d" % elo)
                        ]
                      )
                  ],
                ),
              ),
              animation.Transformation(
                delay=100, #begin with above animation start
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(64, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.25, #@150
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.75, #show for 100 frames, then begin animation
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(-64, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 200, #4 times as long to split evenly
                child= render.Row(
                  expanded=True,
                  main_align="space_evenly",
                  cross_align="center",
                  children = [
                      render.Column(
                        expanded=True,
                        main_align="center",
                        children = [
                          render.Text(lines[0]),
                          render.Text(lines[1]),
                          render.Text(lines[2]),
                        ]
                      ),
                      render.Image(src=statsImg, width=18, height=18)
                  ],
                ),
              ),
              animation.Transformation(
                delay=250, #begin at 250
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(64, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 50,
                child= render.Row(
                  expanded=True,
                  main_align="space_evenly",
                  cross_align="center",
                  children = [
                      render.Image(src=rankedImg, width=18, height=18),
                      render.Column(
                        expanded=True,
                        main_align="center",
                        children = [
                          render.Text("%s" % name),
                          render.Text("%s" % rank),
                          render.Text("%d" % elo),
                          # render.Text("%d % wr" % winrate),
                          # render.Text("%s hrs" % hours),
                          # render.WrappedText("%d gs \n %d wr \n %s hrs" % (totalMatches, winrate, hours))
                        ]
                      )
                  ],
                ),
              ),
            ]
          )
        
    )