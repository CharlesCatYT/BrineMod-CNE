var colorTween:FlxTween;

function onEvent(e) {
    if (e.event.name == "Blammed Lights" || "Blammed_Lights" || "Pibby Corrupted Event") {
        coolColor = e.event.params[1];
        if (e.event.params[0] == true) blammed(); //ME WHEN THE BLAMMED ARE LIGHTS 🔥🔥🔥🔥🔥🔥🔥🔥🔥
        if (e.event.params[0] == false) unblammed(); //the blammed arent lights...
    }
}

function create() {
    blackBG = new FlxSprite(0, 0).makeGraphic(Std.int(FlxG.width * 1), Std.int(FlxG.height * 1), FlxColor.BLACK);
	blackBG.scale.set(5, 5);
	insert(members.indexOf(dad), blackBG); //who cares for gf??
	blackBG.alpha = 0;
} 

function blammed() {
    FlxTween.tween(blackBG, {alpha: 1}, 1, {ease: FlxEase.quintOut});
    for (i in [dad, boyfriend])
    colorTween = FlxTween.color(i, 1, FlxColor.WHITE, coolColor, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){colorTween = null;}});
}

function unblammed() {
    FlxTween.tween(blackBG, {alpha: 0}, 1, {ease: FlxEase.quintOut});
    for (i in [dad, boyfriend]) //who cares for gf?? 3
    colorTween = FlxTween.color(i, 1, coolColor, FlxColor.WHITE, {ease: FlxEase.quintOut, onComplete: function(twn:FlxTween){colorTween = null;}});
}