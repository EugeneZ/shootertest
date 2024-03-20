if (global.p_health <= 0 && !game_over) {
	instance_destroy(obj_ship);
	game_over = true;
	audio_play_sound(snd_death,1,false);
	//audio_stop_sound(snd_jet_engine);
}