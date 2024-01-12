/// @description Take damage
healthh -= 1

instance_destroy(other)

if (healthh == 0) {
	instance_destroy()
	obj_money_display.money += 100
}
