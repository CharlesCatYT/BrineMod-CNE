var amountToChangeBy:Float = 0.2;

var _underlays:Array<FunkinSprite> = [];
var _underlayAlpha:Float = 0;

function postCreate() {
	for (sl in strumLines.members) {
		if (!sl.visible) continue;
		var underlay = new FunkinSprite(sl.members[0].x-10, 0).makeSolid(Note.swagWidth*sl.members.length+20, FlxG.height, 0xFF000000);
		underlay.alpha = _underlayAlpha;
		underlay.scrollFactor.set();
		insert(0, underlay);
		underlay.cameras = [camHUD];
		_underlays.push(underlay);
	}
}

function update(e) {
	if (FlxG.keys.justPressed.LBRACKET || FlxG.keys.justPressed.RBRACKET) {
		_underlayAlpha = FlxMath.bound(_underlayAlpha + (amountToChangeBy * (FlxG.keys.justPressed.LBRACKET ? -1 : 1)), 0, 1);
		for (underlay in _underlays)
			underlay.alpha = _underlayAlpha;
		FlxG.sound.play(Paths.sound("editors/charter/metronome"));
	}
}