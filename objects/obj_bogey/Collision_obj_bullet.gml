/// @description Take damage, maybe die?
life -= 1

if (life == 0) {
	instance_destroy()
	obj_money.money += 100
}
