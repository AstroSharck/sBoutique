ESX = nil
if Config.EsxNews then
    ESX = exports["es_extended"]:getSharedObject()
else
    Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent('esx:getSharedObject', function(obj)
                ESX = obj
            end)
            Citizen.Wait(0)
        end
    end)
end

---------------------------------------------------------------------------------------------

function SpawnCar(car)
    local car = GetHashKey(car)
    local Position = Config.TestingVehiculePOS
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
    SendNotify('TestingMessageStart')
    local timer = Config.TestingVehiculeTimer
    local breakable = false
    breakable = false
    while not breakable do
        Wait(1000)
        timer = timer - 1
        if timer == 15 then
            SendNotify('TestingMessageTimer', "15")
        end
        if timer == 10 then
            SendNotify('TestingMessageTimer', "10")
        end
        if timer == 5 then
            SendNotify('TestingMessageTimer', "5")
        end
        if timer <= 0 then
            local veh, dist4 = ESX.Game.GetClosestVehicle(playerCoords)
            DeleteEntity(vehicle)
            SendNotify('TestingMessageFinish')
            SetEntityCoords(PlayerPedId(), SavePOS)
            breakable = true
            break
        end
    end
end

---------------------------------------------------------------------------------------------

function GenerateRandomString(length)
    local charset = {}
    for i = 48,  57 do table.insert(charset, string.char(i)) end
    for i = 65,  90 do table.insert(charset, string.char(i)) end
    for i = 97, 122 do table.insert(charset, string.char(i)) end
    local str = ""
    for i = 1, length do
      str = str .. charset[math.random(1, #charset)]
    end
    return str
end

function GeneratePlate()
    local generatedPlate
    local doBreak = false
    while true do
        Citizen.Wait(2)
        math.randomseed(GetGameTimer())
        generatedPlate = GenerateRandomString(8)
        ESX.TriggerServerCallback('sBoutique:CheckPlate', function(isPlateTaken)
            if not isPlateTaken then
                doBreak = true
            end
        end, generatedPlate)
        if doBreak then
            break
        end
    end
    return generatedPlate
end

function GiveVehicule(model)
    local plyCoords = GetEntityCoords(PlayerPedId(), false)
    Citizen.Wait(10)
    ESX.Game.SpawnVehicle(model, vector3(0.0, 0.0, 0.0), 0.0, function(vehicle)
        local playerCoords = GetEntityCoords(PlayerPedId())
        local plate = GeneratePlate()
        local voituregive = {}

        table.insert(voituregive, vehicle)
        local vehicleProps = ESX.Game.GetVehicleProperties(voituregive[#voituregive])
        vehicleProps.plate = string.upper(plate)
        SetVehicleNumberPlateText(voituregive[#voituregive], plate)

        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        SetEntityCoords(vehicle, playerCoords)
        TaskWarpPedIntoVehicle(PlayerPedId(), vehicle, -1)
        DoScreenFadeIn(1000)

        TriggerServerEvent('sBoutique:GiveVehicule', vehicleProps, plate)

    end)
end


function Translate(key)
    local translation = translations[Config.Language][key]
    if not translation then
       -- si la traduction n'existe pas pour la langue donnée, renvoyer la clé elle-même
       return key
    end
    return translation
 end
