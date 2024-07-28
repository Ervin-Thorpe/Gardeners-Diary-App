var CanvasModule = (function () {

    var canvas; // Private Variable
    var canvasBG = new Image();
        canvasBG.src = '../../images/800x800_grid_40m_2px.jpg'; // default image
    var canvasSize = [600,600]; // default size
    var canvasLocked = true;
    var canvasPatchName = "patch_tile";
    var objectBorderColor = "#ff00ff";
    var objectCornerColor = "#ff0000";

    var pub = {}; // public object - returned at end of module

    pub.changeCanvas = function (newCanvas) {
        canvas = newCanvas;
    };

    pub.getCanvas = function() {
        return canvas;
    }

    pub.changeCanvasBG = function (url) {
        canvasBG.src = url;
    }

    pub.getCanvasBG = function() {
        return canvasBG;
    }

    pub.changeCanvasSize = function (width, height) {
        canvasSize = [width, height];
    }

    pub.getCanvasSize = function() {
        return canvasSize;
    }

    pub.changeCanvasLocked = function (locked) {
        if(locked) { lockSelectables(); }
        else if(!locked) { unlockSelectables(); }

        canvasLocked = locked;    
    }

    pub.getCanvasLocked = function () {
        return canvasLocked;
    }
    
    pub.changeCanvasPatchName = function (newCanvasPatchName) {
        canvasPatchName = newCanvasPatchName;
    }

    pub.getCanvasPatchName = function() {
        return canvasPatchName;
    }

    pub.setTileRectSubClass = function () {
        // Create our own Rect class as a SUBCLASS OF RECT
        fabric.TileRect = fabric.util.createClass(fabric.Rect, {
            type: 'tile-rect',
            
            // initialize the extra attributes we're going to add to the subclass
            initialize: function(element, options) {
                this.callSuper('initialize', element, options);
                options && this.set('name', options.name) && this.set('tileType', options.tileType) && this.set('tilePatchNum', options.tilePatchNum);
            },

            // Add these extra attributes to our object
            toObject: function() {
                return fabric.util.object.extend(this.callSuper('toObject'), { 
                    name: this.name,
                    tileType: this.tileType,
                    tilePatchNum: this.tilePatchNum
                });
            }
        });  

        // get our class we created
        fabric.TileRect.fromObject = function(object, callback) {
            callback && callback(new fabric.TileRect(object));
        };

        // ensure it's created async
        fabric.TileRect.async = true;
    }

    pub.setAbsoluteCoords = function() {
        // Create absoluteCoords
        fabric.Canvas.prototype.getAbsoluteCoords = function(object) {
            return {
                left: object.left + this._offset.left,
                top: object.top + this._offset.top
            };
        }
    }

    pub.setObjectEdit = function() {
        fabric.Object.prototype.transparentCorners = false;
        fabric.Object.prototype.set({
            transparentCorners: false,
            borderColor: objectBorderColor,
            cornerColor: objectCornerColor
        });
    }

    pub.changeObjectEditBorderColor = function(newObjectBorderColor) {
        objectBorderColor = newObjectBorderColor;
    }

    pub.changeObjectEditCornerColor = function(newObjectCornerColor) {
        objectCornerColor = newObjectCornerColor;
    }

    pub.setFakeLoadingScreen = function (milSecsSwitchWait, milSecsWait, elementName) {
        var start = new Date();
        var maxTime = milSecsWait;
        var timeoutVal = Math.floor(maxTime/100);

        animateUpdate();

        function updateProgress(percentage) 
        {
            $(elementName).progressbar({
                value: percentage,
                create: function(event, ui) {$(this).find('.ui-widget-header').css({'background-color':'rgba(77, 132, 0, 1)'})}
            });
        }

        function animateUpdate() 
        {
            var now = new Date();
            var timeDiff = now.getTime() - start.getTime();
            var perc = Math.round((timeDiff/maxTime)*100);
            if (perc <= 100) {
                updateProgress(perc);
                setTimeout(animateUpdate, timeoutVal);
            }
        }
    }

    pub.setLockSelectables = function()
    {
        lockSelectables();
    }

    pub.setUnlockSelectables = function ()
    {
        unlockSelectables();
    }

    function lockSelectables()
    {
        if(canvas != null)
        {
            for(var i = 0; i < canvas._objects.length; i++)
            {
                if(canvas.item(i).tileType != canvasPatchName)
                {
                    canvas.item(i).selectable = false;
                }
                
                if(canvas.item(i).tileType == canvasPatchName)
                {
                    canvas.item(i).on('selected', function() 
                    {
                        if(CanvasModule.getCanvasLocked())
                        {
                            window.location.href = config.routes[0].gardenActivities;
                        }
                    })
                }   
            }
        }
    }

    function unlockSelectables()
    {
        if(canvas != null)
        {
            for(var i = 0; i < canvas._objects.length; i++){
                canvas.item(i).selectable = true;
            }
        }
    }

    return pub; // expose externally
}());
