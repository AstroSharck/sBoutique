let directory = GetParentResourceName()
InitShop(false);
var Update = null

window.addEventListener('message', async (event) => {
    if (event.data.Open === true) {
        await InitShop(true, event.data.Data)
    }
    if (event.data.PointsAndCode) {
        $('#Points-Total').text(event.data.PointsAndCode.Coins)
        $('#Code-Shop').html(`${event.data.PointsAndCode.your_code}<br>↓<br>${event.data.PointsAndCode.Code}`)
    }
    if (event.data.History) {
        GetHistoryItem(event.data.History, event.data.History.LogoCoins)
    }
    if (event.data.PackageDetails) {
        GetPackage(event.data.PackageDetails.Data, event.data.InfoDetails.Data, event.data.PackageDetails.Translate)
    }
    if (event.data.Open === false) { InitShop(false); }
})

/* Close Function */
document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post('https://' + directory + '/exit', JSON.stringify({}));
        clearInterval(Update)
        return;
    };
};

/* ------------------------------------------------------------------------------------------------------- */

/* 
██████╗░███████╗░██████╗██╗░██████╗░███╗░░██╗
██╔══██╗██╔════╝██╔════╝██║██╔════╝░████╗░██║
██║░░██║█████╗░░╚█████╗░██║██║░░██╗░██╔██╗██║
██║░░██║██╔══╝░░░╚═══██╗██║██║░░╚██╗██║╚████║
██████╔╝███████╗██████╔╝██║╚██████╔╝██║░╚███║
╚═════╝░╚══════╝╚═════╝░╚═╝░╚═════╝░╚═╝░░╚══╝
 */

$(function () {
    $(".sidebar-link").click(function () {
        $(".sidebar-link").removeClass("is-active");
        var dataId = $(this).attr("data-id");
        $(".home-area, .vehicule-area, .weapon-area, .money-area, .history-area, .tebex-area, .reviews-area, .admin-panel-area").css("display", "none");
        $("." + dataId).css("display", "block");
        $(this).addClass("is-active");
    });
});

$(window).resize(function () {
    if ($(window).width() > 1090) {
        $(".sidebar").removeClass("collapse");
    } else {
        $(".sidebar").addClass("collapse");
    }
}).resize();


/* 
███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
█████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║
██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║
██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝
*/

