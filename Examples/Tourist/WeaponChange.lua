function Start()
    
end

function Update()
    if GetKeyDown("H") then
        Notice(GetProperty(Player, "weapon")[1]) -- When the H key is pressed tell the user what weapon the player is holding
    end
    if GetKeyDown("M") then
        ChangeProperty(Player, {"SMG", "TerrorNine"}, "weapon") -- When the M key is pressed change the player's weapon to the TerrorNine
    end
end