$(document).ready(function() {
    $("#garden-video-help").show();
    $("#activities-video-help").hide();
    $("#plants-video-help").hide();
    $("#diary-video-help").hide();

    $("#garden-help-btn").click(function() {
        hideAllVideos();
        $("#garden-video-help").show();
        $(".right-panel-top-title").html("Step to Step Video Guide on using the: Garden Feature");
    });

    $("#activities-help-btn").click(function() {
        hideAllVideos();
        $("#activities-video-help").show();
        $(".right-panel-top-title").html("Step to Step Video Guide on using the: Activities Feature");
    });

    $("#plants-help-btn").click(function() {
        hideAllVideos();
        $("#plants-video-help").show();
        $(".right-panel-top-title").html("Step to Step Video Guide on using the: Plants Feature");
    });

    $("#diary-help-btn").click(function() {
        hideAllVideos();
        $("#diary-video-help").show();
        $(".right-panel-top-title").html("Step to Step Video Guide on using the: Diary Feature");
    });

    function hideAllVideos()
    {
        $("#garden-video-help").hide();
        $("#activities-video-help").hide();
        $("#plants-video-help").hide();
        $("#diary-video-help").hide();
    }
});