function InitShop(Open, DataInfo) {
    if (Open) {
        $('.container').show();
        $.post('https://' + directory + '/GetPointsAndCode', JSON.stringify({}));
        $.post('https://' + directory + '/GetHistory', JSON.stringify({}));
        $.post('https://' + directory + '/GetPackageDetails', JSON.stringify({}));
        $.post('https://' + directory + '/GetAdminDetails', JSON.stringify({}));
        if (DataInfo) {
            $('#Playername').text(DataInfo.Playername)

            $('#add_reviews').text(DataInfo.Translate.add_reniew)

            $('.main-header').text(DataInfo.Translate.your_balance)
            $('.main-blog__title').text(DataInfo.Translate.special_offer)
            $('.main-blog__time').text(DataInfo.Translate.tebex_message)
            $('.small-header').text(DataInfo.Translate.popular)

            $('#main-menu-title').text(DataInfo.Translate.main_menu_title)
            $('#home-cat').text(DataInfo.Translate.home_menu)
            $('#car-cat').text(DataInfo.Translate.vehicle_menu)
            $('#weapon-cat').text(DataInfo.Translate.weapon_menu)
            $('#money-cat').text(DataInfo.Translate.money_menu)
            $('#history-cat').text(DataInfo.Translate.history_menu)

            $('#sub-menu-title').text(DataInfo.Translate.sub_menu_title)
            $('#tebex-cat').text(DataInfo.Translate.tebex_menu)
            $('#reviews-cat').text(DataInfo.Translate.reviews_menu)
            $('#admin-panel-cat').text(DataInfo.Translate.admin_menu)
            

            $('.logo-expand').text(DataInfo.ShopInfo.ShopName)
            $("#logo-boutique").html(`<img style="width: 100px;" src="${DataInfo.ShopInfo.ImageName}" alt="Logo">`)
            $('#logo-coins').attr("src", `${DataInfo.ShopInfo.LogoCoins}`)

            if (!DataInfo.ShopInfo.VehiculeCategory) $('#CarCategory').css("display", "none")
            if (!DataInfo.ShopInfo.WeaponCategory) $('#WeaponCategory').css("display", "none")
            if (!DataInfo.ShopInfo.MoneyCategory) $('#MoneyCategory').css("display", "none")
            if (!DataInfo.ShopInfo.TebexCategory) $('#TebexCategory').css("display", "none")

            $('.main-blog+.main-blog').css('background-image', `url('${DataInfo.PromoSection.PromotionImageName}')`);
            $('.Promote-Text-Card').html(`<div> ${DataInfo.PromoSection.PromotionCoinsbBeforeReduction} <span> ➜ </span> ${DataInfo.PromoSection.PromotionCoinsAfterReduction} </div>`)
            $('#Promo-Button').html(`${DataInfo.PromoSection.PromotionType === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + DataInfo.PromoSection.PromotionName + '\')">' + DataInfo.Translate.try_button + '</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${DataInfo.PromoSection.PromotionName}', '${DataInfo.PromoSection.PromotionType}', 'Promotion')">${DataInfo.Translate.paid_button}</button>`)

            if (DataInfo.PopularSection.length > 0) {
                $("#popular-section").html('')
                $("#popular-section").removeClass('center-elements-popular')
                $("#popular-section").addClass('videos')
                DataInfo.PopularSection.forEach(element => {
                    $("#popular-section").append(`<div class="video anim" style="--delay: .4s">
            <div class="video-wrapper">
                <img src="${element.ImageName}">
            </div>
            <center>
                <div class="video-by">${element.LabelName}</div>
                <div class="price-elements">
                    <div  class="user-name">${element.Point}</div>
                </div>
            </center>
            <hr style="width: 80%;">
            <center style="padding-bottom: 10px;">
                ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">' + DataInfo.Translate.try_button + '</button>' : ''}
                <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'Popular')">${DataInfo.Translate.paid_button}</button>
            </center>
            </div>`);
                });
            }
            if (DataInfo.VehiculeSection.length > 0) {
                $("#vehicule-section").html('')
                $("#vehicule-section").removeClass('center-elements')
                $("#vehicule-section").addClass('videos')
                DataInfo.VehiculeSection.forEach(element => {
                    $("#vehicule-section").append(`<div class="video anim" style="--delay: .2s">
            <div class="video-wrapper">
                <img src="${element.ImageName}">
            </div>
            <center>
                <div class="video-by">${element.LabelName}</div>
                <div class="price-elements">
                    <div  class="user-name">${element.Point}</div>
                </div>
            </center>
            <hr style="width: 80%;">
            <center style="padding-bottom: 10px;">
                ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">' + DataInfo.Translate.try_button + '</button>' : ''}
                <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'VehiculeSection')">${DataInfo.Translate.paid_button}</button>
            </center>
            </div>`);
                });
            }

            if (DataInfo.WeaponSection.length > 0) {
                $("#weapon-section").html('')
                $("#weapon-section").removeClass('center-elements')
                $("#weapon-section").addClass('videos')
                DataInfo.WeaponSection.forEach(element => {
                    $("#weapon-section").append(`<div class="video anim" style="--delay: .2s">
            <div class="video-wrapper">
                <img src="${element.ImageName}">
            </div>
            <center>
                <div class="video-by">${element.LabelName}</div>
                <div class="price-elements">
                    <div  class="user-name">${element.Point}</div>
                </div>
            </center>
            <hr style="width: 80%;">
            <center style="padding-bottom: 10px;">
                ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">' + DataInfo.Translate.try_button + '</button>' : ''}
                <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'WeaponSection')">${DataInfo.Translate.paid_button}</button>
            </center>
            </div>`);
                });
            }

            if (DataInfo.MoneySection.length > 0) {
                $("#money-section").html('')
                $("#money-section").removeClass('center-elements')
                $("#money-section").addClass('videos')
                DataInfo.MoneySection.forEach(element => {
                    $("#money-section").append(`<div class="video anim" style="--delay: .2s">
            <div class="video-wrapper">
                <img src="${element.ImageName}" alt"${element.LabelName}" />
            </div>
            <center>
                <div class="video-by">${element.LabelName}</div>
                <div class="price-elements">
                    <div  class="user-name">${element.Point}</div>
                </div>
            </center>
            <hr style="width: 80%;">
            <center style="padding-bottom: 10px;">
                ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">' + DataInfo.Translate.try_button + '</button>' : ''}
                <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'MoneySection')">${DataInfo.Translate.paid_button}</button>
            </center>
            </div>`);
                });
            }

            $('#no-data').text(DataInfo.Translate.no_data)
            setTimeout(function () {
                $(".sidebar").fadeIn('slow');
                $(".wrapper").fadeIn('slow');
            }, 500);
        }
    } else {
        $('.container').hide();
    }
}


function TestCar(Button, carName) {
    clearInterval(Update)
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.disabled = true;
    });
    Button.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin" style="color: #1396d8;"></i>'
    setTimeout(() => {
        $.post('https://' + directory + '/TestVehicule', JSON.stringify({
            carName: carName
        }));
        buttons.forEach(button => {
            button.disabled = false;
        });
        Button.innerHTML = 'Essayer'
    }, 2000);
}

