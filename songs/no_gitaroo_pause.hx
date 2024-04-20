// just copied this from source but removed the gitaroo part
function onGamePause(e) {
	e.cancel();

	persistentUpdate = false;
	persistentDraw = true;
	paused = true;

	openSubState(new PauseSubState());

	updateDiscordPresence();
}