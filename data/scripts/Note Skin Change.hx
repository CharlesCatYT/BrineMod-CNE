public function changePlayerSkin(skin) {
	frames = Paths.getSparrowAtlas("game/notes/" + skin);

	for (strum in playerStrums) {
		strum.frames = frames;
		strum.antialiasing = true;
		strum.setGraphicSize(Std.int(frames.width * 0.7));
		var animPrefix = playerStrums.strumAnimPrefix[strum.ID % playerStrums.strumAnimPrefix.length];
		strum.animation.addByPrefix("static", "arrow" + animPrefix.toUpperCase());
		strum.animation.addByPrefix("pressed", animPrefix + " press", 24, false);
		strum.animation.addByPrefix("confirm", animPrefix + " confirm", 24, false);
		strum.updateHitbox();
		strum.playAnim("static");
	}

	for (note in playerStrums.notes) {
		note.frames = frames;

		switch (note.noteData % 4) {
			case 0:
				note.animation.addByPrefix("scroll", "purple0");
				note.animation.addByPrefix("hold", "purple hold piece");
				note.animation.addByPrefix("holdend", "pruple end hold");
			case 1:
				note.animation.addByPrefix("scroll", "blue0");
				note.animation.addByPrefix("hold", "blue hold piece");
				note.animation.addByPrefix("holdend", "blue hold end");
			case 2:
				note.animation.addByPrefix("scroll", "green0");
				note.animation.addByPrefix("hold", "green hold piece");
				note.animation.addByPrefix("holdend", "green hold end");
			case 3:
				note.animation.addByPrefix("scroll", "red0");
				note.animation.addByPrefix("hold", "red hold piece");
				note.animation.addByPrefix("holdend", "red hold end");
		}

		note.scale.set(0.7, 0.7);
		note.antialiasing = true;
		note.updateHitbox();

		if (note.isSustainNote) {
			note.animation.play("holdend");
			note.updateHitbox();

			if (note.nextSustain != null)
				note.animation.play('hold');
		} else
			note.animation.play("scroll");
	}
}

public function changeCPUSkin(skin) {
	frames = Paths.getSparrowAtlas("game/notes/" + skin);

	for (strum in cpuStrums) {
		strum.frames = frames;
		strum.antialiasing = true;
		strum.setGraphicSize(Std.int(frames.width * 0.7));
		var animPrefix = cpuStrums.strumAnimPrefix[strum.ID % cpuStrums.strumAnimPrefix.length];
		strum.animation.addByPrefix("static", "arrow" + animPrefix.toUpperCase());
		strum.animation.addByPrefix("pressed", animPrefix + " press", 24, false);
		strum.animation.addByPrefix("confirm", animPrefix + " confirm", 24, false);
		strum.updateHitbox();
		strum.playAnim("static");
	}

	for (note in cpuStrums.notes) {
		note.frames = frames;

		switch (note.noteData % 4) {
			case 0:
				note.animation.addByPrefix("scroll", "purple0");
				note.animation.addByPrefix("hold", "purple hold piece");
				note.animation.addByPrefix("holdend", "pruple end hold");
			case 1:
				note.animation.addByPrefix("scroll", "blue0");
				note.animation.addByPrefix("hold", "blue hold piece");
				note.animation.addByPrefix("holdend", "blue hold end");
			case 2:
				note.animation.addByPrefix("scroll", "green0");
				note.animation.addByPrefix("hold", "green hold piece");
				note.animation.addByPrefix("holdend", "green hold end");
			case 3:
				note.animation.addByPrefix("scroll", "red0");
				note.animation.addByPrefix("hold", "red hold piece");
				note.animation.addByPrefix("holdend", "red hold end");
		}

		note.scale.set(0.7, 0.7);
		note.antialiasing = true;
		note.updateHitbox();

		if (note.isSustainNote) {
			note.animation.play("holdend");
			note.updateHitbox();

			if (note.nextSustain != null)
				note.animation.play('hold');
		} else
			note.animation.play("scroll");
	}
}