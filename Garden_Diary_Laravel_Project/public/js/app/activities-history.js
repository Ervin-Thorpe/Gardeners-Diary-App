$(document).ready(function() {
    // creates calender
    $('#datepicker').datepicker({
        dateFormat: 'dd-mm-yy'
    }).val();

    // finds out the number of rows in activities table
    var rowCount = $('.activities-table tr').length;

    if(rowCount == 1)
    {
        $('.right-panel-top-title').text("My Diary (" + rowCount + " result)");
    }
    else if(rowCount > 1)
    {
        $('.right-panel-top-title').text("My Diary (" + rowCount + " results)");
    }
})