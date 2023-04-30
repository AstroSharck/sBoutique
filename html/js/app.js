let directory = GetParentResourceName()
InitShop(false);
var TranslateData = null

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
        GetPackage(event.data.InfoPack.Data, event.data.Details.Data)
    }
    if (event.data.Reviews) {
        GetReviews(event.data.Reviews)
    }
    if (event.data.Open === false) { InitShop(false); }
})

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
    $(".sidebar-link, #add_reviews").click(function () {
        $(".sidebar-link").removeClass("is-active");
        var dataId = $(this).attr("data-id");
        $(".home-area, .vehicule-area, .weapon-area, .money-area, .history-area, .tebex-area, .reviews-area, .admin-panel-area, .add-reviews-area").css("display", "none");
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
        $.post('https://' + directory + '/GetReviews', JSON.stringify({}));
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

            $('#review_title').text(DataInfo.Translate.review_title)
            $('#review_text').attr('placeholder', DataInfo.Translate.describe_placeholder)
            $('#button_valid').text(DataInfo.Translate.valid_button)

            TranslateData = DataInfo.Translate

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

            if (DataInfo.PackTebex.length > 0) GetPackage(DataInfo.PackTebex)

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
        Button.innerHTML = TranslateData.try_button
    }, 2000);
}

function BuyByName(Button, ItemName, Type, Location) {
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
        Button.innerHTML = TranslateData.paid_button
        buttons.forEach(button => {
            button.disabled = false;
        });
    }, 2000);
}


async function AddReview(Button) {
    const buttons = document.querySelectorAll('button');
    buttons.forEach(button => {
        button.disabled = true;
    });
    Button.innerHTML = '<i class="fa-solid fa-circle-notch fa-spin" style="color: #1396d8;"></i>'
    const ratingInputs = document.querySelectorAll('.rate input[type="radio"]');
    const review_text = document.querySelector('#review_text')

    let selectedRating = null;
    ratingInputs.forEach((input) => {
        if (input.checked) {
            selectedRating = input.value;
        }
    });
    setTimeout(() => {
        $.post('https://' + directory + '/AddReview', JSON.stringify({
            Review_Text: review_text.value,
            Star: selectedRating
        }));
        $(".add-reviews-area").css("display", "none");
        $(".home-area").css("display", "block");
        Button.disabled = true;
        Button.innerHTML = TranslateData.valid_button
        buttons.forEach(button => {
            button.disabled = false;
        });
        review_text.value = ''
    }, 2000);
}


