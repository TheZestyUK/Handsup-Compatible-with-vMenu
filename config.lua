-- This script allows you to put your hands up in FiveM with Vmenu

-- Function to toggle hands up
function ToggleHandsUp()
    local playerPed = PlayerPedId()

    if DoesEntityExist(playerPed) and not IsEntityDead(playerPed) then
        RequestAnimDict("random@mugging3")
        while not HasAnimDictLoaded("random@mugging3") do
            Citizen.Wait(100)
        end

        if not handsUp then
            TaskPlayAnim(playerPed, "random@mugging3", "handsup_standing_base", 8.0, -8.0, -1, 49, 0, false, false, false)
            handsUp = true
        else
            ClearPedTasks(playerPed)
            handsUp = false
        end
    end
end

-- Registering hands-up command for Vmenu
RegisterCommand("handsup", function(source, args, rawCommand)
    ToggleHandsUp()
end, false)

-- Registering hands-up button for Vmenu
RegisterKeyMapping("handsup", "Toggle Hands Up", "keyboard", "Z") -- Change the key as desired

-- Callback function for Vmenu button press
RegisterCommand("vmenu:HandsUp", function(source, args, rawCommand)
    ToggleHandsUp()
end, false)


--zestyUK
