import flixel.FlxG;
import funkin.editors.ui.UIText;
import funkin.editors.ui.UISlider;
import funkin.editors.ui.UITopMenu;

var bottomMenuSpr:UITopMenu;
var volumeButton:UITopMenuButton; 

var instVolumeText:UIText;
var instVolumeSlider:UISlider;

var vocalsVolumeText:UIText;
var vocalsVolumeSlider:UISlider;

var sliderWidth:Int = 100;
var trackedInstVolume:Int = 1;
var trackedVoicesVolume:Int = 1;

function muteinst(t) {
    if (FlxG.sound.music.volume > 0)
        trackedInstVolume = FlxG.sound.music.volume;

    FlxG.sound.music.volume = FlxG.sound.music.volume > 0 ? 0 : trackedInstVolume;
	t.icon = 1 - Std.int(Math.ceil(FlxG.sound.music.volume));

    instVolumeSlider.value = FlxG.sound.music.volume;
}

function mutevoices(t) {
    trace("hi (voices in my head)!");
    if (vocals.volume > 0)
        trackedVoicesVolume = vocals.volume;

    vocals.volume = vocals.volume > 0 ? 0 : trackedVoicesVolume;
	for (strumLine in strumLines.members) strumLine.vocals.volume = strumLine.vocals.volume > 0 ? 0 : trackedVoicesVolume;

	t.icon = 1 - Std.int(Math.ceil(vocals.volume));
    vocalsVolumeSlider.value = vocals.volume;
}

var volumeIndex:Int = 4;
var volumeOptions:Map<String, Void> = ["Mute instrumental" => muteinst, "Mute voices" => mutevoices];

function postCreate()
{
    bottomMenuSpr = new UITopMenu([]);
    bottomMenuSpr.cameras = [uiCamera];
    bottomMenuSpr.y = FlxG.height - bottomMenuSpr.bHeight;

    instVolumeText = new UIText(4, bottomMenuSpr.y, 0, "Instrumental Volume");
    instVolumeText.y = Std.int(bottomMenuSpr.y + ((bottomMenuSpr.bHeight - instVolumeText.height) / 2));
    instVolumeText.cameras = [uiCamera];

    instVolumeSlider = new UISlider(30, FlxG.height - 19, sliderWidth, 1, [{start: 0, end: 1, size: 1}], false);
    instVolumeSlider.x = (instVolumeText.x + instVolumeText.width) + 30 + instVolumeSlider.valueStepper.bWidth;
    
    instVolumeSlider.onChange = function (v) {
        FlxG.sound.music.volume = v;
    };

    vocalsVolumeText = new UIText((instVolumeSlider.x + (sliderWidth + 100)) + 4, bottomMenuSpr.y, 0, "Vocals Volume");
    vocalsVolumeText.y = Std.int(bottomMenuSpr.y + ((bottomMenuSpr.bHeight - vocalsVolumeText.height) / 2));
    vocalsVolumeText.cameras = [uiCamera];
    
    vocalsVolumeSlider = new UISlider(30, FlxG.height - 19, sliderWidth, 1, [{start: 0, end: 1, size: 1}], false);
    vocalsVolumeSlider.x = (instVolumeSlider.x + instVolumeSlider.width) + (vocalsVolumeText.x + vocalsVolumeText.width) + 30 + vocalsVolumeSlider.valueStepper.bWidth;

    vocalsVolumeSlider.onChange = function (v) {
        vocals.volume = v;
        for (strumLine in strumLines.members) strumLine.vocals.volume = v;
    };

    insert(members.indexOf(uiGroup)-1, bottomMenuSpr);

    uiGroup.add(instVolumeText);
    uiGroup.add(instVolumeSlider);

    uiGroup.add(vocalsVolumeText);
    uiGroup.add(vocalsVolumeSlider);

    trace(volumeOptions);

    volumeButton = topMenuSpr.members[volumeIndex];
    if (volumeButton != null)
        for (obj in volumeButton.contextMenu)
            if (obj != null && volumeOptions[obj.label] != null)
                obj.onSelect = volumeOptions[obj.label];

    scrollBar.scale.y = Std.int(FlxG.height - (bottomMenuSpr.bHeight * 2));
    scrollBar.updateHitbox();
}

function update(elapsed) {
    instVolumeSlider.x = (instVolumeText.x + instVolumeText.width + 4) + 30 + instVolumeSlider.valueStepper.bWidth;
    vocalsVolumeSlider.x = (vocalsVolumeText.x + vocalsVolumeText.width + 4) + 30 + vocalsVolumeSlider.valueStepper.bWidth;
}