var __baseIconScale:Float = 1;

var __scale:Float = 1.2;

var __lerpSpeed:Float = 0.25;

var __crochetBased:Bool = true;

var __iconScale:Float = __baseIconScale;

function postUpdate() {
    __iconScale = lerp(__iconScale, __baseIconScale, __lerpSpeed);
    iconP1.scale.set(__iconScale, __iconScale);
    iconP2.scale.set(__iconScale, __iconScale);
}

function beatHit() {
    __iconScale = __scale;
    if (!__crochetBased) return;
   __lerpSpeed = Conductor.crochet * 0.001;
}

function lerp(a:Float, b:Float, ratio:Float):Float {
    return FlxMath.lerp(a, b, FlxG.elapsed / (1 / 60) * ratio);
}