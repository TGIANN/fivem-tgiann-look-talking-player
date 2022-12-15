CreateThread(function()
    while true do
        Wait(500)
        local onlinePlayers <const> = GetActivePlayers()
        local playerPed <const> = PlayerPedId()
        for i=1, #onlinePlayers do
            if onlinePlayers[i] ~= PlayerId() and NetworkIsPlayerActive(onlinePlayers[i]) then
                if MumbleIsPlayerTalking(onlinePlayers[i]) then
                    local targetPed <const> = GetPlayerPed(onlinePlayers[i])
                    if #(GetEntityCoords(targetPed) - GetEntityCoords(playerPed)) < 20 then
                        TaskLookAtEntity(playerPed, targetPed, 3000, 2048, 3)
                    end
                end
            end
        end
    end
end)