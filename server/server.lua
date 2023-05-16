local QBCore = exports['qb-core']:GetCoreObject()
local motels = {}
RegisterServerEvent('qb-motel:teleport')
AddEventHandler('qb-motel:teleport', function(id)
     local bucket = getFirstBucket()
     if bucket < 64 then
         motels[source] = bucket
         SetPlayerRoutingBucket(source, motels[id])
         TriggerClientEvent('qb-motel:enterRoom', source)
     else
         TriggerClientEvent("QBCore:Notify", source, "Motel odası dolu!", "error")
     end
end)

RegisterServerEvent('qb-motel:teleportExit')
AddEventHandler('qb-motel:teleportExit', function(id)
    motels[SetPlayerRoutingBucket] = nil
    SetPlayerRoutingBucket(source, 0)
    TriggerClientEvent('qb-motel:exitRoom', source)
end)



function getFirstBucket()
    local i = 1
    repeat
        local founded = false
        for k, v in pairs(motels) do
            if motels[k] == i then
                founded = true
                i=i+1
                break
            end
        end
    until not founded
    return i
end

AddEventHandler('playerDropped', function(_)
    motels[source] = nil
end)