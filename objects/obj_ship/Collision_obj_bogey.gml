/// @description Take damage
obj_health_display.life -= other.life * 3

instance_destroy(other)

if (obj_health_display.life == 0) {
	instance_destroy()
	game_end()
}
