Config = {}
--
-- ██████╗░░█████╗░██╗░░░██╗████████╗██╗░██████╗░██╗░░░██╗███████╗
-- ██╔══██╗██╔══██╗██║░░░██║╚══██╔══╝██║██╔═══██╗██║░░░██║██╔════╝
-- ██████╦╝██║░░██║██║░░░██║░░░██║░░░██║██║██╗██║██║░░░██║█████╗░░
-- ██╔══██╗██║░░██║██║░░░██║░░░██║░░░██║╚██████╔╝██║░░░██║██╔══╝░░
-- ██████╦╝╚█████╔╝╚██████╔╝░░░██║░░░██║░╚═██╔═╝░╚██████╔╝███████╗
-- ╚═════╝░░╚════╝░░╚═════╝░░░░╚═╝░░░╚═╝░░░╚═╝░░░░╚═════╝░╚══════╝

Config.EsxNews = true                                                               -- Si vous utiliser les dernieres version ESX, veuillez mettre true
Config.Language = 'fr'                                                              -- Prend en charge (fr, en, es, de, zh) mais vous pouvez ajouter votre langue
Config.OpenKey = "F1"                                                               -- Touche pour ouvrir la boutique
Config.WebhookDiscord = "https://discord.com/api/webhooks/1101033663417823303/Dkl-D7keunR7hSjehb9PXpfATCcNupoiMyzR9pmrmTqLUC56ImkQNx6pKQCcfD3p0Dfm"
Config.MessageDropCheater = "La triche, c'est mal ;)"                               -- Message d'expultion pour les tricheurs !

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
        Name = "adder",                                                             -- Nom de spawn
        LabelName = "Adder",                                                        -- Nom a afficher dans le menu
        ImageName = "img/adder.jpg",                                                -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 7000                                                                -- Prix d'achat en coins
    },{
        Type = "weapon",
        Number = 1, 
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "img/carbonizzare.jpg",
        Point = 10000
    },{
        Type = "weapon",
        Number = 1, 
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "img/comet2.jpg",
        Point = 15000
    },{
        Type = "weapon",
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


--░█████╗░██████╗░███╗░░░███╗██╗███╗░░██╗
--██╔══██╗██╔══██╗████╗░████║██║████╗░██║
--███████║██║░░██║██╔████╔██║██║██╔██╗██║
--██╔══██║██║░░██║██║╚██╔╝██║██║██║╚████║
--██║░░██║██████╔╝██║░╚═╝░██║██║██║░╚███║
--╚═╝░░╚═╝╚═════╝░╚═╝░░░░░╚═╝╚═╝╚═╝░░╚══╝

Config.EnableAdminPanel = true
Config.AdminPerms = { "licence:75956d95858927d2994fab238d77b5cb43916e21", "licence:id" }
Config.EnableTebexAPI = true