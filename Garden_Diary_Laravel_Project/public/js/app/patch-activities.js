$(document).ready(function() {
    
    var rowCountTodays = $('.activities-table .todays-activities').length;
    var rowCountNo = $('.activities-table .no-activities').length;
    var rowCountUpcoming = $('.activities-table .upcoming-activities').length;
    var rowCountInactive = $('.activities-table .inactive-activities').length;
    var rowCountOverdue = $('.activities-table .overdue-activities').length;
    var rowCountPatches = $('.activities-table .your-patches').length;
    var rowCountAll = $('.activities-table .all-activities').length;

    $(".all-activities").hide();
    $(".no-activities").hide();
    $(".todays-activities").show();
    $(".your-patches").hide();

    setTitleText(rowCountTodays, "My Activities: Todays Activities");

    $("#todays-activities-btn").click(function(){
        $(".all-activities").hide();
        $(".your-patches").hide();
        $(".no-activities").hide();
        $(".todays-activities").show();

        setTitleText(rowCountTodays, "My Activities: Todays Activities");
    });

    $("#all-activities-btn").click(function(){
        $(".all-activities").show();
        $(".your-patches").hide();
        $(".no-activities").hide();
        
        setTitleText(rowCountAll, "My Activities: All Activities");
    });

    $("#upcoming-activities-btn").click(function(){
        $(".all-activities").hide();
        $(".your-patches").hide();
        $(".no-activities").hide();
        $(".upcoming-activities").show();
        
        setTitleText(rowCountUpcoming, "My Activities: Upcoming Activities");
    }); 

    $("#no-activities-btn").click(function(){
        $(".all-activities").hide();
        $(".your-patches").hide();
        $(".no-activities").show();
        
        setTitleText(rowCountNo, "My Activities: No Activities");
    });

    $("#inactive-activities-btn").click(function(){
        $(".all-activities").hide();
        $(".your-patches").hide();
        $(".no-activities").hide();
        $(".inactive-activities").show();
        
        setTitleText(rowCountInactive, "My Activities: Inactive Activities");
    }); 

    $("#overdue-activities-btn").click(function(){
        $(".all-activities").hide();
        $(".your-patches").hide();
        $(".no-activities").hide();
        $(".overdue-activities").show();
        
        setTitleText(rowCountOverdue, "My Activities: Overdue Activities");
    });

    $("#your-patches-btn").click(function(){
        $(".all-activities").hide();
        $(".no-activities").hide();
        $(".your-patches").show();

        setTitleText(rowCountPatches, "My Patches");
    });

    $(".add-new-activity-btn").click(function(){
        $('.selected-patch-num').val($(this).siblings().val());
        $('[data-popup-add-activity-open]').trigger('click');
    });

    function setTitleText(rowCount, $titleText)
    {
        if(rowCount == 1)
        {
            $(".right-panel-top-title span").text($titleText + " (" + rowCount + " Result)");
        }
        else
        {
            $(".right-panel-top-title span").text($titleText + " (" + rowCount + " Results)");
        }
    }
});