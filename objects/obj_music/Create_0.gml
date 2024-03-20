///@desc Load Music + Setup

//Load Audio Groups
audio_group_load(ag_music);
audio_group_load(ag_sfx);

//Audio Arrays
music = [snd_soundtrack1];
sfx = [snd_shoot,snd_hit,snd_death,snd_jet_engine];

//Set Initial Volume Levels
music_volume = 1;
sfx_volume = 1;

//
control = false;
music_target = 0;
sfx_loaded = false;
music_playing = snd_soundtrack1

// Reverb Bus Route
reverb_emitter = audio_emitter_create();
reverb_bus = audio_bus_create();
audio_emitter_bus(reverb_emitter,reverb_bus);

// Reverb Settings
var _reverb_effect = audio_effect_create(AudioEffectType.Reverb1);
_reverb_effect.mix = 0.7;
reverb_bus.effects[0] = _reverb_effect;