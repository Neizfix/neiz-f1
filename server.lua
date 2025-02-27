QBCore = exports['qb-core']:GetCoreObject()

local vehicles = {
    { name = "Lamborghini", model = "tolklam" },
    { name = "Raid", model = "tolraid" }
}

RegisterNetEvent("neiz-f1:fetchVehicles")
AddEventHandler("neiz-f1:fetchVehicles", function()
    local src = source
    local Player = QBCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    local playerVehicles = vehicles

    exports.oxmysql:execute("SELECT vehicle FROM player_vehicles WHERE citizenid = ?", {citizenid}, function(results)
        for _, v in ipairs(results) do
            table.insert(playerVehicles, { name = v.vehicle, model = v.vehicle })
        end
        TriggerClientEvent("neiz-f1:openMenu", src, playerVehicles)
    end)
end)



local correctScriptName = "neiz-f1"

AddEventHandler('onResourceStart', function(resourceName)

    if resourceName == GetCurrentResourceName() then
        if resourceName ~= correctScriptName then
            print(string.format("^1HATA: Bu scriptin adını değiştiremezsiniz! Doğru ad: '%s'^7", correctScriptName))
            
            os.exit()
        else
            print(string.format("^3[NEIZ-DEVELOPMENT] ^2- discord.gg/neizdev Daha iyileri için!^0", correctScriptName))
        end
    end
end)
