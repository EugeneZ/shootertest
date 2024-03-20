/// @description Sounds Loaded
if (audio_group_is_loaded(ag_music))
{
	audio_play_sound(snd_soundtrack1,1000,true);
	control = true;
}

if (audio_group_is_loaded(ag_sfx))
{
	sfx_loaded = true;
	if (obj_ship)
	{
		audio_play_sound_on(reverb_emitter,snd_jet_engine,true,1000)
	}
}

