function Start()
    
end

function Update()
    if GetKeyDown("H") then
        Notice(GetProperty(Player, "weapon")[1])
    end
    if GetKeyDown("M") then
        ChangeProperty(Player, {"SMG", "TerrorNine"}, "weapon")
    end
end