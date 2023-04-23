ESX = nil

if Config.EsxNews then
    ESX = exports["es_extended"]:getSharedObject()
else
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
end

--[[ RegisterServerEvent("sBoutique:GetPointsServer")
AddEventHandler("sBoutique:GetPointsServer", function()
    local xPlayer = ESX.GetPlayerFromId(source)
    if xPlayer ~= nil then
        local _source = source
        license = ESX.GetIdentifierFromId(source)
        MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
            ['@identifier'] = license
        }, function(data)
            local point = data[1].coins
            TriggerClientEvent('sBoutique:GetPointsClient', _source, point)
        end)
    end
end) ]]


RegisterServerEvent("sBoutique:GetPointsAndCode")
AddEventHandler("sBoutique:GetPointsAndCode", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        TriggerClientEvent('sBoutique:GetPointsAndCodeClient', _source, data[1].coins, data[1].boutique_id)
    end)
end)
