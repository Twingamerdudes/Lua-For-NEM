local playerPos
local roomNum = 1
function Start()
    local midpoint = CalculateMidPoint(RoomBorderX, RoomBorderZ)
    local character = SpawnCharacter("Dr. Christoff", {midpoint[1], 0, midpoint[2]}, true)
    ChangeProperty(character, {Player}, "target")
end

function Callback(ctype, args)
    if ctype == "room" then
        roomNum = roomNum + 1
        local midpoint = CalculateMidPoint(RoomBorderX, RoomBorderZ)
        Notice(roomNum.." "..midpoint[2])
        Notice((midpoint[1] + midpoint[1] + midpoint[1]) + (50 * roomNum))
        local character = SpawnCharacter("Dr. Christoff", {(midpoint[1] + midpoint[1] + midpoint[1]) + (50 * roomNum), 0.05, midpoint[2]}, true)
        ChangeProperty(character, {Player}, "target")
    end
end
function Update()
    if GetKeyDown("Semicolon") then
        playerPos = GetProperty(Player, "position")
        character = SpawnCharacter("Dr. Christoff", {playerPos[1] + 3, playerPos[2], playerPos[3] + 3}, true)
        ChangeProperty(character, {Player}, "target")
    end
end