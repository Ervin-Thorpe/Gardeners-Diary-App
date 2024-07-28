$(document).ready(function() {    
    $('#garden-layout-canvas').hide();
    $('#loading-garden-layout').show();
    $('#edit-off-btn').prop('disabled', true);

    var canvas = new fabric.Canvas('c_GardenEditor', {
        preserveObjectStacking: true,
        controlsAboveOverlay: true
    });

    var _isSavingDelay = false;
    var inputText = false;
    var jsonCanvas;
    var patchNum = 1;

    $('#loading-garden-layout').css({
        "padding": (CanvasModule.getCanvasSize()[0]/2) + "px " + (CanvasModule.getCanvasSize()[1]/4) + "px"
    });

    canvas.setHeight(CanvasModule.getCanvasSize()[0]);
    canvas.setWidth(CanvasModule.getCanvasSize()[1]);
    canvas.selection = false;
    
    canvas.backgroundColor = new fabric.Pattern({
        source: CanvasModule.getCanvasBG()
    });

    canvas.hoverCursor = 'pointer';
    canvas.renderAll();
    
    CanvasModule.setObjectEdit();

    //remove click button
    $("#inline-btn").click(function(){
        if(canvas.getActiveObject() !== null)
        {
            $('[data-popup-remove-tile-open]').trigger('click');
            deleteTilePopup(canvas.getActiveObject());
        } 
    });

    $("#popup-remove-tile-yes").click(function(){
        $('[data-popup-remove-tile-close]').trigger('click');
        if(popupModule.getPopupSelected())
        {
            canvas.fxRemove(canvas.getActiveObject());
            
            setTimeout(function() {
                saveCanvas();
            }, 2000);
        }
        popupModule.changePopupSelected(false);
    });

    $("#inline-btn-3").click(function(){
        addTile('patch_tile', 50);
    });

    $("#inline-btn-6").click(function(){
        addTile('walkpath_tile', 50);
    });
    
    $("#inline-btn-7").click(function(){
        addTile('water_tile', 50);
    });
    
    $("#inline-btn-8").click(function(){
        addTile('grass_tile', 50);
    });

    $("#inline-btn-9").click(function(){
        repositionTile("backwards");
    });

    $("#inline-btn-10").click(function(){
        repositionTile("toBack");
    });

    $("#inline-btn-11").click(function(){
        canvas.deactivateAll().renderAll();
    });

    $("#inline-btn-12").click(function(){
        if(inputText == true)
        {
            $("#inline-btn-12").prop('value', 'Rename Tile');
            $("#rename-tile-input").addClass("hide");
            inputText = false;

            var newName = $("#rename-tile-input").val();
			var temp = newName;
			newName = parseContent(newName);
			
			newName = newName === temp ? newName : 'Invalid Input';
			
            newName = newName === '' ? 'No Name' : newName;

            if(canvas.getActiveObject() !== null) 
            {
                newName = truncateString(newName, 30);

                canvas.getActiveObject().name = newName;
                $("#tile-name").html("<b>Name: </b>" + truncateString(newName, 20));
                saveCanvas();
            }

            $("#rename-tile-input").val('')          
        }
        else{
            $("#inline-btn-12").prop('value', 'Confirm New Tile Name');
            $("#rename-tile-input").removeClass("hide");
            inputText = true;
        }
    });

    function addTile(tileName, size){

        fabric.util.loadImage('../../images/' + tileName + '.png', function(img) {

            // =========================================================================================
            // IMPORTANT! ----- AS OF 1.7.3 OF FABRIC.JS, THIS BLOCK OF CODE NO LONGER WORKS.
            // IMPORTANT! ----- ORIGINALLY CAUSED ISSUE OF BEING UNABLE TO STORE AND RECOVER FROM JSON

            /*img.scaleToWidth(size);
            img.scaleToWidth(size);
            var patternSourceCanvas = new fabric.StaticCanvas();
            patternSourceCanvas.add(img);
            
            patternSourceCanvas.setDimensions({
                width: img.getWidth(),
                height: img.getHeight()
            });

            //----- PATTERN NEW OBJECT
            var pattern = new fabric.Pattern({
                source: function() { 
                    return patternSourceCanvas.getElement();
                },
                repeat: 'repeat'
            });*/

            // IMPORTANT! ----- BLOCK OF CODE ENDS
            // =========================================================================================

            // patchNumInput will be the patchNum for the tile. If it's a patch, it'll be a number. If not, it'll be the assigned string
            var patchNumInput = "Not Patch";
            // bool variable to check if, if statement "if(allObjects[i].tilePatchNum >= highestPatchNum)" has been entered
            var enteredBool = false;

            // Checks to see if tile is a patch
            if(tileName == CanvasModule.getCanvasPatchName())
            {
                // If there's an already saved canvas, go through this if statement
                if(jsonCanvas != null)
                {
                    // Parse the garden JSON
                    var gardenJSON = $.parseJSON(jsonCanvas);
                    // Assign the key 'objects' to allObjects
                    var allObjects = gardenJSON['objects'];
                    // highestPatchNum
                    var highestPatchNum = patchNum;
                    
                    // Loop through all objects
                    for(i = 0; i < allObjects.length; i++)
                    {
                        // Check if any of the objects contain a patch
                        if(allObjects[i].tileType == CanvasModule.getCanvasPatchName())
                        {
                            // Check if the patchNum for that tile is higher than the highestPatchNum
                            if(allObjects[i].tilePatchNum >= highestPatchNum)
                            {
                                // Asssign new Highest Patch Number
                                highestPatchNum = allObjects[i].tilePatchNum;
                                patchNum = highestPatchNum + 1;
                                enteredBool = true;
                            }
                        }
                    };
                }

                // If a new highest patch number has been applied
                // then the algorithm with incrementing the patch number has been entered
                if(!enteredBool)
                {
                    // increment patch number
                    patchNum = patchNum + 1;
                }

                // Assign the patchNum to the patchNumInput
                patchNumInput = patchNum;    
            }        
            
            createSubClass();

            // create an instance of the TileRect 
            var _rect = new fabric.TileRect({
                name: tileName,
                tileType: tileName,
                tilePatchNum: patchNumInput,
                width: size,
                height: size,
                left: 0,
                top: 0,
                angle: 0,
                stroke: 'green',
                strokeWidth: 6,
            });

            _rect.setPatternFill({
                source: img,
                repeat: 'repeat'
            });

            canvas.add(_rect);
            saveCanvas();
        });
    }

    canvas.on('object:selected', function(e) {

        var obj;
        obj = e.target;
    });


    //controlled movement

    canvas.on('object:moving', function(e) {

        var obj;
        obj = e.target;
        // if object is too big ignore
        if(obj.currentHeight > obj.canvas.height || obj.currentWidth > obj.canvas.width){
            return;
        }  
        
        obj.setCoords();

        //repositions left to pixel of the multiple of leftPixels
        var leftPixels = 10;
        var topPixels = 10;
        canvas.getActiveObject().left = Math.ceil(obj.left/leftPixels)*leftPixels;
        canvas.getActiveObject().top = Math.ceil(obj.top/topPixels)*topPixels;
        //canvas.getActiveObject().angle = 150;
        positionBtn(obj); 

        saveCanvasDelay(1000);
    });

    //controlled rotation

    canvas.on('object:rotating', function(e) {

        var obj = e.target;

        var fixedRotation = 20;
        canvas.getActiveObject().angle = Math.ceil(obj.angle/fixedRotation)*fixedRotation;
        
        obj.setCoords();

        saveCanvasDelay(1000);
    });

    canvas.on('object:scaling', function(e){

        var obj = e.target;
        var snapPixels = 10;

        obj.setCoords();

        obj.width *= obj.scaleX;
        obj.height *= obj.scaleY;

        // Revert back to 1 to prevent negative scaling
        // to prevent bug #3  
        obj.scaleX = 1;
        obj.scaleY = 1;

        positionBtn(obj);

        saveCanvasDelay(1000);
    })

    var _img1;

    canvas.on('mouse:over', function (e) {
        var obj;
        obj = e.target;
    });

    canvas.on('mouse:down', function (e) {
        var obj;
        obj = e.target;
        if(obj != null){
            positionBtn(obj);
            obj.moveTo(10);
            if(obj.tileType == "grass_tile")
            {
                canvas.sendToBack(obj, true);
            }
        }
    });
    
    canvas.on('mouse:out', function (e) {
        //canvas.remove(_img1);
        var obj;
        obj = e.target;
    });

    loadGardenLayout(3000, 2000);

    // ==================================================
    // FUNCTIONS ---- Functions for setting up the canvas
    // ==================================================

    function saveCanvasDelay(delayTime)
    {
        if(!_isSavingDelay)
        {
             _isSavingDelay = true;
            setTimeout(function() {
                saveCanvas();
                _isSavingDelay = false;
            }, delayTime);
        }
    }

    function saveCanvas() {
        // convert canvas to a json
        jsonCanvas = canvas.toJSON();

        // convert canvas to json string
        jsonCanvasString = JSON.stringify( canvas.toJSON() );

        // Assign the key 'objects' to allObjects
        var allObjects = jsonCanvas['objects'];
        var allPatches = [];

        // Loop through all objects
        for(i = 0; i < allObjects.length; i++)
        {
            // Check if any of the objects contain a patch
            if(allObjects[i].tileType == CanvasModule.getCanvasPatchName())
            {
                var obj = {
                    patchName: allObjects[i].name,
                    patchNum: allObjects[i].tilePatchNum
                };
                allPatches.push(obj);
            }
        };

        $.ajax({
            type: "POST",
            cache: false,
            url : config.routes[0].layoutSave,
            data: { 
                canvasData : jsonCanvasString,
                patchData: allPatches
            },
            beforeSend: function (xhr) {
                // Function needed from Laravel because of the CSRF Middleware
                var token = $('meta[name="csrf_token"]').attr('content');

                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            success: function(data) {
                jsonCanvas = data.canvas;
            },
            error: function(xhr, status, error){
                // no error handling done
                // preferably have a pop-up notifying user that the garden has not been saved.
            },
        });
    }

    function loadCanvas(milSecsWait) {
        // parse the data into the canvas
        $.ajax({
            type: "POST",
            cache: false,
            url : config.routes[0].layoutLoad,
            data: "",
            beforeSend: function (xhr) {
                // Function needed from Laravel because of the CSRF Middleware
                var token = $('meta[name="csrf_token"]').attr('content');

                if (token) {
                    return xhr.setRequestHeader('X-CSRF-TOKEN', token);
                }
            },
            success: function(data) {
                if(data.msg != '')
                {
                    jsonCanvas = data.msg;
                    
                    // temp. adds a tile (applies new classes made and avoid errors)
                    createSubClass();

                    // first load JSON to show tiles
                    canvas.clear();
                    canvas.loadFromJSON(data.msg, canvas.renderAll.bind(canvas));

                    setTimeout(function() {
                        // second load JSON to show images
                        canvas.clear();
                        canvas.loadFromJSON(data.msg, canvas.renderAll.bind(canvas));
                    }, milSecsWait);
                }
                else
                {
                    setTimeout(function() {
                        canvas.renderAll();
                    }, milSecsWait);
                }
            },
            error: function(xhr, status, error){
                // no error handling done
                // preferably have a pop-up notifying user that the garden has not been loaded.
            },
        });  
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
            $('#edit-off-btn').prop('disabled', false);
            CanvasModule.changeCanvas(canvas);
            CanvasModule.setLockSelectables();
        }, milSecsSwitchWait);        
    }

    function positionBtn(obj) 
    {
        $("#tile-name").html("<b>Name: </b>" + truncateString(obj.name, 23));
    }

    function repositionTile(position)
    {
        if(position == "forwards"){
            canvas.bringForward(canvas.getActiveObject(), true);
        }
        if(position == "backwards"){
            canvas.sendBackwards(canvas.getActiveObject(), true);
        }
        if(position == "toFront"){
            canvas.bringToFront(canvas.getActiveObject(), true);
        }
        if(position == "toBack"){
            canvas.sendToBack(canvas.getActiveObject(), true);
        }
    }

    function deleteTilePopup(obj)
    {
        if(obj.tileType == CanvasModule.getCanvasPatchName())
        {
            var deleteTileDesc = "You are about to delete a <b>patch</b>. Deleting this patch will also delete <b>ALL OF THE CURRENT ACTIVITIES YOU HAVE SET FOR IT</b>.<br/><br/> Do you wish to continue?";
            var deleteTileTitle = "Delete " + obj.name;
        }
        else
        {
            var deleteTileDesc = "You are about to delete a tile. Do you wish to continue?";
            var deleteTileTitle = "Delete " + obj.name;
        }
        
        popupModule.setPopupTitle(deleteTileTitle);
        popupModule.setPopupDesc(deleteTileDesc);
        
        $("#popup-remove-tile-title").html(popupModule.getPopupTitle());
        $("#popup-remove-tile-desc").html(popupModule.getPopupDesc());
        popupModule.changePopupSelected(true);
    }
    
    function createSubClass()
    {
        CanvasModule.setTileRectSubClass();
        CanvasModule.setAbsoluteCoords();
    }

    function truncateString(str, length) {
        return str.length > length ? str.substring(0, length - 3) + '...' : str
    }
	
	function parseContent(html){
		return $($.parseHTML(html)).text();
	}

});


