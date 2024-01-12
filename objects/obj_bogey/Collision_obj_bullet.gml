/// @description Take damage
if (!other.friendly) {
	return
}

life -= 1

instance_destroy(other)

if (life == 0) {
	instance_destroy()
	obj_money_display.money += 100
}
