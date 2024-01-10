/// @description Take damage
healthh -= 1

instance_destroy(other)

if (healthh == 0) {
	instance_destroy()
}