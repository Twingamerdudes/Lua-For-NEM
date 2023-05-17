local slowedTime = false

function Start()
    -- Initialize the mod
    ChangeProperty(Player, {"Hank W Wimbleton"}, "character") -- Change the player's character to Hank W Wimbleton
    local newSpeed = GetProperty(Player, "speed", {"max"}) * 2
    -- Change some properties of the player
    ChangeProperty(Player, {"max", newSpeed}, "speed")
    ChangeProperty(Player, {999}, "strength")
    ChangeProperty(Player, {999}, "lethality")
end

function Update()
    -- Slow time ability
    if KeyDown("Semicolon") then
        if slowedTime then
            slowedTime = false -- toggle slow time
            local newSpeed = GetProperty(Player, "speed", {"max"}) * 0.2
            ChangeProperty(Player, {"max", newSpeed}, "speed")
            ChangeWorldProperty({1}, "time scale") -- Make time slower
        else
            slowedTime = true -- toggle slow time
            local newSpeed = GetProperty(Player, "speed", {"max"}) / 0.2
            ChangeProperty(Player, {"max", newSpeed}, "speed")
            ChangeWorldProperty({0.2}, "time scale") -- Make time faster
        end
    end
end
