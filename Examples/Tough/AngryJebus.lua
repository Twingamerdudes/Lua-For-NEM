-- Define variables
local playerPos
local roomNum = 1
function Start()
    -- Initialize the mod
    local midpoint = CalculateMidPoint(RoomBorderX, RoomBorderZ) -- calculate spawn point of Jebus
    local character = SpawnCharacter("Dr. Christoff", {midpoint[1], 0, midpoint[2]}, true)
    ChangeProperty(character, {Player}, "target")
end

function Callback(ctype, args)
    if ctype == "room" then
        -- When the player enters a room spawn Jebus again
        roomNum = roomNum + 1
        local midpoint = CalculateMidPoint(RoomBorderX, RoomBorderZ)
        local character = SpawnCharacter("Dr. Christoff", {(midpoint[1] + midpoint[1] + midpoint[1]) + (50 * roomNum), 0.05, midpoint[2]}, true)
        ChangeProperty(character, {Player}, "target")
    end
end
function Update()

end
