Config = {}
--
-- ██████╗░░█████╗░██╗░░░██╗████████╗██╗░██████╗░██╗░░░██╗███████╗
-- ██╔══██╗██╔══██╗██║░░░██║╚══██╔══╝██║██╔═══██╗██║░░░██║██╔════╝
-- ██████╦╝██║░░██║██║░░░██║░░░██║░░░██║██║██╗██║██║░░░██║█████╗░░
-- ██╔══██╗██║░░██║██║░░░██║░░░██║░░░██║╚██████╔╝██║░░░██║██╔══╝░░
-- ██████╦╝╚█████╔╝╚██████╔╝░░░██║░░░██║░╚═██╔═╝░╚██████╔╝███████╗
-- ╚═════╝░░╚════╝░░╚═════╝░░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝

-- Faire la trad panel admin

Config.EsxNews = true                                                               -- Si vous utiliser les dernieres version ESX, veuillez mettre true
Config.Language = 'fr'                                                              -- Prend en charge (fr, en, es, de, zh) mais vous pouvez ajouter votre langue
Config.OpenKey = "F1"                                                               -- Touche pour ouvrir la boutique
Config.WebhookDiscord = "https://discord.com/api/webhooks/1101033663417823303/Dkl-D7keunR7hSjehb9PXpfATCcNupoiMyzR9pmrmTqLUC56ImkQNx6pKQCcfD3p0Dfm"

--##################################################################################################################################

-- AVANT DE COMMENCER LA CONFIGURATION DE LA BOUTIQUE, MERCI DE LIRE LA DOCS ➜ https://docs.astro-development.com/fivem/sboutique-nui

--##################################################################################################################################


-- ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
-- ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
-- ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
-- ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
-- ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
-- ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝


Config.ShopName = "AstroShop"                                                       -- Nom de la boutique
Config.CoinsName = "AstroCoins"                                                     -- Nom de la money
Config.LogoCoins = "https://cdn-icons-png.flaticon.com/512/1369/1369860.png"        -- Logo de la money
Config.ImageName = "https://i.postimg.cc/DywwGz04/astro.gif"                        -- Nom de l'image (Prend en charge: PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 500x500

Config.VehiculeCategory  = true                                                     -- Afficher au non la catégorie Vehicule
Config.WeaponCategory = true                                                        -- Afficher au non la catégorie Arme
Config.MoneyCategory = true                                                         -- Afficher au non la catégorie Argent
Config.TebexCategory = true                                                         -- Afficher au non la catégorie Tebex

Config.TestingVehiculePOS = vector4(-899.62, -3298.74, 13.94, 58.0)                 -- Position d'apparation pour tester une voiture
Config.TestingVehiculeTimer = 30                                                    -- Temps pour tester la voiture




--███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
--██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
--█████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║
--██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║
--██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
--╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

function CheatDetect(xPlayer, Message)
    print(xPlayer.getName()..": "..Message)
    --[[ DropPlayer(source, 'La triche, c\'est mal ;)') ]]
    -- Vous pouvez aussi ajouter un export pour bannir la personne !
end

function SendNotify(Type, Message, Timer)
    if Type == "Success" then
        exports['sCore']:SendAlert(Message, "Success", Timer and Timer or '5000')
        -- exports['okokNotify']:Alert(Config.ShopName, Message, 5000, 'success')
        -- ESX.ShowAdvancedNotification(Config.ShopName, '', Message, "CHAR_BANK_FLEECA", 3)
    elseif Type == "Warning" then
        exports['sCore']:SendAlert(Message, "Warning", Timer and Timer or '5000')
        -- exports['okokNotify']:Alert(Config.ShopName, Message, 5000, 'warning')
        -- ESX.ShowAdvancedNotification(Config.ShopName, '', Message, "CHAR_BANK_FLEECA", 3)
    elseif Type == "Error" then
        exports['sCore']:SendAlert(Message, "Error", Timer and Timer or '5000')
        -- exports['okokNotify']:Alert(Config.ShopName, Message, 5000, 'error')
        -- ESX.ShowAdvancedNotification(Config.ShopName, '', Message, "CHAR_BANK_FLEECA", 3)
    else
        exports['sCore']:SendAlert(Message, "Error", Timer and Timer or '5000')
    end
end




