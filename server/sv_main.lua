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

RegisterServerEvent("sBoutique:GetReviews")
AddEventHandler("sBoutique:GetReviews", function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM shop_reviews', {}, function(data)
        local IsAdmin = CheckAdmin(xPlayer.getIdentifier())
        TriggerClientEvent('sBoutique:GetReviewsClient', _source, data, IsAdmin)
    end)
end)


--[[ Buy item ]]
RegisterServerEvent("sBoutique:BuyItem")
AddEventHandler("sBoutique:BuyItem", function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local GetPriceItem = GetItemPrice(data.ItemName, data.Location)
    if GetPriceItem == nil then
        CheatDetect(xPlayer, 'The player attempted to change the reward')
        return
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
                            InsertHistory(xPlayer.getIdentifier(), xPlayer.getName(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('buy_success'), GetPriceItem.Label))
                        elseif GetPriceItem.Type == "weapon" then
                            xPlayer.addWeapon(GetPriceItem.Name, GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), xPlayer.getName(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('buy_success'), GetPriceItem.Label))
                        elseif GetPriceItem.Type == "item" then
                            xPlayer.addInventoryItem(GetPriceItem.Name, GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), xPlayer.getName(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('buy_success'), GetPriceItem.Label))
                        elseif GetPriceItem.Type == "money" then
                            xPlayer.addAccountMoney('bank', GetPriceItem.Number)
                            InsertHistory(xPlayer.getIdentifier(), xPlayer.getName(), GetPriceItem.Label, GetPriceItem.Price, DisplayDate())
                            SendWebHook('sBoutique', 26551, xPlayer.getName()..' a effectué un achat dans la boutique.\n\nArticle: **'..GetPriceItem.Label..'**\n'..'Prix: **'..GetPriceItem.Price..'**')
                            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('buy_success'), GetPriceItem.Label))
                        end
                    end)
                else
                    TriggerClientEvent('sBoutique:SendNotify', _source, "Error", string.format(Translate('buy_failure'), Config.CoinsName))
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
        end)
    end
end)

RegisterServerEvent('sBoutique:AddReview')
AddEventHandler('sBoutique:AddReview', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
        InsertReview(xPlayer.getIdentifier(), xPlayer.getName(), data.Review_Text, data.Star, DisplayDate())
    end
end)

RegisterServerEvent('sBoutique:DelReview')
AddEventHandler('sBoutique:DelReview', function(data)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
	if xPlayer ~= nil then
        MySQL.Async.execute('DELETE FROM shop_reviews WHERE id = @id', {
            ['@id'] = data.Id
        }, function(data1)
            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", Translate('review_delete'))
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


RegisterServerEvent('sBoutique:GetTebexDetails')
AddEventHandler('sBoutique:GetTebexDetails', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local IsAdmin = CheckAdmin(xPlayer.getIdentifier())

    if not Config.EnableAdminPanel then return end

    if Config.EnableTebexAPI then
        local Data = {}
        local FetchInformationTebex = GetPayementTebex(function(response)
            TriggerClientEvent('sBoutique:GetTebexDetailsClient', _source, response)
        end)
    end
end)


RegisterServerEvent('sBoutique:CheckAdmin')
AddEventHandler('sBoutique:CheckAdmin', function()
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(source)
    local IsAdmin = CheckAdmin(xPlayer.getIdentifier())
    if not IsAdmin then return end
    if not Config.EnableAdminPanel then return end

    local data = {}
    local total = 0
    local FetchInformationTebex = GetPayementTebex(function(response)
        for _, price in ipairs(response) do
            total = total + price.amount
        end
        local TotalPrice = math.floor(total * 100 + 0.5) / 100
        MySQL.Async.fetchAll('SELECT * FROM shop_history', {}, function(responseSql)
            data = { ['TotalAmount'] = TotalPrice, ['TransactionsTebex'] = response, ['TrasactionInGame'] = responseSql }
            TriggerClientEvent('sBoutique:CheckAdminClient', _source, data)
        end)
    end)
end)


RegisterCommand("giveid", function(source, args, raw)
    local _source = source
    local id = args[1]
    local point = args[2]

    if not CheckPlayerId(id) then 
        if source == 0 then return print(Translate('no_player_id')) end
        return TriggerClientEvent('sBoutique:SendNotify', _source, "Error", Translate('no_player_id'))
    end

    local xPlayer = ESX.GetPlayerFromId(id)
    if source == 0 then 
        UpdatePointByID(xPlayer, point)
        print(string.format(Translate('give_id_coins_message'), point, Config.CoinsName, xPlayer.getName()))
        TriggerClientEvent('sBoutique:SendNotify', id, "Success", string.format(Translate('receive_coins_message'), point, Config.CoinsName))
    else
        local IsAdmin = CheckAdmin(xPlayer.getIdentifier())
        if not IsAdmin then return TriggerClientEvent('sBoutique:SendNotify', _source, "Error", Translate('no_permissions')) end
        UpdatePointByID(xPlayer, point)
        TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('give_id_coins_message'), point, Config.CoinsName, xPlayer.getName()))
        TriggerClientEvent('sBoutique:SendNotify', id, "Success", string.format(Translate('receive_coins_message'), point, Config.CoinsName))
    end
end, false)

RegisterCommand("giveidboutique", function(source, args, raw)
    local _source = source
    local code    = args[1]
    local point = args[2]
    local xPlayer = ESX.GetPlayerFromId(source)

    if source == 0 then
        UpdatePointByCode(code, point, source)
    else
        local IsAdmin = CheckAdmin(xPlayer.getIdentifier())
        if not IsAdmin then return TriggerClientEvent('sBoutique:SendNotify', _source, "Error", Translate('no_permissions')) end
        UpdatePointByCode(code, point, source)
    end
end, false)