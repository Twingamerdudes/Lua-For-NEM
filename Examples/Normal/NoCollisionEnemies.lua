function Start()

end

function Update()
    if GetKeyDown("Semicolon") then
        local objects = GetAllCharacters() -- Get all combatants
        
        -- Remove all colliders from all combatants except the player
        for i = 1, #objects do
            if objects[i] != Player then
                RemoveColliders(objects[i])
            end
        end
    end
end
