function Start()
    Notice("Mod is loaded") -- When the mod is loaded, tell the user it is loaded
end

function Update()
    if GetKeyDown("Semicolon") then
        Notice("Semicolon is pressed") -- When the semicolon key is pressed tell the user it was pressed
    end
end