function GetHistoryItem(HistoryData, LogoCoins) {
    $("#history-section").html('')
    $("#history-section").removeClass('center-elements')
    $("#history-section").addClass('videos')
    if (HistoryData.Data.length > 0) {
        $('#add_reviews').css('display', 'block')
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
}


function GetPackage(Data) {
    $("#tebex-section").html('')
    $("#tebex-section").removeClass('center-elements')
    $("#tebex-section").addClass('tebexs')
    Data.forEach(element => {
        $("#tebex-section").append(`<div class="tebex anim" style="--delay: .1s">
            <div class="video-wrapper" style="display: inline-flex;">
                    <svg width="40px" height="40px" style="margin-top: 5px;" viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M502.44126 547.699816l173.134676 21.540732 108.208773-44.472117 4.999956 262.404995-276.250782 145.219319" fill="#5FCEFF"></path><path d="M491.22013 548.764385v379.366888l-270.106334-160.912916 3.698817-244.88277 114.020742 46.904961" fill="#FFB578"></path><path d="M988.850052 407.70104l-308.724923 161.539508-177.683869-24.520246 308.724923-161.571477z" fill="#42BC90"></path><path d="M912.252256 282.062752l-101.086073 101.086073L502.44126 246.161531l101.118042-101.118042z" fill="#FFB578"></path><path d="M811.166183 383.148825l-308.724923 161.571477-308.692954-161.571477L502.44126 246.161531z" fill="#8B87C1"></path><path d="M401.355187 145.043489L502.44126 246.161531l-308.692954 136.987294-101.118042-101.086073z" fill="#5FCEFF"></path><path d="M502.44126 544.720302l-153.163623 24.520246-308.692953-161.539508 153.163622-24.552215z" fill="#FF4893"></path><path d="M502.44126 567.095426a22.371927 22.371927 0 0 1-10.377147-2.551128l-308.692954-161.571478a22.378321 22.378321 0 0 1 1.30114-40.280978l308.692953-136.987293a22.378321 22.378321 0 0 1 18.152016 0l308.724922 136.987293a22.375124 22.375124 0 0 1 1.30114 40.284175l-308.72812 161.571478a22.346352 22.346352 0 0 1-10.37395 2.547931z m-257.264375-182.287409l257.264375 134.653555 257.28995-134.653555-257.28995-114.164603-257.264375 114.164603zM502.44126 951.462271a22.362336 22.362336 0 0 1-10.95259-2.864425l-280.112641-157.191721a22.378321 22.378321 0 0 1 21.901983-39.030988l269.431788 151.197527 269.307109-143.688002a22.381518 22.381518 0 0 1 21.06759 39.488146l-280.11264 149.455215a22.378321 22.378321 0 0 1-10.530599 2.634248z" fill="#4F46A3"></path><path d="M502.44126 951.462271a22.378321 22.378321 0 0 1-22.378321-22.378321v-283.821048a22.378321 22.378321 0 1 1 44.756642 0v283.821048a22.378321 22.378321 0 0 1-22.378321 22.378321zM222.322225 794.27055a22.378321 22.378321 0 0 1-22.371927-22.173719l-2.429646-263.488745a22.378321 22.378321 0 0 1 22.170522-22.582923h0.210996a22.378321 22.378321 0 0 1 22.371927 22.173719l2.429646 263.488746a22.378321 22.378321 0 0 1-22.170522 22.582922h-0.210996zM782.557098 802.007056h-0.21739a22.381518 22.381518 0 0 1-22.164128-22.592514l2.461615-256.487528a22.378321 22.378321 0 0 1 22.375124-22.164128h0.21739a22.381518 22.381518 0 0 1 22.164128 22.592513l-2.461615 256.487528a22.378321 22.378321 0 0 1-22.375124 22.164129z" fill="#4F46A3"></path><path d="M502.44126 667.641223a22.378321 22.378321 0 0 1-22.378321-22.378321v-98.112954a22.378321 22.378321 0 1 1 44.756642 0v98.112954a22.378321 22.378321 0 0 1-22.378321 22.378321zM912.236271 304.447467a22.282414 22.282414 0 0 1-9.066417-1.93093l-308.692953-137.019262a22.381518 22.381518 0 0 1 18.155212-40.907571l308.692953 137.019262a22.381518 22.381518 0 0 1-9.088795 42.838501zM92.643052 304.447467a22.384715 22.384715 0 0 1-9.091992-42.838501l308.724923-137.019262a22.378321 22.378321 0 0 1 18.158409 40.907571l-308.724923 137.019262a22.346352 22.346352 0 0 1-9.066417 1.93093zM680.14431 591.618869a22.378321 22.378321 0 0 1-10.393131-42.20871l308.724922-161.539509a22.375124 22.375124 0 0 1 30.201143 9.453242 22.378321 22.378321 0 0 1-9.453242 30.201143l-308.724923 161.539509a22.285611 22.285611 0 0 1-10.354769 2.554325zM349.258456 591.618869a22.288808 22.288808 0 0 1-10.357966-2.554325l-308.692954-161.539509a22.378321 22.378321 0 0 1 20.751098-39.657582l308.692954 161.539509a22.378321 22.378321 0 0 1-10.393132 42.211907z" fill="#4F46A3"></path><path d="M502.44126 268.539852a22.320777 22.320777 0 0 1-15.827867-6.556848l-101.086073-101.118042a22.384715 22.384715 0 0 1 0.003197-31.64934 22.387912 22.387912 0 0 1 31.64934 0.003197l101.086073 101.118042a22.384715 22.384715 0 0 1-15.82467 38.202991zM193.748306 405.527146a22.314383 22.314383 0 0 1-15.821473-6.550455l-101.118042-101.086073a22.378321 22.378321 0 0 1 31.646143-31.652536l101.118042 101.086073a22.378321 22.378321 0 0 1-15.82467 38.202991z" fill="#4F46A3"></path><path d="M502.44126 268.539852a22.375124 22.375124 0 0 1-15.82467-38.199794l101.114845-101.118042a22.378321 22.378321 0 0 1 31.64934 31.646143l-101.118042 101.118042a22.311186 22.311186 0 0 1-15.821473 6.553651zM811.166183 405.527146a22.378321 22.378321 0 0 1-15.82467-38.199794l101.082876-101.086073a22.378321 22.378321 0 0 1 31.64934 31.646143l-101.082876 101.086072a22.323974 22.323974 0 0 1-15.82467 6.553652z" fill="#4F46A3"></path><path d="M988.878824 430.079361a22.538166 22.538166 0 0 1-3.091406-0.214193l-177.683868-24.552215a22.381518 22.381518 0 0 1-19.10789-25.229958 22.381518 22.381518 0 0 1 25.233156-19.104693l177.683869 24.552215a22.381518 22.381518 0 0 1-3.033861 44.548844zM680.153901 591.618869c-1.016615 0-2.049215-0.067135-3.088208-0.210995l-177.683869-24.520246a22.378321 22.378321 0 0 1-19.107889-25.229959 22.375124 22.375124 0 0 1 25.226761-19.111086l177.683869 24.520246a22.384715 22.384715 0 0 1-3.030664 44.55204z" fill="#4F46A3"></path><path d="M349.248865 591.618869a22.384715 22.384715 0 0 1-3.507002-44.481708l153.163622-24.520246a22.381518 22.381518 0 0 1 7.074747 44.197184l-153.163623 24.520246c-1.198839 0.191814-2.39448 0.284524-3.567744 0.284524zM40.555911 430.079361a22.384715 22.384715 0 0 1-3.513396-44.478512l153.163623-24.552215a22.378321 22.378321 0 1 1 7.084337 44.193987l-153.163623 24.552215c-1.202036 0.191814-2.39448 0.284524-3.570941 0.284525z" fill="#4F46A3"></path></g></svg>
                    <h3 style="color: white;font-weight: bold; margin-left: 10px;">${element.Title}</h3>
            </div>
            <div class="video-wrapper">
                <img src="${element.Image}" />
            </div>
            <br>
            <center>
                <div class="coins-elements">
                    <div class="user-name">${element.Price}</div>
                </div>
                <div style="border-top: 2px solid #1f1d2b; width: 90%; margin-top: 10px;"></div>
                <div>
                    <div class="user-name" style="margin-top: 10px;">${element.Description}</div>
                </div>
                <div style="border-top: 2px solid #1f1d2b; width: 90%; margin-top: 10px; margin-bottom: 10px;"></div>
                <div class="price-elements">
                <button class="button" onclick="window.invokeNative('openUrl', '${element.ButtonAction}')">${element.ButtonName}</button>
                </div>
            </center>
        </div>`);
    })
}

function GetReviews(Data) {
    $("#reviews-section").html('')
    Data.reverse().forEach(element => {
        $("#reviews-section").append(`<div class="video anim" style="--delay: .2s; margin-top: 20px;">
        <div class="video-wrapper" style="display: inline-flex;">
            <svg width="40px" height="40px" style="margin-top: 5px;" viewBox="0 0 1024 1024" class="icon" version="1.1" xmlns="http://www.w3.org/2000/svg" fill="#000000"><g id="SVGRepo_bgCarrier" stroke-width="0"></g><g id="SVGRepo_tracerCarrier" stroke-linecap="round" stroke-linejoin="round"></g><g id="SVGRepo_iconCarrier"><path d="M752.1 198.4H491.3v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4H387v31.4c0 14.9-12.1 27-27 27h-27.5c-14.9 0-27-12.1-27-27v-31.4h-33.7c-8.3 0-15 6.7-15 15V869c0 8.3 6.7 15 15 15h224l271.3-271.3V213.4c0-8.2-6.7-15-15-15z m-117 158.3c-23.2 0-42.1-18.8-42.1-42.1s18.8-42.1 42.1-42.1 42.1 18.8 42.1 42.1-18.9 42.1-42.1 42.1zM615.6 884l151.5-151.5v-77.3L538.3 884zM735.4 884l31.7-31.7V775l-109 109z" fill="#FFBC00"></path><path d="M752.1 168.4H491.3V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4H387V137c0-14.9-12.1-27-27-27h-27.5c-14.9 0-27 12.1-27 27v31.4h-33.7c-24.8 0-45 20.2-45 45V869c0 24.8 20.2 45 45 45H752c24.8 0 45-20.2 45-45V213.4c0.1-24.8-20.1-45-44.9-45zM461.3 140v86.9h-21.5V140h21.5zM357 140v86.9h-21.5V140H357z m410.1 712.3L735.4 884h-77.3l109-109v77.3z m0-119.8L615.6 884h-77.3l228.8-228.8v77.3z m0-119.7L495.9 884h-224c-8.3 0-15-6.7-15-15V213.4c0-8.3 6.7-15 15-15h33.7v31.4c0 14.9 12.1 27 27 27H360c14.9 0 27-12.1 27-27v-31.4h22.8v31.4c0 14.9 12.1 27 27 27h27.5c14.9 0 27-12.1 27-27v-31.4h260.8c8.3 0 15 6.7 15 15v399.4z" fill="#46287C"></path><path d="M335.6 140h21.5v86.9h-21.5zM439.8 140h21.5v86.9h-21.5z" fill="#FFBC00"></path><path d="M635.1 314.6m-42.1 0a42.1 42.1 0 1 0 84.2 0 42.1 42.1 0 1 0-84.2 0Z" fill="#FFFFFF"></path></g></svg>
                <h3 style="color: white;font-weight: bold; margin-left: 10px;">${element.name}</h3>
        </div>
        <span class="closebtn" style="margin-right: 10px; margin-top: 10px;" onclick="DelReview(${element.id})">&times;</span>
        <br>
        <br>
        <center>
            <div class="coins-elements">
                <div class="user-name">${element.review}</div>
            </div>
            <br>
            <div class="coins-elements">
                <div class="rating">
                    ${element.star === 5 ? '<input type="radio" value="5" checked/>':'<input type="radio" value="5"/>'}
                    <label for="star5" title="text"><i class="fa-solid fa-star"></i> </label>
                    ${element.star === 4 ? '<input type="radio"  value="4" checked/>':'<input type="radio" value="4"/>'}
                    <label for="star4" title="text"><i class="fa-solid fa-star"></i> </label>
                    ${element.star === 3 ? '<input type="radio" value="3" checked/>':'<input type="radio" value="3" />'}
                    <label for="star3" title="text"><i class="fa-solid fa-star"></i> </label>
                    ${element.star === 2 ? '<input type="radio" value="2" checked/>':'<input type="radio" value="2" />'}
                    <label for="star2" title="text"><i class="fa-solid fa-star"></i> </label>
                    ${element.star === 1 ? '<input type="radio" value="1" checked/>':'<input type="radio" value="1" />'}
                    <label for="star1" title="text"><i class="fa-solid fa-star"></i> </label>
                </div>                             
            </div>
            <div class="price-elements">
                <div  class="user-name">${element.date}</div>
            </div>
        </center>
    </div>`);
    })
}


/* function ShowAdminPanel() {
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
} */





/* Alert System */
function ShowAlert(Text, Type, Timed) {
    // Afficher le type de l'alerte
    if (Type === "Error") {
        $("#alert").css('background-color', 'red')
    }
    if (Type === "Success") {
        $("#alert").css('background-color', 'green')
    }
    if (Type === "Warning") {
        $("#alert").css('background-color', 'orange')
    }

    // Afficher l'alerte
    $("#alert").fadeIn(1000)
    document.getElementById("message").textContent = Text
    // Cacher l'alerte après 3 secondes (3000 millisecondes)
    if (Timed) {
        setTimeout(function () {
            $("#alert").fadeOut(500)
        }, Timed);
    }
}

function closeAlert() {
    $("#alert").fadeOut(500)
}