function BuyByName(Button, ItemName, Type, Location) {
    clearInterval(Update)
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.disabled = true;
    });
    Button.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin" style="color: #1396d8;"></i>'
    setTimeout(() => {
        $.post('https://' + directory + '/BuyItem', JSON.stringify({
            ItemName: ItemName,
            Type: Type,
            Location: Location
        }));
        Button.disabled = true;
        Button.innerHTML = 'Acheter'
        buttons.forEach(button => {
            button.disabled = false;
        });
    }, 2000);
}


function GetHistoryItem(HistoryData, LogoCoins) {
    $("#history-section").html('')
    $("#history-section").removeClass('center-elements')
    $("#history-section").addClass('videos')
    HistoryData.Data.reverse().forEach(element => {
        $("#history-section").append(`<div class="video anim" style="--delay: .2s">
            <div class="video-wrapper" style="display: inline-flex;">
                <svg width="40px" height="40px" style="margin-top: 5px;" viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M752.1 198.4H491.3v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4H387v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4h-33.7c-8.3 0-15 6.7-15 15V869c0 8.3 6.7 15 15 15h224l271.3-271.3V213.4c0-8.2-6.7-15-15-15z m-117 158.3c-23.2 0-42.1-18.8-42.1-42.1s18.8-42.1 42.1-42.1 42.1 18.8 42.1 42.1-18.9 42.1-42.1 42.1zM615.6 884l151.5-151.5v-77.3L538.3 884zM735.4 884l31.7-31.7V775l-109 109z" fill="#FFBC00"></path><path d="M752.1 168.4H491.3V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4H387V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4h-33.7c-24.8 0-45 20.2-45 45V869c0 24.8 20.2 45 45 45H752c24.8 0 45-20.2 45-45V213.4c0.1-24.8-20.1-45-44.9-45zM461.3 140v86.9h-21.5V140h21.5zM357 140v86.9h-21.5V140H357z m410.1 712.3L735.4 884h-77.3l109-109v77.3z m0-119.8L615.6 884h-77.3l228.8-228.8v77.3z m0-119.7L495.9 884h-224c-8.3 0-15-6.7-15-15V213.4c0-8.3 6.7-15 15-15h33.7v31.4c0 14.9 12.1 27 27 27H360c14.9 0 27-12.1 27-27v-31.4h22.8v31.4c0 14.9 12.1 27 27 27h27.5c14.9 0 27-12.1 27-27v-31.4h260.8c8.3 0 15 6.7 15 15v399.4z" fill="#46287C"></path><path d="M335.6 140h21.5v86.9h-21.5zM439.8 140h21.5v86.9h-21.5z" fill="#FFBC00"></path><path d="M635.1 314.6m-42.1 0a42.1 42.1 0 1 0 84.2 0 42.1 42.1 0 1 0-84.2 0Z" fill="#FFFFFF"></path></g></svg>
                    <h3 style="color: white;font-weight: bold; margin-left: 10px;">${element.item}</h3>
            </div>
            <br>
            <br>
            <center>
                <div class="coins-elements">
                    <img class="user-img" id="logo-coins" src="${LogoCoins}">
                    <div class="user-name" id="Points-Total">${element.price}</div>
                </div>
                <br>
                <div class="price-elements">
                    <div  class="user-name">${element.date}</div>
                </div>
            </center>
            </div>`);
    })
}


