/// @description Take damage
obj_health_display.life -= 1

instance_destroy(other)

if (obj_health_display.life == 0) {
	instance_destroy()
	game_end()
}
