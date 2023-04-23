let directory = GetParentResourceName()
InitShop(false);

window.addEventListener('message', async (event) => {
    if (event.data.Open === true) {
        await InitShop(true, event.data.Data)
    }
    if (event.data.Open === false) { InitShop(false); }
});




/* Close Function */
document.onkeyup = function (data) {
    if (data.which == 27) {
        $.post('https://' + directory + '/exit', JSON.stringify({}));
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

        $("#home-block").css("display", "block");
        $(".vehicule-area").css("display", "none");
        $(".weapon-area").css("display", "none");

        $(".main-container").scrollTop(1);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });
    $(".car").on("click", function (e) {
        $(".main-container").addClass("show");

        $("#home-block").css("display", "none");
        $(".vehicule-area").css("display", "flex");
        $(".weapon-area").css("display", "none");

        $(".main-container").scrollTop(0);
        $(".sidebar-link").removeClass("is-active");
        $(this).addClass("is-active");
    });

    $(".weapon").on("click", function (e) {
        $(".main-container").addClass("show");

        $("#home-block").css("display", "none");
        $(".vehicule-area").css("display", "none");
        $(".weapon-area").css("display", "flex");

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
        if (DataInfo) {
            $('#Playername').text(DataInfo.Playername)
            $('.Code-Shop-Style').html(`<div>Code Boutique ➜ ${DataInfo.CodeShop}</div>`)

            $('.logo-expand').text(DataInfo.ShopInfo.ShopName)
            $("#logo-boutique").attr("src", `img/${DataInfo.ShopInfo.ImageName}`)
            $('#HomeText').text(DataInfo.ShopInfo.HomeNameCat)
            $('#CarText').text(DataInfo.ShopInfo.VehiculeNameCat)
            $('#WeaponText').text(DataInfo.ShopInfo.WeaponNameCat)
            $('#MoneyText').text(DataInfo.ShopInfo.MoneyNameCat)

            $('.main-blog+.main-blog').css('background-image', `url('./img/${DataInfo.PromoSection.PromotionImageName}')`);
            $('.Promote-Text-Card').html(`<div> ${DataInfo.PromoSection.PromotionCoinsbBeforeReduction} <span> ➜ </span> ${DataInfo.PromoSection.PromotionCoinsAfterReduction} </div>`)
            $('#Promo-Button').html(`${DataInfo.PromoSection.PromotionType === 'vehicule' ? '<button class="button" onclick="TestCar(\'' + DataInfo.PromoSection.PromotionName + '\')">Essayer</button>' : ''}
            <button class="button">Acheter</button>`)

            DataInfo.PopularSection.forEach(element => {
                $("#popular-section").append(`<div class="video anim" style="--delay: .4s">
        <div class="video-wrapper">
            <img src="img/${element.ImageName}">
        </div>
        <center>
            <div class="video-by">${element.LabelName}</div>
            <div class="price-elements">
                <img class="user-img" src="https://cdn.discordapp.com/attachments/1093850988705763398/1098619930510901269/Astro.gif">
                <div  class="user-name">${element.Point}</div>
            </div>
        </center>
        <hr style="width: 80%;">
        <center style="padding-bottom: 10px;">
            ${element.Type === 'vehicule' ? '<button class="button" onclick="TestCar(\'' + element.Name + '\')">Essayer</button>' : ''}
            <button class="button">Acheter</button>
        </center>
        </div>`);
            });

            setTimeout(function () {
                $(".sidebar").fadeIn('slow');
                $(".wrapper").fadeIn('slow');
                $("#loading").fadeOut('slow');

            }, 2000);
        }

    } else {
        $('.container').hide();
    }
}




function TestCar(carName) {
    $.post('https://' + directory + '/TestVehicule', JSON.stringify({
        carName: carName
    }));
}
