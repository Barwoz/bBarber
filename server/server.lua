ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)


----------------------Coiffeur

-----Prix

RegisterNetEvent('barwoz:coiffeur')
AddEventHandler('barwoz:coiffeur', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local price = 50
    local xMoney = xPlayer.getMoney()

    if xMoney >= price then
        xPlayer.removeMoney(price)
        TriggerClientEvent('esx:showNotification', source, "~g~Tu as payé le Coiffeur")
        TriggerClientEvent("barwoz:saveSkin", source)
    else
        TriggerClientEvent('esx:showNotification', source, "Il vous ~r~manque~g~ $"..price-xMoney.."~w~ !")
    end
end)
