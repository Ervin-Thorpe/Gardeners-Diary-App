var popupModule = (function () {
    var popupDesc = "Popup Description"; // Private Variable
    var popupTitle = "Popup Title";
    var popupSelected = false;

    var pub = {};// public object - returned at end of module

    // get method
    pub.getPopupDesc = function() {
        return popupDesc;
    }
    pub.getPopupTitle = function() {
        return popupTitle;
    }

    pub.setPopupDesc = function(popupDescInput) {
        popupDesc = popupDescInput;
    }
    pub.setPopupTitle = function(popupTitleInput) {
        popupTitle = popupTitleInput;
    }
    
    pub.changePopupSelected = function (popupSelectedInput) {
        popupSelected = popupSelectedInput;
    }
    pub.getPopupSelected = function() {
        return popupSelected;
    }

    return pub; // expose externally
}());
