/// @description Change Volumes / Playing Sounds
// You can write your code in this editor



// Player Engine Sounds
var _up = keyboard_check(ord("W"))
var _down = keyboard_check(ord("S"))
var _left = keyboard_check(ord("A"))
var _right = keyboard_check(ord("D"))
var _space = keyboard_check(ord(" "))



if (_up) {
	audio_sound_pitch(snd_jet_engine,2)
}

if (_down) {
audio_sound_pitch(snd_jet_engine,.5)
}

if (_left) {
audio_sound_pitch(snd_jet_engine,1.5)
} 

if (_right) {
audio_sound_pitch(snd_jet_engine,1.5)
} 
else if (!_up && !_down && !_left && !_right) 
{
	audio_sound_pitch(snd_jet_engine,1)
}


// Stop Player Ship Sound
if (global.p_health <= 0) 
{
		audio_stop_sound(snd_jet_engine);
}