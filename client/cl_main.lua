ESX = nil
SavePOS = nil
OpenNUI = false
FirstOpen = true

if Config.EsxNews then
    ESX = exports["es_extended"]:getSharedObject()
else
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            Citizen.Wait(0)
        end
    end)
end

Citizen.CreateThread(function()
    ESX.TriggerServerCallback('sBoutique:GetCodeBoutique', function(thecode)
        Code = thecode
    end)
end)

RegisterNUICallback('TestVehicule', function(data)
    Display(false)
    SavePOS = GetEntityCoords(PlayerPedId())
    SpawnCar(data.carName)
end)

RegisterNUICallback('exit', function(data)
    Display(false)
end)

RegisterCommand('OpenBoutique', function()
    Display(true)
end)

RegisterKeyMapping('OpenBoutique', 'Boutique', 'keyboard', Config.OpenKey)

--[[ Function ]]

function SpawnCar(car)
    local car = GetHashKey(car)
    local Position = Config.TestingVehiculePOS
    print(json.encode(Position))
    RequestModel(car)
    while not HasModelLoaded(car) do
        RequestModel(car)
        Citizen.Wait(0)
    end
    local x, y, z = table.unpack(GetEntityCoords(GetPlayerPed(-1), false))
    local vehicle = CreateVehicle(car, Position.x, Position.y, Position.z, Position.w, true, false)
    SetEntityAsMissionEntity(vehicle, true, true)
    SetPedIntoVehicle(GetPlayerPed(-1), vehicle, -1)
    SetVehicleDoorsLocked(vehicle, 4)
    ESX.ShowNotification("Vous avez " .. tostring(Config.TestingVehiculeTimer) .. " secondes pour tester le véhicule.")
    local timer = Config.TestingVehiculeTimer
    local breakable = false
    breakable = false
    while not breakable do
        Wait(1000)
        timer = timer - 1
        if timer == 15 then
            ESX.ShowNotification("Il vous reste plus que 15 secondes.")
        end
        if timer == 10 then
            ESX.ShowNotification("Il vous reste plus que 10 secondes.")
        end
        if timer == 5 then
            ESX.ShowNotification("Il vous reste plus que 5 secondes.")
        end
        if timer <= 0 then
            local veh, dist4 = ESX.Game.GetClosestVehicle(playerCoords)
            DeleteEntity(vehicle)
            ESX.ShowNotification("~r~Vous avez terminé la période d'essai.")
            SetEntityCoords(PlayerPedId(), SavePOS)
            breakable = true
            break
        end
    end
end






function Display(Open)
    if Open then
        SetNuiFocus(true, true)
        if FirstOpen then
            FirstOpen = false
            SendNUIMessage({
                Open = true,
                Data = {
                    ['Playername'] = GetPlayerName(PlayerId()),
                    ['CodeShop'] = Code,
                    ['ShopInfo'] = {
                        ['ShopName'] = Config.ShopName,
                        ['CoinsName'] = Config.CoinsName,
                        ['ImageName'] = Config.ImageName,
    
                        ['HomeNameCat'] = Config.HomeNameCat,
                        ['VehiculeNameCat'] = Config.VehiculeNameCat,
                        ['WeaponNameCat'] = Config.WeaponNameCat,
                        ['MoneyNameCat'] = Config.MoneyNameCat,
                        
                    },
                    ['PromoSection'] = {
                        ['PromotionType'] = Config.PromotionType,
                        ['PromotionName'] = Config.PromotionName,
                        ['PromotionLabelName'] = Config.PromotionLabelName,
                        ['PromotionImageName'] = Config.PromotionImageName,
                        ['PromotionCoinsbBeforeReduction'] = Config.PromotionCoinsbBeforeReduction,
                        ['PromotionCoinsAfterReduction'] = Config.PromotionCoinsAfterReduction
                    },
                    ['PopularSection'] = Config.PopularSection
                },
            })
        else
            SendNUIMessage({Open = true})
        end
    else
        SetNuiFocus(false, false)
        SendNUIMessage({
            Open = false
        })
    end
end