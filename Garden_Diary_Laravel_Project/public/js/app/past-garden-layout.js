$(document).ready(function() {    
    var canvas = new fabric.Canvas('c_GardenEditor', {
        preserveObjectStacking: true,
        controlsAboveOverlay: true
    });

    canvas.setHeight(CanvasModule.getCanvasSize()[0]);
    canvas.setWidth(CanvasModule.getCanvasSize()[1]);
    canvas.selection = false;
    
    canvas.backgroundColor = new fabric.Pattern({
        source: CanvasModule.getCanvasBG()
    });

    canvas.hoverCursor = 'pointer';

    canvas.on('mouse:down', function (e) {
        var obj;
        obj = e.target;
        if(obj != null){
            showTileName(obj);
            if(obj.tileType == "grass_tile")
            {
                canvas.sendToBack(obj, true);
            }
        }
    });

    canvas.renderAll();

    CanvasModule.setObjectEdit();

    $('#garden-layout-canvas').hide();
    $('#loading-garden-layout').show();
    $('#loading-garden-layout').css({
        "padding": (CanvasModule.getCanvasSize()[0]/2) + "px " + (CanvasModule.getCanvasSize()[1]/4) + "px"
    });

    function showTileName(obj) 
    {
        $("#tile-name").html("<b>Name: </b>" + obj.name);
    }

    function createSubClass()
    {
        CanvasModule.setTileRectSubClass();
        CanvasModule.setAbsoluteCoords();
    }

    function loadCanvas(milSecondsWait) {
        // parse the data into the canvas
        if(pastGardenLayout != '')
        {
            var jsonCanvas = JSON.parse(pastGardenLayout.replace(/&quot;/g,'"'));
            
            // temp. adds a tile (applies new classes made and avoid errors)
            createSubClass();

            // first load JSON to show tiles
            canvas.clear();
            canvas.loadFromJSON(jsonCanvas, canvas.renderAll.bind(canvas));

            setTimeout(function() {
                // second load JSON to show images
                canvas.clear();
                canvas.loadFromJSON(jsonCanvas, canvas.renderAll.bind(canvas));
                unselectableAll();
            }, milSecondsWait);
        }
    }

    function loadGardenLayout(milSecsSwitchWait, milSecsWait)
    {
        CanvasModule.setFakeLoadingScreen(milSecsSwitchWait, milSecsWait, "#progress-bar");

        // sets the canvas twice (once to apply tiles)
        loadCanvas(milSecsWait);

        setTimeout(function() {
            // second time to apply images
            $('#garden-layout-canvas').show();
            $('#loading-garden-layout').hide();
        }, milSecsSwitchWait);
        
    }

    function unselectableAll()
    {
        for(var i = 0; i < canvas._objects.length; i++){
            canvas.item(i).selectable = false;
        }
    }

    setTimeout(function() {
        canvas.renderAll();
    }, 2000);
    
    CanvasModule.changeCanvas(canvas);

    loadGardenLayout(3000, 2500);
});



