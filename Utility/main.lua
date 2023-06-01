--Grabbing object names for NG++

function Start()

end

function Update()
    if GetKeyDown("Semicolon") then
        Notice(GetMouseWorldObject())
    end
end