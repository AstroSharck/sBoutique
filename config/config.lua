Config = {}
--
-- ██████╗░░█████╗░██╗░░░██╗████████╗██╗░██████╗░██╗░░░██╗███████╗
-- ██╔══██╗██╔══██╗██║░░░██║╚══██╔══╝██║██╔═══██╗██║░░░██║██╔════╝
-- ██████╦╝██║░░██║██║░░░██║░░░██║░░░██║██║██╗██║██║░░░██║█████╗░░
-- ██╔══██╗██║░░██║██║░░░██║░░░██║░░░██║╚██████╔╝██║░░░██║██╔══╝░░
-- ██████╦╝╚█████╔╝╚██████╔╝░░░██║░░░██║░╚═██╔═╝░╚██████╔╝███████╗
-- ╚═════╝░░╚════╝░░╚═════╝░░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝

Config.EsxNews = true                                                               -- Si vous utiliser les dernieres version ESX, veuillez mettre true
Config.OpenKey = "F1"                                                               -- Touche pour ouvrir la boutique
Config.MessageDropCheater = "La triche, c'est mal ;)"                               -- Message d'expultion pour les tricheurs !

------------------------------------------------------------------------------------------------------------------------------------


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

Config.VehiculeCategory  = true                                                     -- Nom de la page Voiture
Config.WeaponCategory = true                                                        -- Nom de la page Arme
Config.MoneyCategory = true                                                         -- Nom de la page Argent

Config.TestingVehiculePOS = vector4(-899.62, -3298.74, 13.94, 58.0)                 -- Position d'apparation pour tester une voiture
Config.TestingVehiculeTimer = 30                                                    -- Temps pour tester la voiture



-- ██████╗░██████╗░░█████╗░███╗░░░███╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
-- ██╔══██╗██╔══██╗██╔══██╗████╗░████║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
-- ██████╔╝██████╔╝██║░░██║██╔████╔██║██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║
-- ██╔═══╝░██╔══██╗██║░░██║██║╚██╔╝██║██║░░██║░░░██║░░░██║██║░░██║██║╚████║
-- ██║░░░░░██║░░██║╚█████╔╝██║░╚═╝░██║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
-- ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝



Config.PromotionType = "vehicule"                                                   -- Type: vehicule, weapon, item, money, black_money
Config.PromotionNumber = 1                                                          -- Nombre: Le nombre d'item à donner au joueur
Config.PromotionName = "comet3"                                                     -- Nom de spawn
Config.PromotionLabelName = "Comet S2"                                              -- Nom a afficher dans le menu
Config.PromotionImageName = "img/comet.png"                                             -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 620x290
Config.PromotionCoinsbBeforeReduction = 500                                         -- Prix avant réduction
Config.PromotionCoinsAfterReduction = 200                                           -- prix apres réduction



-- ██████╗░░█████╗░██████╗░██╗░░░██╗██╗░░░░░░█████╗░██████╗░
-- ██╔══██╗██╔══██╗██╔══██╗██║░░░██║██║░░░░░██╔══██╗██╔══██╗
-- ██████╔╝██║░░██║██████╔╝██║░░░██║██║░░░░░███████║██████╔╝
-- ██╔═══╝░██║░░██║██╔═══╝░██║░░░██║██║░░░░░██╔══██║██╔══██╗
-- ██║░░░░░╚█████╔╝██║░░░░░╚██████╔╝███████╗██║░░██║██║░░██║
-- ╚═╝░░░░░░╚════╝░╚═╝░░░░░░╚═════╝░╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝

Config.PopularSection = {
    {
        Type = "vehicule",                                                            -- Type: vehicule, weapon, item, money, black_money
        Number = 1,                                                                 -- Number: Le nombre d'item à donner au joueur
        Name = "adder",                                                            -- Nom de spawn
        LabelName = "Adder",                                                        -- Nom a afficher dans le menu
        ImageName = "https://forum.cfx.re/uploads/default/original/4X/a/3/5/a3532ff216882befed84613dd8d31be4e5e88099.gif",                                                    -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 10                                                                  -- Prix d'achat en coins
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
        Point = 13000
    },{
        Type = "vehicule",
        Number = 1,
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "img/comet6.jpg",
        Point = 1500
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
    },{
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
    }
}


Config.WeaponSection = {
    {
        Type = "weapon",                                                            -- Type: vehicule, weapon, item, money, black_money
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
