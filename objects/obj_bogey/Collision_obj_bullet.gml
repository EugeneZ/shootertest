/// @description Take damage, maybe die?
life -= 1
audio_play_sound(snd_hit,0,false,1,0,random_range(0.9,1))

if (life == 0) {
	instance_destroy()
	global.p_money += 100
	audio_play_sound(snd_death,0,false,1,0,2)
}
