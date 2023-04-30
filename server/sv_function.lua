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

function InsertHistory(identifier, item, price, date)
    local _source = source
    MySQL.Async.execute('INSERT INTO shop_history (identifier, item, price, date) VALUES (@identifier, @item, @price, @date)', {
            ['@identifier'] = identifier,
            ['@item'] = item,
            ['@price'] = price,
            ['@date'] = date
    }, function()
        
    end)
end

function InsertReview(identifier, name, review, star, date)
    local _source = source
    MySQL.Async.execute('INSERT INTO shop_reviews (identifier, name, review, star, date) VALUES (@identifier, @name, @review, @star, @date)', {
        ['@identifier'] = identifier,
        ['@name'] = name,
        ['@review'] = review,
        ['@star'] = star,
        ['@date'] = date
    }, function()
        TriggerClientEvent('sBoutique:ReviewMessage', _source)
    end)
end

function SendWebHook(title, color, message)
    local embedMsg = {}
    embedMsg = {
        {
            ["color"] = color,
            ["title"] = title,
            ["description"] =  ""..message.."",
            ["footer"] ={
                ["text"] = DisplayDate().." | (Heure du serveur)",
            },
        }
    }
    PerformHttpRequest(Config.WebhookDiscord,
    function(err, text, headers)end, 'POST', json.encode({username = Config.ShopName, embeds = embedMsg}), { ['Content-Type']= 'application/json' })
end


function DisplayDate()
    local date = os.date("*t")
    local formattedDate = string.format("%02d/%02d/%d | %02d:%02d", date.day, date.month, date.year, date.hour, date.min)
    return formattedDate
end

function CheckAdmin(Identifier)
    for _, element in ipairs(Config.AdminPerms) do
        if element == Identifier then
            return true
        else
            return false
        end
    end
end

function GetInformationTebex(callback)
    local TebexKey = GetConvar("sv_tebexSecret", nil)
    PerformHttpRequest('https://plugin.tebex.io/information', function(statusCode, responseBody, headers)
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

function Translate(key)
    local translation = translations[Config.Language][key]
    if not translation then
       return key
    end
    return translation
 end