-- ██████╗░██████╗░░█████╗░███╗░░░███╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
-- ██╔══██╗██╔══██╗██╔══██╗████╗░████║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
-- ██████╔╝██████╔╝██║░░██║██╔████╔██║██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║
-- ██╔═══╝░██╔══██╗██║░░██║██║╚██╔╝██║██║░░██║░░░██║░░░██║██║░░██║██║╚████║
-- ██║░░░░░██║░░██║╚█████╔╝██║░╚═╝░██║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
-- ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝

Config.PromotionType = "vehicule"                                                   -- Type: vehicule, weapon, item, money, black_money
Config.PromotionNumber = 1                                                          -- Nombre: Le nombre d'item à donner au joueur
Config.PromotionName = "comet2"                                                     -- Nom de spawn
Config.PromotionLabelName = "Comet S2"                                              -- Nom a afficher dans le menu
Config.PromotionImageName = "img/comet.png"                                         -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 620x290
Config.PromotionCoinsbBeforeReduction = 2000                                        -- Prix avant réduction
Config.PromotionCoinsAfterReduction = 1200                                          -- prix apres réduction




-- ██████╗░░█████╗░██████╗░██╗░░░██╗██╗░░░░░░█████╗░██████╗░
-- ██╔══██╗██╔══██╗██╔══██╗██║░░░██║██║░░░░░██╔══██╗██╔══██╗
-- ██████╔╝██║░░██║██████╔╝██║░░░██║██║░░░░░███████║██████╔╝
-- ██╔═══╝░██║░░██║██╔═══╝░██║░░░██║██║░░░░░██╔══██║██╔══██╗
-- ██║░░░░░╚█████╔╝██║░░░░░╚██████╔╝███████╗██║░░██║██║░░██║
-- ╚═╝░░░░░░╚════╝░╚═╝░░░░░░╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝

Config.PopularSection = {
    {
        Type = "vehicule",                                                          -- Type: vehicule, weapon, item, money, black_money
        Number = 1,                                                                 -- Number: Le nombre d'item à donner au joueur
        Name = "adder",                                                             -- Nom de spawn
        LabelName = "BMX Animé",                                                    -- Nom a afficher dans le menu
        ImageName = "https://gcdnb.pbrd.co/images/jBn7Bukcaul6.gif?o=1",            -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 20000                                                               -- Prix d'achat en coins
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "img/carbonizzare.jpg",
        Point = 5000
    },{
        Type = "vehicule",
        Number = 1,
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "img/comet2.jpg",
        Point = 4500
    },{
        Type = "vehicule",
        Number = 1,
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "img/comet6.jpg",
        Point = 3800
    }
}




-- ██╗░░░██╗███████╗██╗░░██╗██╗░█████╗░██╗░░░░░███████╗░██████╗
-- ██║░░░██║██╔════╝██║░░██║██║██╔══██╗██║░░░░░██╔════╝██╔════╝
-- ╚██╗░██╔╝█████╗░░███████║██║██║░░╚═╝██║░░░░░█████╗░░╚█████╗░
-- ░╚████╔╝░██╔══╝░░██╔══██║██║██║░░██╗██║░░░░░██╔══╝░░░╚═══██╗
-- ░░╚██╔╝░░███████╗██║░░██║██║╚█████╔╝███████╗███████╗██████╔╝
-- ░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░╚════╝░╚══════╝╚══════╝╚═════╝░

Config.VehiculeSection = {
    {
        Type = "vehicule",                                                            -- Type: vehicule, weapon, item, money, black_money
        Number = 1,                                                                 -- Number: Le nombre d'item à donner au joueur
        Name = "adder",                                                             -- Nom de spawn
        LabelName = "Adder",                                                        -- Nom a afficher dans le menu
        ImageName = "img/adder.jpg",                                                    -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 7000                                                                -- Prix d'achat en coins
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "img/carbonizzare.jpg",
        Point = 10000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "img/comet2.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "img/comet6.jpg",
        Point = 15000
    }, {
        Type = "vehicule",
        Number = 1,
        Name = "adder",
        LabelName = "Adder",
        ImageName = "img/adder.jpg",
        Point = 7000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "img/carbonizzare.jpg",
        Point = 10000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "img/comet2.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "img/comet6.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Number = 1,
        Name = "adder",
        LabelName = "Adder",
        ImageName = "img/adder.jpg",
        Point = 7000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "img/carbonizzare.jpg",
        Point = 10000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "img/comet2.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Number = 1, 
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "img/comet6.jpg",
        Point = 15000
    }
}


