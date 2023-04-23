# Lua for NEM Documentation
## Intro
Welcome to Lua for NEM Documentation
Here you will find all functions and variables that you can use in you're mod. There will also be a quick setup guide for making you're first lua mod.
## Setup
First drag the Assembly-CSharp.dll and MoonSharp.Interpreter.dll into (your M:PN folder)/Madness Project Nexus_Data/Managed folder.

Then in you're custom stuff folder (if you do not have it, then you will need to install NEM, then go back to step 1) create a lua and cutscene's folder.

Inside your new lua folder, make a folder with you're mod name and then a main.lua file inside that mod folder.

Now inside that file write
```lua
function Start()
    Notice("test")
end

function Update()

end
```
You've just made you're first mod. Now just boot up M:PN and you should see test being displayed in the middle left area.

Now from here you can do whatever you want, the possibilities are endless
## Variables
### Player
Type: string

Player's gameObject name
### DeltaTime
Type: float

Time passed since last frame
### CurrentRoom
Type: string

Name of the current room the player is in
### RoomBorderX
Type: float[] (length of 2)

The x borders of the current room
### RoomBorderZ
Type: float[] (length of 2)

The z borders of the current room.

## Callback Functions (Make the functions inside your lua file)
### Callback
Params: string type, object[] args.

The most generic and basic callback function. Mostly used for gameplay callbacks.
### ButtonCallback_List
Params: int id, string item.

Called whenever a user clicks a button with a list.

### ButtonCallback
Params: int id.

Called when a button with no list is pressed.
## Functions
### Godmode
Params: string object name

Makes object of type Combatant_Base be invincible

Usage: `Godmode(Player)`
### Notice
Params: string text

Shows a message to the side of the screen

Usage: `Notice("This is a notice")`
### Change Property
Params: string object name, object[]properties, string type

Changes properties of a object

Usage: `ChangeProperty(Player, {0, 0, 0}, "position")`
### Get Property
Params: string object name, string type, string[] args (optional, defaults to null)

Get's a property of a object

Usage: `GetProperty(Player, "position")`

Usage 2: `GetProperty(Player, "speed", {"max"})`

Return type: object
### Get All Characters
Params: bool mustBeAlive (optional, defaults to false)

Get's all characters in a scene

Usage: `GetAllCharacters()`

Notes: bool can be used to disable the searching of dead characters

Return type: string[]
### Get Key Down
Params: string key

Checks if a key is down

Usage: `if GetKeyDown("Semicolon") then`

Notes: Function uses unity syntax so putting ';' and 'k' won't work. However 'Semicolon' and 'K' work

Return type: bool
### Get Key
Params: string key

Checks if a key is pressed.

Usage: `if GetKey("Semicolon") then`

Notes: This will be called multiple times when a key is pressed unlike Get Key Down

Return type: bool
### Get Key Up
Params: string key

Checks if a key is not pressed

Usage: `if GetKeyUp("Semicolon") then`

Return type: bool
### Write To File
Params: string name, string contents, string path(optional, defaults to persistent path)

Writes a file at a specfied path

Usage: `WriteToFile("test.txt", "test")`
### Read File
Params: string path

Reads a file

Usage: `local file = ReadFile("test.txt")`

Return type: string
### Create Menu UI
Params: string heading, string subheadding, string[] Button Names

Creates a UI with buttons

Usage: `CreateMenuUI("Test", "Cool Test", {"Ok", "Cancel"})`

Notes: Requires a ButtonCallback function with the params of id (int) to be made within your lua file

### Create Menu UI List
Params: string heading, string subheadding, string[] Button Names, string[] ItemNames, string SpriteIconName

Creates a UI with a list and buttons

Usage: `CreateMenuUI_List("Test", "Cool Test", {"Submit"}, {"Test", "Another Test"}, "corpus/Corpus_Sirus")`

Notes: Requires a ButtonCallback_List function with the params of id (int) and item (string) to be made within your lua file

### Change World Property
Params: object[] properties, string type

Changes properties of the world.

Usage: `ChangeWorldProperty({0.5}, "time scale")`
### Get World Property
Params: string type

Get's a wortld property.

Usage: `local timeScale = GetWorldProperty("time scale")`

Return Type: object
### Play Cutscene
Params: string name, bool callback (optional, defaults to false), id (optional defaults to 0, requires callback to be true)

Plays a cutscene, if callback is true, then CutsceneCallback will be called.

Usage: `PlayCutscene("test.json")`

Notes: If using callbacks, you must have a CutsceneCallback function with the params of id (int) in your lua code.
### Spawn Character
Params: string name, float[] position, startInAttackMode (optional, defaults to false)

Spawns a character at the specified position and returns it's gameObject name.

Usage: `SpawnCharacter("Dr. Christoff", {0, 0, 0})`

Return type: string
### Spawn Squad
Params: string[] names, float[] position, startInAttackMode (optional, defaults to false)

Spawns a squad of characters at the specified position and returns all memeber's gameObject names.