function GetPackage(Data, InfoShop, Translate){
    $("#tebex-section").html('')
    $("#tebex-section").removeClass('center-elements')
    $("#tebex-section").addClass('videos')
    Data.reverse().forEach(element => {
        $("#tebex-section").append(`<div class="video anim" style="--delay: .1s">
            <div class="video-wrapper" style="display: inline-flex;">
                <svg width="40px" height="40px" style="margin-top: 5px;" viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M752.1 198.4H491.3v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4H387v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4h-33.7c-8.3 0-15 6.7-15 15V869c0 8.3 6.7 15 15 15h224l271.3-271.3V213.4c0-8.2-6.7-15-15-15z m-117 158.3c-23.2 0-42.1-18.8-42.1-42.1s18.8-42.1 42.1-42.1 42.1 18.8 42.1 42.1-18.9 42.1-42.1 42.1zM615.6 884l151.5-151.5v-77.3L538.3 884zM735.4 884l31.7-31.7V775l-109 109z" fill="#FFBC00"></path><path d="M752.1 168.4H491.3V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4H387V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4h-33.7c-24.8 0-45 20.2-45 45V869c0 24.8 20.2 45 45 45H752c24.8 0 45-20.2 45-45V213.4c0.1-24.8-20.1-45-44.9-45zM461.3 140v86.9h-21.5V140h21.5zM357 140v86.9h-21.5V140H357z m410.1 712.3L735.4 884h-77.3l109-109v77.3z m0-119.8L615.6 884h-77.3l228.8-228.8v77.3z m0-119.7L495.9 884h-224c-8.3 0-15-6.7-15-15V213.4c0-8.3 6.7-15 15-15h33.7v31.4c0 14.9 12.1 27 27 27H360c14.9 0 27-12.1 27-27v-31.4h22.8v31.4c0 14.9 12.1 27 27 27h27.5c14.9 0 27-12.1 27-27v-31.4h260.8c8.3 0 15 6.7 15 15v399.4z" fill="#46287C"></path><path d="M335.6 140h21.5v86.9h-21.5zM439.8 140h21.5v86.9h-21.5z" fill="#FFBC00"></path><path d="M635.1 314.6m-42.1 0a42.1 42.1 0 1 0 84.2 0 42.1 42.1 0 1 0-84.2 0Z" fill="#FFFFFF"></path></g></svg>
                    <h3 style="color: white;font-weight: bold; margin-left: 10px;">${element.name}</h3>
            </div>
            <div class="video-wrapper">
                <img src="${element.image}" />
            </div>
            <br>
            <center>
                <div class="coins-elements">
                    <div class="user-name">${element.price}${Translate.Devise}</div>
                </div>
                <br>
                <div class="price-elements">
                <button class="button" onclick="window.invokeNative('openUrl', '${InfoShop.account.domain}/${element.category.name.toLowerCase()}/${element.id}')">${Translate.Buy}</button>
                </div>
            </center>
            </div>`);
    })
}


function ShowAdminPanel() {
    $("#admin-panel-section").html('')
    $("#admin-panel-section").removeClass('center-elements')
    $("#admin-panel-section").addClass('videos')
    $("#admin-panel-section").append(`<div class="video anim" style="--delay: .1s">
            <div class="video-wrapper" style="display: inline-flex;">
                <svg width="40px" height="40px" style="margin-top: 5px;" viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M752.1 198.4H491.3v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4H387v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4h-33.7c-8.3 0-15 6.7-15 15V869c0 8.3 6.7 15 15 15h224l271.3-271.3V213.4c0-8.2-6.7-15-15-15z m-117 158.3c-23.2 0-42.1-18.8-42.1-42.1s18.8-42.1 42.1-42.1 42.1 18.8 42.1 42.1-18.9 42.1-42.1 42.1zM615.6 884l151.5-151.5v-77.3L538.3 884zM735.4 884l31.7-31.7V775l-109 109z" fill="#FFBC00"></path><path d="M752.1 168.4H491.3V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4H387V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4h-33.7c-24.8 0-45 20.2-45 45V869c0 24.8 20.2 45 45 45H752c24.8 0 45-20.2 45-45V213.4c0.1-24.8-20.1-45-44.9-45zM461.3 140v86.9h-21.5V140h21.5zM357 140v86.9h-21.5V140H357z m410.1 712.3L735.4 884h-77.3l109-109v77.3z m0-119.8L615.6 884h-77.3l228.8-228.8v77.3z m0-119.7L495.9 884h-224c-8.3 0-15-6.7-15-15V213.4c0-8.3 6.7-15 15-15h33.7v31.4c0 14.9 12.1 27 27 27H360c14.9 0 27-12.1 27-27v-31.4h22.8v31.4c0 14.9 12.1 27 27 27h27.5c14.9 0 27-12.1 27-27v-31.4h260.8c8.3 0 15 6.7 15 15v399.4z" fill="#46287C"></path><path d="M335.6 140h21.5v86.9h-21.5zM439.8 140h21.5v86.9h-21.5z" fill="#FFBC00"></path><path d="M635.1 314.6m-42.1 0a42.1 42.1 0 1 0 84.2 0 42.1 42.1 0 1 0-84.2 0Z" fill="#FFFFFF"></path></g></svg>
                    <h3 style="color: white;font-weight: bold; margin-left: 10px;">${element.name}</h3>
            </div>
            <div class="video-wrapper">
                <img src="${element.image}" />
            </div>
            <br>
            <center>
                <div class="coins-elements">
                    <div class="user-name">${element.price}${Translate.Devise}</div>
                </div>
                <br>
                <div class="price-elements">
                <button class="button" onclick="window.invokeNative('openUrl', '${InfoShop.account.domain}/${element.category.name.toLowerCase()}/${element.id}')">${Translate.Buy}</button>
                </div>
            </center>
            </div>`);
}