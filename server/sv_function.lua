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

function InsertHistory(identifier, name, item, price, date)
    local _source = source
    MySQL.Async.execute(
        'INSERT INTO shop_history (identifier, name, item, price, date) VALUES (@identifier, @name, @item, @price, @date)',
        {
            ['@identifier'] = identifier,
            ['@name'] = name,
            ['@item'] = item,
            ['@price'] = price,
            ['@date'] = date
        }, function()

        end)
end

function InsertReview(identifier, name, review, star, date)
    local _source = source
    MySQL.Async.execute(
        'INSERT INTO shop_reviews (identifier, name, review, star, date) VALUES (@identifier, @name, @review, @star, @date)',
        {
            ['@identifier'] = identifier,
            ['@name'] = name,
            ['@review'] = review,
            ['@star'] = star,
            ['@date'] = date
        }, function()
            TriggerClientEvent('sBoutique:SendNotify', _source, "Success", Translate('review_post'))
        end)
end

function UpdatePointByID(xPlayer, point)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE identifier=@identifier', {
        ['@identifier'] = xPlayer.getIdentifier()
    }, function(data)
        local poi = data[1].coins
        npoint = poi + point

        MySQL.Async.execute('UPDATE `users` SET `coins`=@point  WHERE identifier=@identifier', {
            ['@identifier'] = xPlayer.getIdentifier(),
            ['@point'] = npoint
        }, function(rowsChange)

        end)
    end)
end

function UpdatePointByCode(Code, Point, source)
    MySQL.Async.fetchAll('SELECT * FROM users WHERE boutique_id=@code', {
        ['@code'] = Code
    }, function(data)
        if #data == 0 then 
            if source == 0 then return print(Translate('no_player_code')) end
            return TriggerClientEvent('sBoutique:SendNotify', source, "Error", Translate('no_player_code'))
        end
        local poi = data[1].coins
        local identifier = data[1].identifier
        npoint = poi + Point
        MySQL.Async.execute('UPDATE `users` SET `coins`=@point  WHERE boutique_id=@code', {
            ['@code'] = Code,
            ['@point'] = npoint
        }, function(rowsChange)
            local _source = source
            local xPlayer = ESX.GetPlayerFromIdentifier(identifier)
            if xPlayer ~= nil then 
                TriggerClientEvent('sBoutique:SendNotify', xPlayer.source, "Success", string.format(Translate('receive_coins_message'), Point, Config.CoinsName))
            end
            if source == 0 then 
                print(string.format(Translate('give_code_coins_message'), Point, Config.CoinsName, Code))
            else
                TriggerClientEvent('sBoutique:SendNotify', _source, "Success", string.format(Translate('give_code_coins_message'), Point, Config.CoinsName, Code))
            end
        end)
    end)
end

function SendWebHook(title, color, message)
    local embedMsg = {}
    embedMsg = {{
        ["color"] = color,
        ["title"] = title,
        ["description"] = "" .. message .. "",
        ["footer"] = {
            ["text"] = DisplayDate() .. " | (Heure du serveur)"
        }
    }}
    PerformHttpRequest(Config.WebhookDiscord, function(err, text, headers)
    end, 'POST', json.encode({
        username = Config.ShopName,
        embeds = embedMsg
    }), {
        ['Content-Type'] = 'application/json'
    })
end

function DisplayDate()
    local date = os.date("*t")
    local formattedDate =
        string.format("%02d/%02d/%d | %02d:%02d", date.day, date.month, date.year, date.hour, date.min)
    return formattedDate
end

function CheckAdmin(Identifier)
    for _, element in ipairs(Config.AdminPerms) do
        if element == "license:" .. Identifier or element == Identifier then
            return true
        end
    end
    return false
end

function IsLicensePresent(license)
    for _, player in ipairs(GetPlayers()) do
        local identifiers = GetPlayerIdentifiers(player)
        for _, identifier in ipairs(identifiers) do
            if identifier == "license:" .. license then
                return true
            end
        end
    end
    return false
end

function GetPayementTebex(callback)
    local TebexKey = GetConvar("sv_tebexSecret", nil)
    PerformHttpRequest('https://plugin.tebex.io/payments', function(statusCode, responseBody, headers)
        if statusCode == 200 then
            local decode = json.decode(responseBody)
            callback(decode)
        else
            callback(nil)
        end
    end, 'GET', '', {
        ['X-Tebex-Secret'] = TebexKey
    })
end

function CheckPlayerId(playerId)
    for _, id in ipairs(GetPlayerIdentifiers(playerId)) do
        if id then
            return true
        end
    end
    return false
end

function Translate(key)
    local translation = translations[Config.Language][key]
    if not translation then
        return key
    end
    return translation
end
