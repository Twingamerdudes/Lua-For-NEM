local slowedTime = false

function Start()
    ChangeProperty(Player, {"Hank W Wimbleton"}, "character")
    local newSpeed = GetProperty(Player, "speed", {"max"}) * 2
    ChangeProperty(Player, {"max", newSpeed}, "speed")
    ChangeProperty(Player, {999}, "strength")
    ChangeProperty(Player, {999}, "lethality")
end

function Update()
    --CreateMenuUI_List("Test", "Cool test", {"Test"}, {"Test", "Another Test"}, "corpus/Corpus_Sirus")
    --ChangeProperty(Player, {2}, "corpus")
    if KeyDown("Semicolon") then
        if slowedTime then
            slowedTime = false
            local newSpeed = GetProperty(Player, "speed", {"max"}) * 0.2
            ChangeProperty(Player, {"max", newSpeed}, "speed")
            ChangeWorldProperty({1}, "time scale")
        else
            slowedTime = true
            local newSpeed = GetProperty(Player, "speed", {"max"}) / 0.2
            ChangeProperty(Player, {"max", newSpeed}, "speed")
            ChangeWorldProperty({0.2}, "time scale")
        end
    end
end
