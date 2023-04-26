let directory = GetParentResourceName()
InitShop(false);
var Update = null

window.addEventListener('message', async (event) => {
    if (event.data.Open === true) {
        await InitShop(true, event.data.Data)
    }
    if (event.data.Open === false) { InitShop(false); }
    if (event.data.PointsAndCode) {
        $('#Points-Total').text(event.data.PointsAndCode.Coins)
        $('.Code-Shop-Style').html(`Code Boutique<br>↓<br>${event.data.PointsAndCode.Code}`)
    }
});




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
        $(".home-area, .vehicule-area, .weapon-area, .money-area, .history-area").css("display", "none");
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


$(function () {
    $(".home").on("click", function (e) {
        $(".main-container").removeClass("show");

        $(".main-container").scrollTop(1);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });
    $(".car").on("click", function (e) {
        $(".main-container").addClass("show");

        $(".main-container").scrollTop(0);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });

    $(".weapon").on("click", function (e) {
        $(".main-container").addClass("show");

        $(".main-container").scrollTop(0);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });

    $(".money").on("click", function (e) {
        $(".main-container").addClass("show");

        $(".main-container").scrollTop(0);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });
});



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
        if (DataInfo) {
            $('#Playername').text(DataInfo.Playername)

            $('.logo-expand').text(DataInfo.ShopInfo.ShopName)
            $("#logo-boutique").html(`<img style="width: 100px;" src="${DataInfo.ShopInfo.ImageName}" alt="Logo">`)
            $('#logo-coins').attr("src", `${DataInfo.ShopInfo.LogoCoins}`)

            if (!DataInfo.ShopInfo.VehiculeCategory) $('#CarCategory').css("display", "none")
            if (!DataInfo.ShopInfo.WeaponCategory) $('#WeaponCategory').css("display", "none")
            if (!DataInfo.ShopInfo.MoneyCategory) $('#MoneyCategory').css("display", "none")

            $('.main-blog+.main-blog').css('background-image', `url('${DataInfo.PromoSection.PromotionImageName}')`);
            $('.Promote-Text-Card').html(`<div> ${DataInfo.PromoSection.PromotionCoinsbBeforeReduction} <span> ➜ </span> ${DataInfo.PromoSection.PromotionCoinsAfterReduction} </div>`)
            $('#Promo-Button').html(`${DataInfo.PromoSection.PromotionType === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + DataInfo.PromoSection.PromotionName + '\')">Essayer</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${DataInfo.PromoSection.PromotionName}', '${DataInfo.PromoSection.PromotionType}', 'Promotion')">Acheter</button>`)

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
            ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">Essayer</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'Popular')">Acheter</button>
        </center>
        </div>`);
            });

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
            ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">Essayer</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'VehiculeSection')">Acheter</button>
        </center>
        </div>`);
            });

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
            ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">Essayer</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'WeaponSection')">Acheter</button>
        </center>
        </div>`);
            });

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
            ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(this, \'' + element.Name + '\')">Essayer</button>' : ''}
            <button class="button" onclick="BuyByName(this, '${element.Name}', '${element.Type}', 'MoneySection')">Acheter</button>
        </center>
        </div>`);
            });

            setTimeout(function () {
                $(".sidebar").fadeIn('slow');
                $(".wrapper").fadeIn('slow');
            }, 500);
        }
        Update = setInterval(async () => {
            await $.post('https://' + directory + '/GetPointsAndCode', JSON.stringify({}));
        }, 10000);
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
