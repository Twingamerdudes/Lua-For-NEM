function Start()
    
end

function Update()
    if GetMouseButtonDown(2) then
        ChangeProperty(Player, GetMouseWorldPos(), "position") -- When the middle mouse button is pressed change the player's position to the mouse's position within the world
    end
end