Config.WeaponSection = {
    {
        Type = "weapon",                                                            -- Type: vehicule, weapon, item, money, black_money
        Number = 1,                                                                 -- Number: Le nombre d'item à donner au joueur
        Name = "weapon_knife",                                                      -- Nom de spawn
        LabelName = "Couteau",                                                      -- Nom a afficher dans le menu
        ImageName = "img/adder.jpg",                                                -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 7000                                                                -- Prix d'achat en coins
    },{
        Type = "weapon",
        Number = 1, 
        Name = "weapon_switchblade",
        LabelName = "Cran d'arret",
        ImageName = "img/carbonizzare.jpg",
        Point = 10000
    },{
        Type = "weapon",
        Number = 200, 
        Name = "weapon_ceramicpistol",
        LabelName = "Pistolet Céramique",
        ImageName = "img/comet2.jpg",
        Point = 15000
    },{
        Type = "weapon",
        Number = 200, 
        Name = "weapon_tacticalrifle",
        LabelName = "Fusil M4",
        ImageName = "img/comet6.jpg",
        Point = 15000
    }
}


Config.MoneySection = {
    {
        Type = "money",                                                             -- Type: vehicule, weapon, item, money, black_money
        Number = 300000,                                                            -- Number: Le nombre d'item à donner au joueur
        Name = "money",                                                             -- Nom de spawn
        LabelName = "300 000$",                                                     -- Nom a afficher dans le menu
        ImageName = "https://i.postimg.cc/mrypYmzj/money.gif",                      -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 1000                                                                -- Prix d'achat en coins
    },{
        Type = "money",
        Number = 500000, 
        Name = "money",
        LabelName = "500 000$",
        ImageName = "https://i.postimg.cc/mrypYmzj/money.gif",
        Point = 1500
    },{
        Type = "money",
        Number = 800000, 
        Name = "money",
        LabelName = "800 000$",
        ImageName = "https://i.postimg.cc/mrypYmzj/money.gif",
        Point = 2000
    },{
        Type = "money",
        Number = 1000000, 
        Name = "money",
        LabelName = "1 000 000$",
        ImageName = "https://i.postimg.cc/mrypYmzj/money.gif",
        Point = 2200
    }
}




--░█████╗░██████╗░███╗░░░███╗██╗███╗░░██╗
--██╔══██╗██╔══██╗████╗░████║██║████╗░██║
--███████║██║░░██║██╔████╔██║██║██╔██╗██║
--██╔══██║██║░░██║██║╚██╔╝██║██║██║╚████║
--██║░░██║██████╔╝██║░╚═╝░██║██║██║░╚███║
--╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝

Config.EnableAdminPanel = true
Config.AdminPerms = { "license:bb994fdc0714e531dcd8ae5ca484d02d1a1c73b7", "license:75956d95858927d2994fab238d77b5cb43916e21" }
Config.EnableTebexAPI = false  -- A faire

Config.TebexPackage = {
    { Title = "Pack Bronze", Image = "https://i.postimg.cc/mrypYmzj/money.gif", Description = "5000 Coins<br>Pas de voiture<br>Role Discord", Price = "4.99€", ButtonName = "Voir", ButtonAction = "https://..." },
    { Title = "Pack Basic", Image = "https://i.postimg.cc/mrypYmzj/money.gif", Description = "10000 Coins<br>Pas de voiture<br>Role Discord", Price = "8.99€", ButtonName = "Voir", ButtonAction = "https://..." },
    { Title = "Pack Or", Image = "https://i.postimg.cc/mrypYmzj/money.gif", Description = "15000 Coins<br>Voiture Boutique<br>Role Discord", Price = "12.99€", ButtonName = "Voir", ButtonAction = "https://..." },
    { Title = "Pack Ultime", Image = "https://i.postimg.cc/mrypYmzj/money.gif", Description = "20000 Coins<br>Voiture Unique<br>Role Discord", Price = "15.99€", ButtonName = "Voir", ButtonAction = "https://..." },
}