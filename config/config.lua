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

------------------------------------------------------------------------------------------------------------------------------------


-- ░██████╗░███████╗███╗░░██╗███████╗██████╗░░█████╗░██╗░░░░░
-- ██╔════╝░██╔════╝████╗░██║██╔════╝██╔══██╗██╔══██╗██║░░░░░
-- ██║░░██╗░█████╗░░██╔██╗██║█████╗░░██████╔╝███████║██║░░░░░
-- ██║░░╚██╗██╔══╝░░██║╚████║██╔══╝░░██╔══██╗██╔══██║██║░░░░░
-- ╚██████╔╝███████╗██║░╚███║███████╗██║░░██║██║░░██║███████╗
-- ░╚═════╝░╚══════╝╚═╝░░╚══╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝


Config.ShopName = "AstroShop"                                                       -- Nom de la boutique
Config.CoinsName = "AstroCoins"                                                     -- Nom de la money
Config.LogoCoins = "AstroFamily.png"                                                -- Logo de la money
Config.ImageName = "AstroFamily.png"                                                -- Nom de l'image (Prend en charge: PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 500x500


Config.HomeNameCat = "Accueil"                                                      -- Nom de la page d'accueil
Config.VehiculeNameCat = "Voiture"                                                  -- Nom de la page Voiture
Config.WeaponNameCat = "Arme"                                                       -- Nom de la page Arme
Config.MoneyNameCat = "Argent"                                                      -- Nom de la page Argent

--[[ { x = -899.62, y = -3298.74, z = 13.94, h = 58.0} ]]  
Config.TestingVehiculePOS = vector4(-899.62, -3298.74, 13.94, 58.0)                 -- Position d'apparation pour tester une voiture
Config.TestingVehiculeTimer = 30                                                    -- Temps pour tester la voiture



-- ██████╗░██████╗░░█████╗░███╗░░░███╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
-- ██╔══██╗██╔══██╗██╔══██╗████╗░████║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
-- ██████╔╝██████╔╝██║░░██║██╔████╔██║██║░░██║░░░██║░░░██║██║░░██║██╔██╗██║
-- ██╔═══╝░██╔══██╗██║░░██║██║╚██╔╝██║██║░░██║░░░██║░░░██║██║░░██║██║╚████║
-- ██║░░░░░██║░░██║╚█████╔╝██║░╚═╝░██║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
-- ╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚═╝░░░░░╚═╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝



Config.PromotionType = "vehicule"                                                   -- Type: vehicule, weapon, item
Config.PromotionName = "comet2"                                                     -- Nom de spawn
Config.PromotionLabelName = "Comet S2"                                              -- Nom a afficher dans le menu
Config.PromotionImageName = "comet.png"                                             -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 620x290
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
        Type = "weapon",                                                            -- Type: vehicule, weapon, item
        Name = "adder",                                                             -- Nom de spawn
        LabelName = "Adder",                                                        -- Nom a afficher dans le menu
        ImageName = "adder.jpg",                                                    -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 15000                                                               -- Prix d'achat en coins
    },{
        Type = "vehicule",
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "carbonizzare.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "comet2.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "comet6.jpg",
        Point = 15000
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
        Type = "weapon",                                                            -- Type: vehicule, weapon, item
        Name = "adder",                                                             -- Nom de spawn
        LabelName = "Adder",                                                        -- Nom a afficher dans le menu
        ImageName = "adder.jpg",                                                    -- Nom de l'image, prend en charge (PNG, JPEG, GIF) ⚠️ Dimension ⚠️: 300x169
        Point = 15000                                                               -- Prix d'achat en coins
    },{
        Type = "vehicule",
        Name = "carbonizzare",
        LabelName = "Carbonizzare",
        ImageName = "carbonizzare.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Name = "comet2",
        LabelName = "Comet S2",
        ImageName = "comet2.jpg",
        Point = 15000
    },{
        Type = "vehicule",
        Name = "comet6",
        LabelName = "Comet S6",
        ImageName = "comet6.jpg",
        Point = 15000
    }
}
