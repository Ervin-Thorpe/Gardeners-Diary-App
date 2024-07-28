$(document).ready(function() {
    $(".edit-off-btn-group").show();
    $(".edit-on-btn-group").hide();

    lockPatches();
});

function lockPatches(){
    CanvasModule.changeCanvasLocked(true);

    $(".edit-off-btn-group").show();
    $(".edit-on-btn-group").hide();
}

function unlockPatches(){
    CanvasModule.changeCanvasLocked(false);

    $(".edit-off-btn-group").hide();
    $(".edit-on-btn-group").show();
}