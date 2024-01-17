/// @description Take damage, maybe die?
life -= 1

if (life == 0) {
	instance_destroy()
	global.p_money += 100
}
