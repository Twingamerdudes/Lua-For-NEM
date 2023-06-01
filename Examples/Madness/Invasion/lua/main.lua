local removedSquadMember = false
local deletedSquadMember = false
local engineer = nil
function Start()
    SetGlobalVariable("interacted", false)
end

function RemoveSquadMember(args)
    RemoveFromSquad(engineer)
    removedSquadMember = true
end

function SpawnEnemySquad()
    local squad = SpawnSquadAtEntrance({"MERC Sniper", "MERC Sniper", "MERC Sniper"}, true, 11)
    PlayCutscene("gethim.json", {squad[1]})
end


function Callback(ctype, args)
    if ctype == "room" then
        if args[1] == "Security_Room3" and not removedSquadMember then
            engineer = GetSquadRoster(GetSquadName(Player))[2]
            RunAfter(0.1, "RemoveSquadMember")
        end
        if args[1] == "Security_Room3" and GetGlobalVariable("interacted") then
            RunAfter(0.25, "SpawnEnemySquad")
        end
        if args[1] == "Security_Room3.5" and not deletedSquadMember then
            Destroy(engineer)
            deletedSquadMember = true
        end
        if args[1] == "Security_Room4" and not deletedSquadMember then
            PlayCutscene("gethim2.json", {"Guy"})
        end
    end
end

function NGInteraction(flag)
    WriteToFile("interacted.txt", "true")
end

function Update()
    if GetKeyDown("Semicolon") then
        SetFaction(GetMouseWorldObject(), Factions.AAHW)
    end
    if GetKeyDown("Comma") then
        Notice(GetFaction(GetMouseWorldObject()))
    end
end