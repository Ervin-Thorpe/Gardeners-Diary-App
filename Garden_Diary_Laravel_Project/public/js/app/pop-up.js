//----- REMOVE TILE POP UP
$(document).ready(function() {    
    //----- OPEN
    $('[data-popup-remove-tile-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-remove-tile-open');
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

        e.preventDefault();
    });
 
    //----- CLOSE
    $('[data-popup-remove-tile-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-remove-tile-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
 
        e.preventDefault();
    });
    
    //----- OPEN
    $('[data-popup-add-activity-open]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-add-activity-open');
        $('[data-popup="' + targeted_popup_class + '"]').fadeIn(350);

        e.preventDefault();
    });
 
    //----- CLOSE
    $('[data-popup-add-activity-close]').on('click', function(e)  {
        var targeted_popup_class = jQuery(this).attr('data-popup-add-activity-close');
        $('[data-popup="' + targeted_popup_class + '"]').fadeOut(350);
 
        e.preventDefault();
    });

});