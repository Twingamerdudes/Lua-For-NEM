function Start()

end

function Update()
    
end

function NGInteraction(flag)
    ChangeProperty("Desk Guy", {Player}, "target")
    Provoke("Desk Guy", AlertStatus.Combat)
end