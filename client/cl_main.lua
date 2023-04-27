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


RegisterNetEvent('sBoutique:GetPointsAndCodeClient')
AddEventHandler('sBoutique:GetPointsAndCodeClient', function(Coins, Code)
    SendNUIMessage({
        PointsAndCode = {
            ['Coins'] = Coins,
            ['Code'] = Code
        }
    })
end)

RegisterNetEvent('sBoutique:GetHistoryClient')
AddEventHandler('sBoutique:GetHistoryClient', function(Data, Logo)
    SendNUIMessage({
        History = {
            ['Data'] = Data,
            ['LogoCoins'] = Logo
        }
    })
end)

RegisterNetEvent('sBoutique:GiveVehicule')
AddEventHandler('sBoutique:GiveVehicule', function(Model)
    GiveVehicule(Model)
end)



RegisterNUICallback('GetPointsAndCode', function(data)
    TriggerServerEvent('sBoutique:GetPointsAndCode')
end)

RegisterNUICallback('GetHistory', function(data)
    TriggerServerEvent('sBoutique:GetHistory')
end)

RegisterNUICallback('GetAdminDetails', function(data)
    TriggerServerEvent('sBoutique:GetAdminDetails')
end)

RegisterNUICallback('TestVehicule', function(data)
    Display(false)
    SavePOS = GetEntityCoords(PlayerPedId())
    print(data.carName)
    SpawnCar(data.carName)
end)

RegisterNUICallback('BuyItem', function(data)
    Display(false)
    TriggerServerEvent('sBoutique:BuyItem', data)
end)

RegisterNUICallback('exit', function(data)
    Display(false)
end)




RegisterCommand('OpenBoutique', function()
    Display(true)
end)

RegisterKeyMapping('OpenBoutique', 'Boutique', 'keyboard', Config.OpenKey)

--[[ Function ]]

function Display(Open)
    if Open then
        SetNuiFocus(true, true)
        if FirstOpen then
            FirstOpen = false
            SendNUIMessage({
                Open = true,
                Data = {
                    ['Playername'] = GetPlayerName(PlayerId()),
                    ['ShopInfo'] = {
                        ['ShopName'] = Config.ShopName,
                        ['CoinsName'] = Config.CoinsName,
                        ['LogoCoins'] = Config.LogoCoins,
                        ['ImageName'] = Config.ImageName,
    
                        ['VehiculeCategory'] = Config.VehiculeCategory,
                        ['WeaponCategory'] = Config.WeaponCategory,
                        ['MoneyCategory'] = Config.MoneyCategory,
                        
                    },
                    ['PromoSection'] = {
                        ['PromotionType'] = Config.PromotionType,
                        ['PromotionName'] = Config.PromotionName,
                        ['PromotionLabelName'] = Config.PromotionLabelName,
                        ['PromotionImageName'] = Config.PromotionImageName,
                        ['PromotionCoinsbBeforeReduction'] = Config.PromotionCoinsbBeforeReduction,
                        ['PromotionCoinsAfterReduction'] = Config.PromotionCoinsAfterReduction
                    },
                    ['PopularSection'] = Config.PopularSection,
                    ['VehiculeSection'] = Config.VehiculeSection,
                    ['WeaponSection'] = Config.WeaponSection,
                    ['MoneySection'] = Config.MoneySection,
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