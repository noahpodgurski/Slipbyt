load("render.star", "render")
load("http.star", "http")
load("encoding/base64.star", "base64")
load("encoding/json.star", "json")
load("cache.star", "cache")
load("animation.star", "animation")

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

FETCHED = {"data": {
    "getUser": None,
    "getConnectCode": {
        "user": {
            "fbUid": "58O6OLvnNATzBq7wupk1o5dVKIu1",
            "displayName": "GoobyDoob",
            "connectCode": {
                "code": "GOOB#854",
                "__typename": "ConnectCode"
            },
            "status": "ACTIVE",
            "activeSubscription": {
                "level": "NONE",
                "hasGiftSub": False,
                "__typename": "SubscriptionResult"
            },
            "rankedNetplayProfile": {
                "id": "0x3e699b",
                "ratingOrdinal": 1508.393198,
                "ratingUpdateCount": 64,
                "wins": 33,
                "losses": 31,
                "dailyGlobalPlacement": None,
                "dailyRegionalPlacement": None,
                "continent": "NORTH_AMERICA",
                "characters": [
                    {
                        "id": "0x3e773d",
                        "character": "DR_MARIO",
                        "gameCount": 50,
                        "__typename": "CharacterUsage"
                    },
                    {
                        "id": "0x3ec8c6",
                        "character": "MARTH",
                        "gameCount": 60,
                        "__typename": "CharacterUsage"
                    },
                    {
                        "id": "0x42612c",
                        "character": "JIGGLYPUFF",
                        "gameCount": 21,
                        "__typename": "CharacterUsage"
                    },
                    {
                        "id": "0x4286d6",
                        "character": "FOX",
                        "gameCount": 1,
                        "__typename": "CharacterUsage"
                    },
                    {
                        "id": "0x4290af",
                        "character": "PEACH",
                        "gameCount": 12,
                        "__typename": "CharacterUsage"
                    },
                    {
                        "id": "0x452671",
                        "character": "SHEIK",
                        "gameCount": 10,
                        "__typename": "CharacterUsage"
                    }
                ],
                "__typename": "NetplayProfile"
            },
            "__typename": "User"
        },
        "__typename": "ConnectCode"
    }
}}

RANKS = [
    {
        "name": "Master 3",
        "max": 3000,
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
}

def getRank(elo):
    for rank in RANKS:
        if rank["min"] < elo and rank["max"] > elo:
            return rank["name"]

# URL = "https://chart-slp-server.herokuapp.com/api/matches?code=GOOB-854"
statsUrl = "https://chart-slp-server.herokuapp.com/api/matches?code=FIZZI-36"
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

def requestStats():
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

def main():
    userCode = "FIZZI#36"
    rankedData = cache.get("rankedData")
    statsData = cache.get("statsData")
    print('----------')
    if rankedData != None:
        print("Cached - Displaying cached rankedData.")
        rankedData = json.decode(rankedData)
    else:
        print("No data available - Calling slippi API.")
        rankedData = requestRank(userCode)
        # rankedData = FETCHED

    if statsData != None:
        print("Cached - Displaying cached statsData.")
        statsData = json.decode(statsData)
    else:
        print("No data available - Calling chartslp API.")
        statsData = requestStats()
    
    if rankedData["data"]["getConnectCode"]["user"]["displayName"]:
        elo = rankedData["data"]["getConnectCode"]["user"]["rankedNetplayProfile"]["ratingOrdinal"]
        rank = getRank(elo)
        name = rankedData["data"]["getConnectCode"]["user"]["displayName"]
        rankedImg = http.get(RANK_IMGS[rank]).body()
    else:
        fail("Ranked data did not respond correctly")

    if statsData["winrate"]:
        winrate = statsData["winrate"]
        main = CHARS[statsData["main"]]
        color = int(statsData["mainColor"])
        mainColor = COLORS[statsData["main"]][color]
        totalMatches = statsData["totalMatches"]
        hours = statsData["totalTime"]
        print(main, mainColor)
        print(winrate)
        st = "https://melee-icons.s3.amazonaws.com/%s/%s.png" % (main, mainColor)
        hours = getHours(hours)
        print(hours)
        statsImg = http.get(st).body()
    else:
        fail("Stats data did not respond correctly")

    cache.set("rankedData", json.encode(rankedData), ttl_seconds=1800)
    cache.set("statsData", json.encode(statsData), ttl_seconds=1800)

    return render.Root(
          child=render.Stack(
            children= [
              animation.Transformation(
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  # wait .3 (delay)
                  animation.Keyframe(
                    percentage = 0.3,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.5,
                    transforms = [animation.Translate(-100, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(-100, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 200,
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
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(100, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.3,
                    transforms = [animation.Translate(100, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.5,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  # wait .3
                  animation.Keyframe(
                    percentage = 0.8,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(-100, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 200,
                child= render.Row(
                  expanded=True,
                  main_align="space_evenly",
                  cross_align="center",
                  children = [
                      render.Image(src=statsImg, width=18, height=18),
                      render.Column(
                        expanded=True,
                        main_align="center",
                        children = [
                          # render.WrappedText("%d gs \n %d wr \n %d hrs" % (totalMatches, winrate, hours))
                          render.Text("%d gs" % totalMatches),
                          render.Text("%d wr" % winrate),
                          render.Text("%d hrs" % hours),
                        ]
                      )
                  ],
                ),
              ),
              animation.Transformation(
                keyframes = [
                  animation.Keyframe(
                    percentage = 0.0,
                    transforms = [animation.Translate(100, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 0.8,
                    transforms = [animation.Translate(100, 0)],
                    curve = "ease_in_out"
                  ),
                  animation.Keyframe(
                    percentage = 1.0,
                    transforms = [animation.Translate(0, 0)],
                    curve = "ease_in_out"
                  )
                ],
                duration = 200,
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