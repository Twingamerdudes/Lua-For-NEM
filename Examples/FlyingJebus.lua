local FlySpeed = 20

function Start()
    ChangeProperty(Player, {"Dr. Christoff"}, "character")
    ChangeProperty(Player, {false}, "fall damage")
end

function Update()
    if GetKey("Semicolon") then
        ChangeProperty(Player, {false}, "gravity")
        if GetKey("A") then
            ChangeProperty(Player, {GetProperty(Player, "position")[1] - FlySpeed * DeltaTime, GetProperty(Player, "position")[2] + FlySpeed * DeltaTime, GetProperty(Player, "position")[3]}, "position")
        elseif GetKey("D") then
            ChangeProperty(Player, {GetProperty(Player, "position")[1] + FlySpeed * DeltaTime, GetProperty(Player, "position")[2] + FlySpeed * DeltaTime, GetProperty(Player, "position")[3]}, "position")
        elseif GetKey("W") then
            ChangeProperty(Player, {GetProperty(Player, "position")[1], GetProperty(Player, "position")[2] + FlySpeed * DeltaTime, GetProperty(Player, "position")[3] + FlySpeed * DeltaTime}, "position")
        elseif GetKey("S") then
            ChangeProperty(Player, {GetProperty(Player, "position")[1], GetProperty(Player, "position")[2] + FlySpeed * DeltaTime, GetProperty(Player, "position")[3] - FlySpeed * DeltaTime}, "position")
        else
            ChangeProperty(Player, {GetProperty(Player, "position")[1], GetProperty(Player, "position")[2] + FlySpeed * DeltaTime, GetProperty(Player, "position")[3]}, "position")
        end
        --SpawnCharacter("Grunt", {-168.12, 0.38, 0.26}, false)
    else
        ChangeProperty(Player, {true}, "gravity")
    end
end