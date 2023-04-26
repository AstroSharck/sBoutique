ESX = nil

if Config.EsxNews then
    ESX = exports["es_extended"]:getSharedObject()
else
    TriggerEvent('esx:getSharedObject', function(obj)
        ESX = obj
    end)
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

--[[ Buy item ]]
RegisterServerEvent("sBoutique:BuyItem")
AddEventHandler("sBoutique:BuyItem", function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    print(data.ItemName)
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
                    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
                        ['@identifier'] = xPlayer.getIdentifier()
                    }, function(data)
                        local poi = data[1].coins
                        npoint = poi - GetPriceItem.Price
                        MySQL.Async.execute('UPDATE `users` SET `coins`=@point  WHERE identifier=@identifier', {
                            ['@identifier'] = xPlayer.getIdentifier(),
                            ['@point'] = npoint
                        }, function(rowsChange)
                            if GetPriceItem.Type == "vehicule" then
                                TriggerClientEvent('sBoutique:GiveVehicule', _source, GetPriceItem.Name)
                            elseif GetPriceItem.Type == "weapon" then
                                xPlayer.addWeapon(GetPriceItem.Name, GetPriceItem.Number)
                                TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                            elseif GetPriceItem.Type == "item" then
                                xPlayer.addInventoryItem(GetPriceItem.Name, GetPriceItem.Number)
                                TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                            elseif GetPriceItem.Type == "money" then
                                xPlayer.addAccountMoney('bank', GetPriceItem.Number)
                                TriggerClientEvent('esx:showAdvancedNotification', _source, Config.ShopName, '', 'Merci pour ton achat !\nTu a recu: '..GetPriceItem.Label, "CHAR_BANK_FLEECA", 3)
                            end
                        end)
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


function GetItemPrice(name, type)
    if type == "Promotion" then
        if Config.PromotionName == name then
            return {
                Type = Config.PromotionType,
                Name = Config.PromotionName,
                Label = Config.PromotionLabelName,
                Price = Config.PromotionCoinsAfterReduction,
                Number = Config.PromotionNumber
            }
        end
    end
    if type == "Popular" then
        for i, Popular in ipairs(Config.PopularSection) do
            if Popular.Name == name then
                return {
                    Type = Popular.Type,
                    Name = Popular.Name,
                    Label = Popular.LabelName,
                    Price = Popular.Point,
                    Number = Popular.Number
                }
            end
        end
    end
    if type == "VehiculeSection" then
        for i, vehicle in ipairs(Config.VehiculeSection) do
            if vehicle.Name == name then
                return {
                    Type = vehicle.Type,
                    Name = vehicle.Name,
                    Label = vehicle.LabelName,
                    Price = vehicle.Point,
                    Number = vehicle.Number
                }
            end
        end
    end
    if type == "WeaponSection" then
        for i, vehicle in ipairs(Config.WeaponSection) do
            if vehicle.Name == name then
                return {
                    Type = vehicle.Type,
                    Name = vehicle.Name,
                    Label = vehicle.LabelName,
                    Price = vehicle.Point,
                    Number = vehicle.Number
                }
            end
        end
    end
    if type == "MoneySection" then
        for i, vehicle in ipairs(Config.MoneySection) do
            if vehicle.Name == name then
                return {
                    Type = vehicle.Type,
                    Name = vehicle.Name,
                    Label = vehicle.LabelName,
                    Price = vehicle.Point,
                    Number = vehicle.Number
                }
            end
        end
    end
    return nil
end

