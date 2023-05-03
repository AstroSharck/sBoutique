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


RegisterNetEvent('sBoutique:CheckAdminClient')
AddEventHandler('sBoutique:CheckAdminClient', function(Data)
    SendNUIMessage({
        AdminData = Data
    })
end)


RegisterNetEvent('sBoutique:GetPointsAndCodeClient')
AddEventHandler('sBoutique:GetPointsAndCodeClient', function(Coins, Code)
    SendNUIMessage({
        PointsAndCode = {
            ['Coins'] = Coins,
            ['Code'] = Code,
            ['your_code'] = Translate('your_code'),
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

RegisterNetEvent('sBoutique:GetReviewsClient')
AddEventHandler('sBoutique:GetReviewsClient', function(Data, IsAdmin)
    SendNUIMessage({
        Reviews = Data,
        IsAdmin = IsAdmin
    })
end)

RegisterNetEvent('sBoutique:SendNotify')
AddEventHandler('sBoutique:SendNotify', function(Type, Item)
    SendNotify(Type, Item)
end)

RegisterNetEvent('sBoutique:GiveVehicule')
AddEventHandler('sBoutique:GiveVehicule', function(Model)
    GiveVehicule(Model)
end)

RegisterNetEvent('sBoutique:GetTebexDetailsClient')
AddEventHandler('sBoutique:GetTebexDetailsClient', function(Info, Package)
    SendNUIMessage({
        InfoPack = {
            ['Data'] = Info,
        },
        Details = {
            ['Translate'] = {
                ['Buy'] = Translate('paid_button'),
            }
        }
    })
end)






RegisterNUICallback('CheckAdmin', function(data)
    TriggerServerEvent('sBoutique:CheckAdmin')
end)

RegisterNUICallback('GiveCoinsById', function(data)
    ExecuteCommand('giveid '..data.id..' '..data.amount)
end)

RegisterNUICallback('GiveCoinsByCode', function(data)
    ExecuteCommand('giveidboutique '..data.code..' '..data.amount)
end)

RegisterNUICallback('GetReviews', function(data)
    TriggerServerEvent('sBoutique:GetReviews')
end)

RegisterNUICallback('AddReview', function(data)
    TriggerServerEvent('sBoutique:AddReview', data)
    Display(false)
end)

RegisterNUICallback('DelReview', function(data)
    TriggerServerEvent('sBoutique:DelReview', data)
    Display(false)
end)

RegisterNUICallback('GetPointsAndCode', function(data)
    TriggerServerEvent('sBoutique:GetPointsAndCode')
end)

RegisterNUICallback('GetHistory', function(data)
    TriggerServerEvent('sBoutique:GetHistory')
end)

RegisterNUICallback('TestVehicule', function(data)
    Display(false)
    SavePOS = GetEntityCoords(PlayerPedId())
    print(data.carName)
    SpawnCar(data.carName)
end)

RegisterNUICallback('BuyItem', function(data)
    TriggerServerEvent('sBoutique:BuyItem', data)
    Display(false)
end)

RegisterNUICallback('Exit', function(data)
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
                        ['TebexCategory'] = Config.TebexCategory
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
                    ['PackTebex'] = Config.TebexPackage,
                    ['Translate'] = {
                        buy_package_signe = Translate('buy_package_signe'),
                        your_balance = Translate('your_balance'),
                        tebex_message = Translate('tebex_message'),
                        special_offer = Translate('special_offer'),
                        popular = Translate('popular'),
                        try_button = Translate('try_button'),
                        paid_button = Translate('paid_button'),
                        add_reniew = Translate('add_reniew'),

                        main_menu_title = Translate('main_menu_title'),
                        home_menu = Translate('home_menu'),
                        vehicle_menu = Translate('vehicle_menu'),
                        weapon_menu = Translate('weapon_menu'),
                        money_menu = Translate('money_menu'),
                        history_menu = Translate('history_menu'),

                        sub_menu_title = Translate('sub_menu_title'),
                        tebex_menu = Translate('tebex_menu'),
                        reviews_menu = Translate('reviews_menu'),
                        admin_menu = Translate('admin_menu'),

                        review_title = Translate('review_title'),
                        describe_placeholder = Translate('describe_placeholder'),
                        valid_button = Translate('valid_button'),

                        no_data = Translate('no_data'),
                    }
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