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
    MySQL.Async.execute(
        'INSERT INTO shop_history (identifier, item, price, date) VALUES (@identifier, @item, @price, @date)', {
            ['@identifier'] = identifier,
            ['@item'] = item,
            ['@price'] = price,
            ['@date'] = date
        }, function()
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
    local formattedDate = string.format("%02d/%02d/%d à %02d:%02d", date.day, date.month, date.year, date.hour, date.min)
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



function GetPayementTebex()
    if Config.EnableTebexAPI then
        local TebexKey = GetConvar("sv_tebexSecret", nil)
        PerformHttpRequest('https://plugin.tebex.io/payments', function(statusCode, responseBody, headers)
            if statusCode == 200 then
                return responseBody
            else
                return error('TebexKey is not valid')
            end
        end, 'GET', '', {
            ['X-Tebex-Secret'] = TebexKey
        })
    end
    return nil
end

function GetPackageTebex()
    if Config.EnableTebexAPI then
        if Config.TebexFetchPackage then
            local TebexKey = GetConvar("sv_tebexSecret", nil)
            PerformHttpRequest('https://plugin.tebex.io/packages', function(statusCode, responseBody, headers)
                if statusCode == 200 then
                    return responseBody
                else
                    return error('TebexKey is not valid')
                end
            end, 'GET', '', {
                ['X-Tebex-Secret'] = TebexKey
            })
        end
        return nil
    end
    return nil
end

