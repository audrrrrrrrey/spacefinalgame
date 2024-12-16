global.sfx_vol = 1;
global.bgm_vol = 1;

function PlaySFX(sfx){
	if (!audio_is_playing(sfx)) {
		audio_play_sound (sfx, 0, 0, global.sfx_vol);
	}
}

function PlayBGM(bgm, is_looping){
	if (!audio_is_playing(bgm)) {
		audio_play_sound (bgm, 0, is_looping, global.bgm_vol);
	}
}

function StopSFX (sfx) {
	if (audio_is_playing(sfx)) {
		audio_stop_sound(sfx);
	}
}