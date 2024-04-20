public function robloxLerp(a:Float,b:Float,c:Float) {
    return a+(b-a)*c;
}

public function psychBoundTo(value:Float,min:Float,max:Float) { //close to clamp
    return Math.max(min, Math.min(max, value));
}

public function clamp(value:Float, min:Float, max:Float) { //?
    return Math.min(Math.max(value, min), max);
}

public function leatherBoundTo(v:Float,min:Float,max:Float){
    var nv:Float = v;

    if(nv < min)
        nv = min;
    else if(nv > max)
        nv = max;
    
    return nv;
}