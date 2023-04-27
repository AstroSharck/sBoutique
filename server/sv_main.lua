local date = os.date("*t")
ESX = nil

if Config.EsxNews then
    ESX = exports["es_extended"]:getSharedObject()
else
    TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
    end)
end

if ('sBoutique' ~= GetCurrentResourceName()) then
    return error("Don\'t rename resource")
end

--[[ Get Code and Points ]]
RegisterServerEvent("sBoutique:GetPointsAndCode")
AddEventHandler("sBoutique:GetPointsAndCode", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        TriggerClientEvent('sBoutique:GetPointsAndCodeClient', _source, data[1].coins, data[1].boutique_id)
    end)
end)


RegisterServerEvent("sBoutique:GetHistory")
AddEventHandler("sBoutique:GetHistory", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM shop_history WHERE identifier=@identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        TriggerClientEvent('sBoutique:GetHistoryClient', _source, data, Config.LogoCoins)
    end)
end)


--[[ Buy item ]]
RegisterServerEvent("sBoutique:BuyItem")
AddEventHandler("sBoutique:BuyItem", function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local GetPriceItem = GetItemPrice(data.ItemName, data.Location)
    if GetPriceItem == nil then
        return --[[ DropPlayer(_source, Config.MessageDropCheater) ]] print('Cheat !')
    else
        if xPlayer ~= nil then
            MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
                ['@identifier'] = xPlayer.getIdentifier()
            }, function(data)
                local Coins = data[1].coins
                if Coins >= GetPriceItem.Price then
                    npoint = Coins - GetPriceItem.Price
                    MySQL.Async.execute('UPDATE `users` SET `coins`=@point  WHERE identifier=@identifier', {
                        ['@identifier'] = xPlayer.getIdentifier(),
                        ['@point'] = npoint
                    }, function(rowsChange)
                        if GetPriceItem.Type == "vehicule" then
                            TriggerClientEvent('sBoutique:GiveVehicule', _source, GetPriceItem.Name)
                            InsertHistory(xPlayer.getIdentifier(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                        elseif GetPriceItem.Type == "weapon" then
                            xPlayer.addWeapon(GetPriceItem.Name, GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                        elseif GetPriceItem.Type == "item" then
                            xPlayer.addInventoryItem(GetPriceItem.Name, GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                        elseif GetPriceItem.Type == "money" then
                            xPlayer.addAccountMoney('bank', GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                        end
                    end)
                else
                    TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Tu n\'as pas assez de ' .. Config.CoinsName .. ' pour effectuer cette achat !', "CHAR_BANK_FLEECA", 3)
                end
            end)
        end
    end
end)

RegisterServerEvent('sBoutique:GiveVehicule')
AddEventHandler('sBoutique:GiveVehicule', function(vehicleProps, plate)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
        MySQL.Async.execute('INSERT INTO owned_vehicles (owner, plate, vehicle) VALUES (@owner, @plate, @vehicle)', {
            ['@owner']   = xPlayer.identifier,
            ['@plate']   = vehicleProps.plate,
            ['@vehicle'] = json.encode(vehicleProps)
        }, function(rowsChange)
            TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a bien recu ton véhicule !', "CHAR_BANK_FLEECA", 3)
        end)
    end
end)


--[[ Check Plate ]]
ESX.RegisterServerCallback('sBoutique:CheckPlate', function (source, cb, plate)
    MySQL.Async.fetchAll('SELECT 1 FROM owned_vehicles WHERE plate = @plate', {
        ['@plate'] = plate
    }, function (result)
        cb(result[1] ~= nil)
    end)
end)


RegisterServerEvent('sBoutique:GetAdminDetails')
AddEventHandler('sBoutique:GetAdminDetails', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local IsAdmin = CheckAdmin('licence:'..xPlayer.getIdentifier())

    local FetchPayementTebex = GetPayementTebex()
    local FetchPackageTebex = GetPackageTebex()

    local Data = {
        ['EnableAdminPanel'] = Config.EnableAdminPanel,
    }

    Data.EnableAdminPanel = Config.EnableAdminPanel
    Data.EnableTebexAPI = Config.EnableTebexAPI
    Data.EnableTebexRevenue = Config.EnableTebexRevenue
    local TebexRev = Config.EnableTebexRevenue
    local TebexPack = Config.TebexFetchPackage
    
    if not Config.EnableAdminPanel then return end
    if IsAdmin then
        if not Config.EnableAdminGiveCoins then Data.EnableAdminGiveCoins = false end
    end
end)



