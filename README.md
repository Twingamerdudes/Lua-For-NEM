![LuaForNEM](https://user-images.githubusercontent.com/81382687/233855360-e894efbb-b39e-4e24-b7bb-0fcdef48f058.png)


# Lua for NEM Documentation
## Intro
Welcome to Lua for NEM Documentation
Here you will find all functions and variables that you can use in you're mod. There will also be a quick setup guide for making you're first lua mod.
## Setup
First drag the Assembly-CSharp.dll and MoonSharp.Interpreter.dll into (your M:PN folder)/Madness Project Nexus_Data/Managed folder.

Then in you're custom stuff folder (if you do not have it, then you will need to install NEM, then go back to step 1) create a lua, cutscenes, and models folder inside of it.

Inside your new lua folder, make a folder with you're mod name and then a main.lua file inside that mod folder.

Now inside that file write
```lua
function Start()
    Notice("test")
end

function Update()

end
```
Make sure to read the [wiki](https://github.com/Twingamerdudes/Lua-For-NEM/wiki) to learn more about Lua for NEM.
