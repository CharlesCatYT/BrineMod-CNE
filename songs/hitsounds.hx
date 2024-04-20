function onPlayerHit(a)
	  if (!a.note.isSustainNote)
	    FlxG.sound.play(Paths.sound('hitsounds/hitsound_psych'), 0.5);