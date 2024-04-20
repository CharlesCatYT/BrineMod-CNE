import funkin.backend.utils.NativeAPI;
import funkin.backend.system.framerate.Framerate;

static var initialized:Bool = false;
static var fromGame:Bool = false; // for things you can go to through the pause screen and whatever

static function convertTime(steps:Float, beats:Float, sections:Float):Float {
	return ((Conductor.stepCrochet * steps) / 1000 + (Conductor.stepCrochet * (beats * 4)) / 1000 + (Conductor.stepCrochet * (sections * 16)) / 1000) - 0.01;
}

function new() {
	window.title = "Made with Codename Engine";
	var brineSave = FlxG.save.data;

	// for the psych ui options
	if (brineSave.Splashes == null) brineSave.Splashes = 0;
	if (brineSave.PauseMusic == null) brineSave.PauseMusic = 0;
	if (brineSave.botplayOption == null) brineSave.botplayOption = false;
	if (brineSave.colouredBar == null) brineSave.colouredBar = false;
	if (brineSave.showBar == null) brineSave.showBar = false;
	if (brineSave.showTxt == null) brineSave.showTxt = false;
}

function postUpdate(delta:Float) {
	// here for debugging purposes i think
	if (FlxG.keys.justPressed.F6) NativeAPI.allocConsole(); // CONSOLE
	if (FlxG.keys.justPressed.F5) FlxG.resetState(); // RESETTING STATES
}

function postStateSwitch()
	Framerate.debugMode = 1;

function preStateSwitch() {
    FlxG.camera.bgColor = 0xFF000000;
window.title = "brine mod";
}