Usage: `SpawnSquad({"Grunt", "Grunt"}, {0, 0, 0})`

Return type: string[] (length of squad)
### Calculate Midpoints
Params: float[] xBorders, float[] zBorders

Calculates the midpoint of a room based on it's borders.

Usage: `CalulateMidpoints(RoomBorderX, RoomBorderZ)`

Return type: float[] (Length of 2)

Notes: Good for spawning characters in the center of rooms

### Add Pause Text
Params: string message

Adds a pause message to the list of potential pause messages

Usage: `AddPauseText("Sore loser")`
### Clear Pause Text
Params: string message

Removes all pause messages from the pause messages list, then adds your pause message to the list

Usage: `ClearPauseText("Sore loser")`
### Play Music
Params: string name

Plays some music

Usage: `PlayMusic("event:/Music/Cheshyre/AAHW")`
### Notify
Params: string message
Notifys the user in game with you're message

Usage: `Notify("This is a notification")`

## Properties
postion: float[]

rotation: float[]

scale: float[]

corpus (requires object to have combatant base): int

speed (requires object to have combatant base), first property must be one of these types:
* acceleration
* deceleration
* max

Example: `ChangeProperty(Player, {"max", 16}, "speed")`

gravity: bool

strength: int

lethality: int

fall damage: bool

target: string

state, first property must be one of the types below:
* ragdoll
* dead
Example: `ChangeProperty(Player, {"ragdoll", true}, "state")`

## Music strings
```lua
"event:/Music/Cheshyre/AAHW"
"event:/Music/Cheshyre/Anesthetize"
"event:/Music/Cheshyre/Asylum"
"event:/Music/Cheshyre/Awful pretty"
"event:/Music/Cheshyre/Bass Thrombosis"
"event:/Music/Cheshyre/Black Clouds"
"event:/Music/Cheshyre/Child of the swamp zombie"
"event:/Music/Cheshyre/Chorus of the damned"
"event:/Music/Cheshyre/Dandy"
"event:/Music/Cheshyre/Darkworm",
"event:/Music/Cheshyre/Fucking Crazy"
"event:/Music/Cheshyre/Hankenstien"
"event:/Music/Cheshyre/Hidden"
"event:/Music/Cheshyre/Impermant"
"event:/Music/Cheshyre/Observance Negetive"
"event:/Music/Cheshyre/Ominous"
"event:/Music/Cheshyre/Passed"
"event:/Music/Cheshyre/Resolution"
"event:/Music/Cheshyre/Space Madness"
"event:/Music/Cheshyre/Swamp Zombies"
"event:/Music/Cheshyre/Tense Unit"
"event:/Music/Cheshyre/The day before"
"event:/Music/Cheshyre/Waltzer White"
"event:/Music/Locknar/80sCalledBack"
"event:/Music/Locknar/80sCalledBack(FilteredVersion)"
"event:/Music/Locknar/Blood Bath"
"event:/Music/Locknar/Blood Son"
"event:/Music/Locknar/Brimstone"
"event:/Music/Locknar/CheesyMallMusic"
"event:/Music/Locknar/CheesyGymMusic"
"event:/Music/Locknar/CheesyGymMusicExtended"
"event:/Music/Locknar/Club Hellfire",
"event:/Music/Locknar/Club Hellfire Enter Bouncer"
"event:/Music/Locknar/Crawler"
"event:/Music/Locknar/Darkness Comes"
"event:/Music/Locknar/Dead Drop"
"event:/Music/Locknar/Deputized"
"event:/Music/Locknar/EndingTheme"
"event:/Music/Locknar/Enter The Nexus"
"event:/Music/Locknar/FailOneShot"
"event:/Music/Locknar/Murderbot Firmware Update"
"event:/Music/Locknar/FunkyPunch"
"event:/Music/Locknar/Good Kill A Side"
"event:/Music/Locknar/Good Kill B Side"
"event:/Music/Locknar/HQ"
"event:/Music/Locknar/Induztrial Complex"
"event:/Music/Locknar/Just After Midnight"
"event:/Music/Locknar/Madmentat"
"event:/Music/Locknar/MadnessThemeAmbi"
"event:/Music/Locknar/MadnessThemeDraft"
"event:/Music/Locknar/Meltdown"
"event:/Music/Locknar/Meltdown Breaks"
"event:/Music/Locknar/Murder Room"
"event:/Music/Locknar/Netflix and Kill"
"event:/Music/Locknar/No Escape"
"event:/Music/Locknar/Party Alarm"
"event:/Music/Locknar/Rock&Loaded"
"event:/Music/Locknar/Shatterdome Madness VIP"
"event:/Music/Locknar/Sunfall"
"event:/Music/Locknar/Taking Inventory"
"event:/Music/Locknar/Thunderground"
"event:/Music/Locknar/VictoryLoop"
"event:/Music/Locknar/Violator Engine"
"event:/Music/Locknar/Vulture Feast"
"event:/Music/Locknar/Weird Science"
"event:/Music/Locknar/Work of Fiktion"
"NONE"
```
